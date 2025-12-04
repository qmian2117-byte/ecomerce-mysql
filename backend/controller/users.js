const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const dotenv = require("dotenv");
const sendemail = require("../utility/sendemail");
const User = require("../model/users");
const Token = require("../model/token");

dotenv.config();

// Helper to wrap callback in a Promise
const toPromise = (fn, ...args) =>
  new Promise((resolve, reject) =>
    fn(...args, (err, result) => (err ? reject(err) : resolve(result)))
  );

// ✅ Get all users (admin only)
const getusers = async (req, res) => {
  try {
    const users = await toPromise(User.getAll);
    res.status(200).json(users);
  } catch (error) {
    res.status(500).json({ message: "Database error", error: error.message });
  }
};

// ✅ Get user by ID
const getUserid = async (req, res) => {
  try {
    const id = req.params.id;
    const results = await toPromise(User.getById, id);
    if (!results.length) return res.status(404).json({ message: "User not found" });
    res.status(200).json(results[0]);
  } catch (error) {
    res.status(500).json({ message: "Internal server error", error: error.message });
  }
};

// ✅ Delete user
const userdel = async (req, res) => {
  try {
    const id = req.params.id;
    const result = await toPromise(User.delete, id);
    if (result.affectedRows === 0) return res.status(404).json({ message: "User not found" });
    res.status(200).json({ message: "User deleted" });
  } catch (error) {
    res.status(500).json({ message: "Internal server error", error: error.message });
  }
};

// ✅ Signup user
const signupUser = async (req, res) => {
  try {
    const { firstName, lastName, email, password } = req.body;

    if (!firstName || !lastName || !email || !password)
      return res.status(400).json({ message: "All fields are required" });

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email))
      return res.status(400).json({ message: "Invalid email format" });

    const gmailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
    if (!gmailPattern.test(email))
      return res.status(400).json({ message: "Only Gmail addresses allowed" });

    if (password.length < 6)
      return res.status(400).json({ message: "Password must be at least 6 characters" });

    // Check if email exists
    const existingUsers = await toPromise(User.getByEmail, email);
    if (existingUsers.length > 0) return res.status(400).json({ message: "Email already exists" });

    const hashedPassword = await bcrypt.hash(password, 10);
    const otp = Math.floor(100000 + Math.random() * 900000).toString();

    const newUserData = {
      firstName,
      lastName,
      email,
      password: hashedPassword,
      role: "user",
      status: "deactive",
      otp,
    };

    const result = await toPromise(User.create, newUserData);

    try {
      await sendemail(email, "Your OTP Code", firstName, otp);
    } catch (err) {
      console.error("Failed to send OTP email:", err);
    }

    const token = jwt.sign(
      { id: result.insertId, email, role: "user" },
      process.env.JWT_SECRET,
      { expiresIn: "7d" }
    );

    res.status(201).json({
      message: "User created successfully. OTP sent to email.",
      data: { token, user: { id: result.insertId, firstName, lastName, email } },
    });
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

// ✅ Login user
const logininUser = async (req, res) => {
  try {
    const { email, password } = req.body;
    if (!email || !password)
      return res.status(400).json({ message: "Email and password required" });

    const users = await toPromise(User.getByEmail, email);
    if (users.length === 0) return res.status(401).json({ message: "Invalid email or password" });

    const user = users[0];
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(401).json({ message: "Invalid email or password" });

    const token = jwt.sign(
      { id: user.id, email: user.email, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: "7d" }
    );

    res.status(200).json({
      message: "Login successful",
      data: { token, user },
    });
  } catch (error) {
    res.status(500).json({ message: "Internal server error", error: error.message });
  }
};

// ✅ Update user
const userupdate = async (req, res) => {
  try {
    const id = req.params.id;
    const result = await toPromise(User.update, id, req.body);
    if (result.affectedRows === 0) return res.status(404).json({ message: "User not found" });
    res.status(200).json({ message: "User updated successfully" });
  } catch (error) {
    res.status(500).json({ message: "Internal server error", error: error.message });
  }
};

// ✅ Password reset request
const requestPasswordReset = async (req, res) => {
  try {
    const { email } = req.body;
    const users = await toPromise(User.getByEmail, email);
    if (!users.length) return res.status(404).json({ message: "User not found" });

    const user = users[0];
    const resetToken = crypto.randomBytes(32).toString("hex");
    const expiresAt = new Date(Date.now() + 60 * 60 * 1000); // 1 hour

    await toPromise(Token.create, { userId: user.id, token: resetToken, status: true, expiresAt });

    const resetLink = `${process.env.FRONTEND_URL}/reset-password/${resetToken}`;
    await sendemail(user.email, "Password Reset Request", user.firstName, resetLink);

    res.status(200).json({ message: "Password reset link sent to email" });
  } catch (error) {
    res.status(500).json({ message: "Internal server error", error: error.message });
  }
};

// ✅ Reset password
const resetPassword = async (req, res) => {
  try {
    const { token, newpassword } = req.body;
    if (!token || !newpassword)
      return res.status(400).json({ message: "Token and new password required" });

    const tokens = await toPromise(Token.getByToken, token);
    if (!tokens.length || !tokens[0].status || new Date(tokens[0].expiresAt) <= new Date())
      return res.status(400).json({ message: "Invalid or expired token" });

    const userId = tokens[0].userId;
    const hashedPassword = await bcrypt.hash(newpassword, 10);
    await toPromise(User.update, userId, { password: hashedPassword });

    // Mark token as used
    await toPromise(Token.update, tokens[0].id, { status: false, expiresAt: new Date() });

    res.status(200).json({ message: "Password reset successful" });
  } catch (error) {
    res.status(500).json({ message: "Internal server error", error: error.message });
  }
};

module.exports = {
  getusers,
  getUserid,
  userupdate,
  userdel,
  signupUser,
  logininUser,
  requestPasswordReset,
  resetPassword
};
