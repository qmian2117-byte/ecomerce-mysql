const db = require("../config/db");
const User = require("../model/users");

// Helper to wrap callback in a Promise
const toPromise = (fn, ...args) =>
    new Promise((resolve, reject) =>
        fn(...args, (err, result) => (err ? reject(err) : resolve(result)))
    );

const getDashboardStats = async (req, res) => {
    try {
        const userCountSql = "SELECT COUNT(*) as count FROM users WHERE role = 'user'";
        const productCountSql = "SELECT COUNT(*) as count FROM products";
        const adminCountSql = "SELECT COUNT(*) as count FROM users WHERE role = 'admin'";

        const [userCount, productCount, adminCount] = await Promise.all([
            new Promise((resolve, reject) => db.query(userCountSql, (err, res) => err ? reject(err) : resolve(res[0].count))),
            new Promise((resolve, reject) => db.query(productCountSql, (err, res) => err ? reject(err) : resolve(res[0].count))),
            new Promise((resolve, reject) => db.query(adminCountSql, (err, res) => err ? reject(err) : resolve(res[0].count)))
        ]);

        res.status(200).json({
            users: userCount,
            products: productCount,
            admins: adminCount
        });
    } catch (error) {
        res.status(500).json({ message: "Server error", error: error.message });
    }
};

const getAllUsers = async (req, res) => {
    try {
        const users = await toPromise(User.getAll);
        res.status(200).json(users);
    } catch (error) {
        res.status(500).json({ message: "Database error", error: error.message });
    }
};

const deleteUser = async (req, res) => {
    try {
        const id = req.params.id;
        // Prevent deleting self? Maybe.
        if (req.id == id) { // req.id comes from authcheck middleware
            return res.status(400).json({ message: "Cannot delete your own admin account" });
        }

        const result = await toPromise(User.delete, id);
        if (result.affectedRows === 0) return res.status(404).json({ message: "User not found" });
        res.status(200).json({ message: "User deleted" });
    } catch (error) {
        res.status(500).json({ message: "Internal server error", error: error.message });
    }
};

module.exports = {
    getDashboardStats,
    getAllUsers,
    deleteUser
};
