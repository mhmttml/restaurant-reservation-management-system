SELECT * FROM customers;

-- List of all available table
SELECT table_id, is_available
FROM tables
WHERE is_available = TRUE;

-- List of reservations on a specific date
SELECT reservation_id, reservation_status, customer_id, table_id,reservation_date
FROM reservation
WHERE DATE(reservation_date) = '2025-04-01';

-- List of all active reservations
SELECT reservation_id, reservation_status, customer_id, table_id,reservation_date
FROM reservation
WHERE reservation_status = 'ACCEPTED';

-- All orders with their total price
SELECT order_id, table_id, order_date, total_price
FROM orders;

-- Detailed list of items in each order
SELECT od.order_id, m.name AS item_name, od.quantity, od.price
FROM order_details od
JOIN menu m on m.item_id = od.item_id;
--

-- Pickup service details for completed reservations
SELECT ps.pickup_id, ps.pickup_user, ps.pickup_address, ps.pickup_time
FROM pickup_service ps
WHERE ps.pickup_status = TRUE;

-- Count the number of reservations per customer
SELECT c.customer_id, c.customer_name, COUNT(r.reservation_id) AS reservation_count
FROM customers c
LEFT JOIN reservation r on c.customer_id = r.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Number of orders per day
SELECT DATE(orders.order_date) AS order_date, COUNT(order_id) AS order_count
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_date;

-- Number of reservations per month
SELECT MONTH(reservation.reservation_date) AS reservation_month, COUNT(reservation_id) AS reservation_count
FROM reservation
GROUP BY MONTH(reservation_date)
ORDER BY reservation_month;

-- Number of pickup services per month
SELECT MONTH(pickup_time) AS pickup_month, COUNT(pickup_id) AS pickup_count
FROM pickup_service
WHERE pickup_status = TRUE
GROUP BY MONTH(pickup_time)
ORDER BY pickup_month;
