const Product = require('../model/product');

// GET all products
const getProducts = (req, res) => {
  Product.getAll((err, results) => {
    if (err) return res.status(500).json({ message: "Internal server error", error: err.message });
    res.status(200).json(results);
  });
};

// GET product by ID
const getProductById = (req, res) => {
  const id = req.params.id;
  Product.getById(id, (err, results) => {
    if (err) return res.status(500).json({ message: "Internal server error", error: err.message });
    if (!results.length) return res.status(404).json({ message: "Product not found" });
    res.status(200).json(results[0]);
  });
};

// CREATE product
const createProduct = (req, res) => {
  const productData = req.body;
  if (req.file) productData.productImage = `/uploads/${req.file.filename}`;

  const { productName, productPrice, productDescription, productStock, productCategory } = productData;
  if (!productName || !productPrice || !productDescription || !productStock || !productCategory) {
    return res.status(400).json({ message: "All fields are required" });
  }

  Product.create(productData, (err, result) => {
    if (err) return res.status(500).json({ message: "Internal server error", error: err.message });
    res.status(201).json({ message: "Product created successfully", id: result.insertId });
  });
};

// UPDATE product
const updateProduct = (req, res) => {
  const id = req.params.id;
  const updatedData = req.body;
  if (req.file) updatedData.productImage = `/uploads/${req.file.filename}`;

  Product.update(id, updatedData, (err, result) => {
    if (err) return res.status(500).json({ message: "Internal server error", error: err.message });
    if (result.affectedRows === 0) return res.status(404).json({ message: "Product not found" });
    res.status(200).json({ message: "Product updated successfully" });
  });
};

// DELETE product
const deleteProduct = (req, res) => {
  const id = req.params.id;
  Product.delete(id, (err, result) => {
    if (err) return res.status(500).json({ message: "Internal server error", error: err.message });
    if (result.affectedRows === 0) return res.status(404).json({ message: "Product not found" });
    res.status(200).json({ message: "Product deleted successfully" });
  });
};

module.exports = { getProducts, getProductById, createProduct, updateProduct, deleteProduct };
