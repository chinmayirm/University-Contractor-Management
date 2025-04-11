CREATE DATABASE IF NOT EXISTS contractor_db;
USE contractor_db;

-- Contractors table
CREATE TABLE contractors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  company_name VARCHAR(100) NOT NULL,
  contact_person VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Contracts table
CREATE TABLE contracts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  contractor_id INT NOT NULL,
  title VARCHAR(100) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  value DECIMAL(12,2) NOT NULL,
  department ENUM('Facilities', 'Housing', 'Dining', 'Administration', 'IT') NOT NULL,
  status ENUM('Active', 'Expired', 'Terminated') DEFAULT 'Active',
  FOREIGN KEY (contractor_id) REFERENCES contractors(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Work orders table
CREATE TABLE work_orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  contractor_id INT,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  location VARCHAR(100) NOT NULL,
  priority ENUM('Low', 'Medium', 'High', 'Emergency') DEFAULT 'Medium',
  status ENUM('Pending', 'Assigned', 'In Progress', 'Completed') DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (contractor_id) REFERENCES contractors(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- =============================================
-- PES UNIVERSITY SAMPLE DATA (15 RECORDS)
-- =============================================

-- Contractors (5 records)
INSERT INTO contractors (company_name, contact_person, email, phone) VALUES
  ('Bangalore Electrical Solutions', 'Rajesh Kumar', 'rajesh@bes.com', '9876543210'),
  ('PESU Facility Management', 'Anita Desai', 'anita@pes.edu', '8765432109'),
  ('Campus Hygiene Partners', 'Priya Sharma', 'priya@chp.in', '7654321098'),
  ('Tech Support India', 'Arun Patel', 'arun@techsupport.com', '6543210987'),
  ('Green Gardens Landscaping', 'Mohit Gupta', 'mohit@greengardens.co', '9432109876');

-- Contracts (5 records) - Dates in DD-MM-YYYY format extended to 2026+
INSERT INTO contracts (contractor_id, title, start_date, end_date, value, department, status) VALUES
  (1, 'EC Campus Electrical Maintenance', STR_TO_DATE('15-01-2023', '%d-%m-%Y'), STR_TO_DATE('31-12-2026', '%d-%m-%Y'), 1200000.00, 'Facilities', 'Active'),
  (2, 'RR Campus Building Maintenance', STR_TO_DATE('01-03-2023', '%d-%m-%Y'), STR_TO_DATE('28-02-2027', '%d-%m-%Y'), 850000.00, 'Housing', 'Active'),
  (3, 'University-Wide Cleaning Services', STR_TO_DATE('10-02-2023', '%d-%m-%Y'), STR_TO_DATE('31-12-2026', '%d-%m-%Y'), 650000.00, 'Administration', 'Active'),
  (4, 'Computer Lab IT Support', STR_TO_DATE('01-04-2023', '%d-%m-%Y'), STR_TO_DATE('31-03-2027', '%d-%m-%Y'), 450000.00, 'IT', 'Active'),
  (5, 'Campus Landscaping Contract', STR_TO_DATE('01-01-2023', '%d-%m-%Y'), STR_TO_DATE('31-12-2026', '%d-%m-%Y'), 320000.00, 'Facilities', 'Active');

-- Work Orders (10 records) - Using current dates for work orders
INSERT INTO work_orders (contractor_id, title, description, location, priority, status) VALUES
  (1, 'Flickering Lights', 'Lights in corridor flickering', 'EC Campus Block B, 2nd Floor', 'Medium', 'Completed'),
  (2, 'Leaking Pipe', 'Water leakage in bathroom', 'RR Campus Dormitory A', 'High', 'In Progress'),
  (NULL, 'Classroom Cleaning', 'Deep clean required after event', 'EC Campus Block C Room 205', 'Low', 'Pending'),
  (4, 'Printer Not Working', 'Network printer offline', 'Library Computer Lab', 'Medium', 'Assigned'),
  (5, 'Lawn Maintenance', 'Grass cutting and trimming', 'Main Campus Grounds', 'Low', 'Pending'),
  (3, 'Cafeteria Cleaning', 'Daily cleaning service', 'Main Cafeteria', 'Medium', 'Completed'),
  (1, 'Power Outage', 'Complete power failure', 'EC Campus Block A', 'Emergency', 'In Progress'),
  (2, 'Broken Window', 'Window glass shattered', 'RR Campus Admin Building', 'High', 'Pending'),
  (4, 'WiFi Issues', 'No connectivity in lab', 'Computer Center Room 3', 'High', 'Assigned'),
  (5, 'Tree Pruning', 'Overgrown branches near walkway', 'Entrance Pathway', 'Medium', 'Completed');