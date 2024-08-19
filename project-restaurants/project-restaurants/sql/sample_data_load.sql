INSERT INTO orders (order_id, customer_id, restaurant_id, date, amount_paid, status, payment_method) VALUES
(101, 201, 501, '2023-07-28', 5.50, 'completed', 'Credit Card'),  -- Burger (3.50) + Fries (2.00)
(102, 202, 502, '2023-07-28', 10.00, 'completed', 'Debit Card'),  -- Pizza (5.00 * 2)
(103, 203, 503, '2023-07-28', 12.50, 'completed', 'Cash'),        -- Pasta (4.50) + Wine (8.00)
(104, 204, 503, '2023-07-28', 26.00, 'completed', 'Credit Card'), -- Steak (10.00) + Wine (8.00 * 2)
(105, 205, 502, '2023-07-28', 6.00, 'completed', 'Mobile Payment'), -- Salad (2.50) + Soup (3.50)
(106, 206, 503, '2023-07-28', 8.00, 'completed', 'Credit Card'), -- Fish (5.00) + Chips (3.00)
(107, 207, 501, '2023-07-28', 5.50, 'completed', 'Cash'),         -- Sandwich (4.00) + Soda (1.50)
(108, 208, 502, '2023-07-28', 17.00, 'completed', 'Debit Card'),  -- Pizza (5.00) + Beer (6.00 * 2)
(109, 209, 503, '2023-07-28', 7.50, 'completed', 'Credit Card'), -- Burger (3.50) + Shake (4.00)
(110, 210, 501, '2023-07-28', 5.75, 'completed', 'Cash');        -- Pasta (4.50) + Tea (1.25)
INSERT INTO order_details (order_id, item_name, quantity) VALUES
(101, 'Burger', 1),
(101, 'Fries', 1),
(102, 'Pizza', 2),
(103, 'Pasta', 1),
(103, 'Wine', 1),
(104, 'Steak', 1),  -- Assuming steak cost is $10.00
(104, 'Wine', 2),
(105, 'Salad', 1),
(105, 'Soup', 1),
(106, 'Fish', 1),
(106, 'Chips', 1),
(107, 'Sandwich', 1),
(107, 'Soda', 1),
(108, 'Pizza', 1),
(108, 'Beer', 2),
(109, 'Burger', 1),
(109, 'Shake', 1),
(110, 'Pasta', 1),
(110, 'Tea', 1);
INSERT INTO item_costs (item_id, restaurant_id, item_name, cost) VALUES
(1, 501, 'Burger', 3.50),
(2, 501, 'Fries', 2.00),
(3, 502, 'Pizza', 5.00),
(4, 503, 'Pasta', 4.50),
(5, 503, 'Wine', 8.00),
(6, 502, 'Beer', 6.00),
(7, 502, 'Salad', 2.50),
(8, 502, 'Soup', 3.50),
(9, 503, 'Fish', 5.00),
(10, 503, 'Chips', 3.00),
(11, 501, 'Sandwich', 4.00),
(12, 501, 'Soda', 1.50),
(13, 503, 'Shake', 4.00),
(14, 501, 'Tea', 1.25),
(15, 503, 'Steak', 10.00),  -- Steak now belongs to restaurant 503
(16, 503, 'Burger', 3.50),
(17, 501, 'Pasta', 4.50),
(18, 503, 'Soda', 1.50);  -- Adding Burger for restaurant 503
INSERT INTO customers (customer_id, first_name, last_name, join_date, address, city, state, zip_code) VALUES
(201, 'John', 'Doe', '2023-01-15', '123 Oak Street', 'Anytown', 'CA', '90210'),
(202, 'Jane', 'Doe', '2023-02-20', '456 Maple Avenue', 'Othertown', 'NY', '10001'),
(203, 'Michael', 'Smith', '2023-03-05', '789 Birch Road', 'Thistown', 'TX', '73301'),
(204, 'Alice', 'Johnson', '2023-03-21', '321 Elm Street', 'Thattown', 'FL', '33101'),
(205, 'Chris', 'Lee', '2023-04-10', '654 Pine Avenue', 'Anothertown', 'WA', '98101'),
(206, 'Patricia', 'Brown', '2023-04-24', '987 Cedar Lane', 'Sometown', 'MA', '02101'),
(207, 'Linda', 'Davis', '2023-05-09', '147 Walnut Street', 'Oldtown', 'IL', '60601'),
(208, 'Barbara', 'Miller', '2023-05-23', '258 Chestnut Road', 'Youngtown', 'NV', '89001'),
(209, 'Elizabeth', 'Taylor', '2023-06-07', '369 Hickory Avenue', 'Newtown', 'OH', '44101'),
(210, 'James', 'Anderson', '2023-06-22', '741 Spruce Street', 'Anycity', 'OR', '97201');
INSERT INTO restaurants (restaurant_id, restaurant_name, city, state, zip_code) VALUES
(501, 'Burger Joint', 'New York', 'NY', '10001'),
(502, 'Pizza Palace', 'Los Angeles', 'CA', '90001'),
(503, 'Seafood Shack', 'Miami', 'FL', '33101');
INSERT INTO cuisine (cuisine_id, restaurant_id, cuisine) VALUES
(801, 501, 'American'),
(802, 502, 'Italian'),
(803, 503, 'Seafood');


-- Insert new records into orders
INSERT INTO orders (order_id, customer_id, restaurant_id, date, amount_paid, status, payment_method) VALUES
(111, 211, 502, '2023-08-01', 18.50, 'completed', 'Credit Card'),  -- Pizza (5.00 * 2) + Beer (6.00 * 1) + Salad (2.50 * 1)
(112, 212, 503, '2023-08-01', 17.00, 'completed', 'Debit Card'),   -- Pasta (4.50 * 2) + Fish (5.00 * 1) + Chips (3.00 * 1)
(113, 213, 501, '2023-08-01', 12.00, 'completed', 'Cash'),         -- Burger (3.50 * 2) + Soda (1.50 * 2) + Fries (2.00 * 1)
(114, 214, 502, '2023-08-01', 25.50, 'completed', 'Mobile Payment'),-- Pizza (5.00 * 1) + Beer (6.00 * 2) + Salad (2.50 * 2) + Soup (3.50 * 1)
(115, 215, 503, '2023-08-01', 8.00, 'completed', 'Credit Card');    -- Burger (3.50 * 1) + Chips (3.00 * 1) + Soda (1.50 * 1)

-- Insert corresponding records into order_details
INSERT INTO order_details (order_id, item_name, quantity) VALUES
(111, 'Pizza', 2),
(111, 'Beer', 1),
(111, 'Salad', 1),
(112, 'Pasta', 2),
(112, 'Fish', 1),
(112, 'Chips', 1),
(113, 'Burger', 2),
(113, 'Soda', 2),
(113, 'Fries', 1),
(114, 'Pizza', 1),
(114, 'Beer', 2),
(114, 'Salad', 2),
(114, 'Soup', 1),
(115, 'Burger', 1),
(115, 'Chips', 1),
(115, 'Soda', 1);

