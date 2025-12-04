const db = require("../config/db");

const Token = {
  // 🔹 Create new token
  create: (data, callback) => {
    const sql = `
      INSERT INTO tokens (userId, token, status, expiresAt)
      VALUES (?, ?, ?, ?)
    `;
    db.query(sql, [
      data.userId,
      data.token,
      data.status !== undefined ? data.status : true,
      data.expiresAt
    ], callback);
  },

  // 🔹 Get token by ID
  getById: (id, callback) => {
    db.query("SELECT * FROM tokens WHERE id = ?", [id], callback);
  },

  // 🔹 Get token by token string
  getByToken: (token, callback) => {
    db.query("SELECT * FROM tokens WHERE token = ?", [token], callback);
  },

  // 🔹 Get all active tokens
  getActiveTokens: (callback) => {
    db.query("SELECT * FROM tokens WHERE status = TRUE AND expiresAt > NOW()", callback);
  },

  // 🔹 Update token (status or expiresAt)
  update: (id, data, callback) => {
    const sql = `
      UPDATE tokens
      SET status = ?, expiresAt = ?, updatedAt = NOW()
      WHERE id = ?
    `;
    db.query(sql, [
      data.status,
      data.expiresAt,
      id
    ], callback);
  },

  // 🔹 Delete token
  delete: (id, callback) => {
    db.query("DELETE FROM tokens WHERE id = ?", [id], callback);
  },

  // 🔹 Delete expired tokens (manual cleanup)
  deleteExpired: (callback) => {
    db.query("DELETE FROM tokens WHERE expiresAt <= NOW()", callback);
  }
};

module.exports = Token;
