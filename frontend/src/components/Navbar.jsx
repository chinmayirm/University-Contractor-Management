import React from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <nav className="navbar">
      <h1>PES University Contractor Management</h1>
      <div className="nav-links">
        <Link to="/contractors">Contractors</Link>
        <Link to="/contracts">Contracts</Link>
        <Link to="/work-orders">Work Orders</Link>
      </div>
    </nav>
  );
};

export default Navbar;