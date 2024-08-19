CREATE DATABASE DEMO;
USE DEMO;
CREATE SCHEMA TEST;
CREATE SCHEMA STG;
CREATE SCHEMA RAW;
CREATE SCHEMA CORE;

CREATE OR REPLACE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    date DATE,
    amount_paid FLOAT,
    status VARCHAR(50),
    payment_method VARCHAR(100)  -- Adding a column for payment method
);

CREATE OR REPLACE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    join_date DATE,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(20),
    zip_code VARCHAR(10)
);

CREATE  OR REPLACE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(20),
    zip_code VARCHAR(10)
);

CREATE  OR REPLACE TABLE cuisine (
    cuisine_id INT  PRIMARY KEY,
    restaurant_id INT,
    cuisine VARCHAR(100)
);

CREATE  OR REPLACE TABLE item_costs (
    item_id INT,
    restaurant_id INT,
    item_name VARCHAR(255),
    cost DECIMAL(10, 2),
    PRIMARY KEY (item_id, restaurant_id)
);

CREATE  OR REPLACE TABLE order_details (
    order_id INT,
    item_name VARCHAR(255),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES raw_orders(order_id)
);


ALTER TABLE restaurants
ADD COLUMN updated_at TIMESTAMP ;

UPDATE restaurants
SET updated_at = CURRENT_TIMESTAMP
WHERE updated_at IS NULL;









