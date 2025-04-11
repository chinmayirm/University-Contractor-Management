const express = require('express');
const router = express.Router();
const pool = require('../db');

// getting all contractors
router.get('/', async (req, res) => {
  try {
    const [contractors] = await pool.query('SELECT * FROM contractors');
    res.json(contractors);
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

// adding new contractor
router.post('/', async (req, res) => {
  const { company_name, contact_person, email, phone } = req.body;
  try {
    const [result] = await pool.query(
      'INSERT INTO contractors (company_name, contact_person, email, phone) VALUES (?, ?, ?, ?)',
      [company_name, contact_person, email, phone]
    );
    res.status(201).json({ id: result.insertId });
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

module.exports = router;