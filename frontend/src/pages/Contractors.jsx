import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Contractors = () => {
  const [contractors, setContractors] = useState([]);

  useEffect(() => {
    const fetchContractors = async () => {
      try {
        const response = await axios.get('http://localhost:5000/api/contractors');
        setContractors(response.data);
      } catch (error) {
        console.error('Error fetching contractors:', error);
      }
    };

    fetchContractors();
  }, []);

  return (
    <div className="content">
      <h2>Contractors</h2>
      <table className="table">
        <thead>
          <tr>
            <th>Company</th>
            <th>Contact Person</th>
            <th>Email</th>
            <th>Phone</th>
          </tr>
        </thead>
        <tbody>
          {contractors.map(contractor => (
            <tr key={contractor.id}>
              <td>{contractor.company_name}</td>
              <td>{contractor.contact_person}</td>
              <td>{contractor.email}</td>
              <td>{contractor.phone}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Contractors;