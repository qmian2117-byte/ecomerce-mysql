const mysql = require('mysql2');
const bcrypt = require('bcrypt');
const dotenv = require('dotenv');

dotenv.config();

const db = mysql.createConnection({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '000111',
  database: process.env.DB_NAME || 'ecommerce'
});

const seedAdmin = async () => {
    try {
        db.connect((err) => {
            if (err) {
                console.error('❌ Database connection failed:', err);
                process.exit(1);
            }
            console.log('✅ Connected to MySQL Database');
        });

        const hashedPassword = await bcrypt.hash('admin123', 10);
        const adminEmail = 'admin@gmail.com';

        const checkSql = "SELECT * FROM users WHERE email = ?";
        
        db.query(checkSql, [adminEmail], async (err, results) => {
            if (err) {
                console.error('Error checking admin:', err);
                process.exit(1);
            }

            if (results.length > 0) {
                console.log('⚠️ Admin user already exists. Updating role to admin...');
                const updateSql = "UPDATE users SET role = 'admin', password = ? WHERE email = ?";
                db.query(updateSql, [hashedPassword, adminEmail], (err, result) => {
                    if (err) {
                        console.error('Error updating admin:', err);
                    } else {
                        console.log('✅ Admin user updated successfully.');
                    }
                    process.exit();
                });
            } else {
                console.log('Creating new admin user...');
                const insertSql = `
                    INSERT INTO users (firstName, lastName, email, password, role, status, createdAt, updatedAt)
                    VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())
                `;
                db.query(insertSql, ['Admin', 'User', adminEmail, hashedPassword, 'admin', 'active'], (err, result) => {
                    if (err) {
                        console.error('Error creating admin:', err);
                    } else {
                        console.log('✅ Admin user created successfully.');
                        console.log(`Email: ${adminEmail}`);
                        console.log('Password: admin123');
                    }
                    process.exit();
                });
            }
        });

    } catch (error) {
        console.error('Error seeding admin:', error);
        process.exit(1);
    }
};

seedAdmin();
