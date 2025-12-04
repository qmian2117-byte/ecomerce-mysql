const db = require("../config/db");

const User = {
  // Get all users
  getAll: (callback) => {
    const sql = "SELECT id, firstName, lastName, email, role, status, phone, address, createdAt, updatedAt FROM users";
    db.query(sql, callback);
  },

  // Get user by ID
  getById: (id, callback) => {
    const sql = "SELECT id, firstName, lastName, email, role, status, phone, address, createdAt, updatedAt FROM users WHERE id = ?";
    db.query(sql, [id], callback);
  },

  // Get user by email (for login)
  getByEmail: (email, callback) => {
    const sql = "SELECT * FROM users WHERE email = ?";
    db.query(sql, [email], callback);
  },

  // Create new user
  create: (data, callback) => {
    const sql = `
      INSERT INTO users (firstName, lastName, email, password, role, status, phone, address, otp)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;
    db.query(sql, [
      data.firstName,
      data.lastName,
      data.email,
      data.password,
      data.role || "user",
      data.status || "deactive",
      data.phone || null,
      data.address || null,
      data.otp || null
    ], callback);
  },

  // Update user
  update: (id, data, callback) => {
    const sql = `
      UPDATE users
      SET firstName=?, lastName=?, email=?, password=?, role=?, status=?, phone=?, address=?, otp=?, updatedAt=NOW()
      WHERE id=?
    `;
    db.query(sql, [
      data.firstName,
      data.lastName,
      data.email,
      data.password,
      data.role,
      data.status,
      data.phone,
      data.address,
      data.otp,
      id
    ], callback);
  },

  // Delete user
  delete: (id, callback) => {
    const sql = "DELETE FROM users WHERE id = ?";
    db.query(sql, [id], callback);
  }
};

module.exports = User;
