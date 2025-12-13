const express = require("express");
const router = express.Router();
const { authcheck, checkadmin } = require("./middleware/auth");
const { getDashboardStats, getAllUsers, deleteUser } = require("../controller/admin");

// All admin routes are protected
router.use(authcheck, checkadmin);

// Dashboard stats
router.get("/dashboard", getDashboardStats);

// User management
router.get("/users", getAllUsers);
router.delete("/users/:id", deleteUser);

module.exports = router;
