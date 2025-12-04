const db = require("../config/db");

const Product = {
  // ✅ Get all products
  getAll: (callback) => {
    db.query("SELECT * FROM products", callback);
  },

  // ✅ Get product by ID
  getById: (id, callback) => {
    db.query("SELECT * FROM products WHERE id = ?", [id], callback);
  },

  // ✅ Create new product
  create: (data, callback) => {
    const sql = `
      INSERT INTO products 
      (productName, productDescription, productPrice, productStock, productCategory, productImage)
      VALUES (?, ?, ?, ?, ?, ?)
    `;
    db.query(sql, [
      data.productName,
      data.productDescription,
      data.productPrice,
      data.productStock,
      data.productCategory,
      data.productImage || null
    ], callback);
  },

  // ✅ Update product
  update: (id, data, callback) => {
    const sql = `
      UPDATE products
      SET productName=?, productDescription=?, productPrice=?, productStock=?, productCategory=?, productImage=?
      WHERE id=?
    `;
    db.query(sql, [
      data.productName,
      data.productDescription,
      data.productPrice,
      data.productStock,
      data.productCategory,
      data.productImage || null,
      id
    ], callback);
  },

  // ✅ Delete product
  delete: (id, callback) => {
    db.query("DELETE FROM products WHERE id=?", [id], callback);
  }
};

module.exports = Product;
