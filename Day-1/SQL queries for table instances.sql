CREATE TABLE customer (
   customer_id SERIAL PRIMARY KEY, -- Auto-incrementing ID
   first_name VARCHAR(100) NOT NULL, -- Customer's first name
   last_name VARCHAR(100) NOT NULL, -- Customer's last name
   email VARCHAR(255) UNIQUE NOT NULL, -- Unique email
   created_date TIMESTAMPTZ NOT NULL DEFAULT NOW(), -- Record creation timestamp
   active BOOLEAN 
);

INSERT INTO customer (first_name, last_name, email, created_date, updated_date, active) VALUES
  ('John', 'Doe', 'johndoe@example.com', NOW(), true),
  ('Alice', 'Smith', 'alicesmith@example.com', NOW(), true),
  ('Bob', 'Johnson', 'bjohnson@example.com', NOW(),true),
  ('Emma', 'Brown', 'emmabrown@example.com', NOW(),true),
  ('Michael', 'Lee', 'michaellee@example.com', NOW(),false),
  ('Sarah', 'Wilson', 'sarahwilson@example.com', NOW(), true),
  ('David', 'Clark', 'davidclark@example.com', NOW(),true),
  ('Olivia', 'Martinez', 'oliviamartinez@example.com', NOW(), true),
  ('James', 'Garcia', 'jamesgarcia@example.com', NOW(), false),
  ('Sophia', 'Lopez', 'sophialopez@example.com', NOW(), false),
  ('Jennifer', 'Davis', 'jennifer.davis@example.com', NOW(), true),
  ('Jennie', 'Terry', 'jennie.terry@example.com', NOW(),true),
  ('JENNY', 'SMITH', 'jenny.smith@example.com', NOW(),false),
  ('Hiren', 'Patel', 'hirenpatel@example.com', NOW(),false);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
    order_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    order_number VARCHAR(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO orders (customer_id, order_date, order_number, order_amount) VALUES
  (1, '2024-01-01', 'ORD001', 50.00),
  (2, '2024-01-01', 'ORD002', 35.75),
  (3, '2024-01-01', 'ORD003', 100.00),
  (4, '2024-01-01', 'ORD004', 30.25),
  (5, '2024-01-01', 'ORD005', 90.75),
  (6, '2024-01-01', 'ORD006', 25.50),
  (7, '2024-01-01', 'ORD007', 60.00),
  (8, '2024-01-01', 'ORD008', 42.00),
  (9, '2024-01-01', 'ORD009', 120.25),
  (10,'2024-01-01', 'ORD010', 85.00),
  (1, '2024-01-02', 'ORD011', 55.00),
  (1, '2024-01-03', 'ORD012', 80.25),
  (2, '2024-01-03', 'ORD013', 70.00),
  (3, '2024-01-04', 'ORD014', 45.00),
  (1, '2024-01-05', 'ORD015', 95.50),
  (2, '2024-01-05', 'ORD016', 27.50),
  (2, '2024-01-07', 'ORD017', 65.75),
  (2, '2024-01-10', 'ORD018', 75.50);