-- INCREMENTAL BEFORE
DELETE FROM stg.dim_restaurants where restaurant_id = 504;
DELETE FROM restaurants where restaurant_id = 501;
DELETE FROM restaurants where restaurant_id = 504;
UPDATE restaurants
SET restaurant_name = 'Burger Joint', updated_at = CURRENT_TIMESTAMP
WHERE restaurant_id = 501;
--INCREMENTAL AFTER
INSERT INTO restaurants (restaurant_id, restaurant_name, city, state, zip_code, updated_at) 
VALUES (504, 'Taco Haven', 'San Francisco', 'CA', '94101', CURRENT_TIMESTAMP);
UPDATE restaurants
SET restaurant_name = 'Burger Point', updated_at = CURRENT_TIMESTAMP
WHERE restaurant_id = 501;
-- RELATIONSHIP TEST
INSERT INTO restaurants (restaurant_id, restaurant_name, city, state, zip_code) VALUES
(501, 'Burger Joint', 'New York', 'NY', '10001');
DELETE FROM cuisine WHERE cuisine_id = 804;
INSERT INTO cuisine (cuisine_id, restaurant_id, cuisine) VALUES
(804, 504, 'Mexican');

select * from raw.order_details;



