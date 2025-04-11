require('dotenv').config();
const express = require('express');
const cors = require('cors');
const contractorRoutes = require('./routes/contractorRoutes');
const contractRoutes = require('./routes/contractRoutes');
const workOrderRoutes = require('./routes/workOrderRoutes');

const app = express();
app.use(cors());
app.use(express.json());

// API Routes
app.use('/api/contractors', contractorRoutes);
app.use('/api/contracts', contractRoutes);
app.use('/api/work-orders', workOrderRoutes);

// Health check
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', message: 'PESU Contractor Management API running' });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));