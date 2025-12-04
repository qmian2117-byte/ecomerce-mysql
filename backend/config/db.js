const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  port: 3306,               // Use this for custom port
  user: 'root',    // Replace with your MySQL username
  password: '000111',// Replace with your MySQL password
  database: 'ecommerce' // Replace with your DB name
});

db.connect((err) => {
  if (err) {
    console.error('❌ Database connection failed:', err);
  } else {
    console.log('✅ Connected to MySQL Database');
  }
});

module.exports = db;
