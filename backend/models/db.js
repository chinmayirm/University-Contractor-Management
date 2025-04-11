const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  host: 'mysql',  // Docker service name
  user: 'root',
  password: 'pesu@123',
  database: 'contractor_db'
});

module.exports = pool;