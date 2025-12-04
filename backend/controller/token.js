const crypto = require("crypto");
const Token = require("../model/token"); // MySQL Token model

// Create token
let createToken = async (userId) => {
  try {
    const tokenValue = crypto.randomBytes(32).toString("hex"); // Secure random token
    const expiresAt = new Date(Date.now() + 24 * 60 * 60 * 1000); // Optional: 24h expiry

    return new Promise((resolve, reject) => {
      Token.create(
        { userId, token: tokenValue, status: true, expiresAt },
        (err, result) => {
          if (err) {
            console.error("Error creating token:", err);
            return resolve({ success: false, error: err.message });
          }
          resolve({ success: true, token: tokenValue });
        }
      );
    });
  } catch (error) {
    console.error("Error creating token:", error);
    return { success: false, error: error.message };
  }
};

// Verify token
let verifyToken = async (tokenValue) => {
  try {
    return new Promise((resolve, reject) => {
      Token.getByToken(tokenValue, (err, results) => {
        if (err) {
          console.error("Error verifying token:", err);
          return resolve({ success: false, error: err.message });
        }

        if (!results.length) {
          return resolve({ success: false, message: "Invalid or expired token" });
        }

        const tokenData = results[0];

        // Check if token is active and not expired
        if (!tokenData.status || new Date(tokenData.expiresAt) <= new Date()) {
          return resolve({ success: false, message: "Invalid or expired token" });
        }

        resolve({ success: true, userId: tokenData.userId });
      });
    });
  } catch (error) {
    console.error("Error verifying token:", error);
    return { success: false, error: error.message };
  }
};

module.exports = {
  createToken,
  verifyToken
};
