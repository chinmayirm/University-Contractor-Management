import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Contractors from './pages/Contractors';
import Contracts from './pages/Contracts';
import WorkOrders from './pages/WorkOrders';
import './App.css';

function App() {
  return (
    <Router>
      <div className="app">
        <Navbar />
        <div className="content">
          <Routes>
            <Route path="/contractors" element={<Contractors />} />
            <Route path="/contracts" element={<Contracts />} />
            <Route path="/work-orders" element={<WorkOrders />} />
            <Route path="/" element={<Contractors />} />
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App;