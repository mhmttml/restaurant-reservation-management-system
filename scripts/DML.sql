INSERT INTO customers (customer_name, phone_number, email, password)
VALUES ('Ali Veli', '5551234567', 'ali.veli@example.com', 'hashed_password_123'),
       ('Ayşe Yılmaz', '5559876543', 'ayse.yilmaz@example.com', 'hashed_password_456'),
       ('Mehmet Demir', '5551112233', 'mehmet.demir@example.com', 'hashed_password_789'),
       ('Zeynep Çelik', '5554445566', 'zeynep.celik@example.com', 'hashed_password_101');

INSERT INTO staff (staff_id, name, position, phone_number, salary)
VALUES (1001, 'Mehmet Kaya', 'Waiter', '5552223344', 35000.00),
       (1002, 'Elif Arslan', 'Waiter', '5556667788', 35000.00),
       (1003, 'Ali Şen', 'Waiter', '5533553535', 35000.00),
       (1004, 'Burak Yıldız', 'Cashier', '5559990000', 22104.00),
       (1005, 'Fatma Aksoy', 'Chef', '5553332211', 50000.00),
       (1006, 'Serhat Camadan', 'Driver', '5589871234', 30000.00),
       (1007, 'Muhammed İkbal Parim', 'Driver', '5316544664', 30000.00);


INSERT INTO menu (item_id, category, name, price, availability)
VALUES (21, 'Deserts', 'Baklava', 210.00, TRUE),
       (32, 'Main Dish', 'Grilled Chicken', 270.00, TRUE),
       (13, 'Drinks', 'Turkish Coffee', 75.00, TRUE),
       (14, 'Soups', 'Seafood Soup', 180.00, TRUE);

INSERT INTO tables (table_id, is_available, staff_id)
VALUES (2, TRUE, 1002),
       (3, FALSE, 1003),
       (5, TRUE, 1001),
       (6, FALSE, 1002)
ON DUPLICATE KEY UPDATE is_available=VALUES(is_available);

INSERT INTO reservation (reservation_id, customer_id, table_id, reservation_date, reservation_status)
VALUES (101, 1, 3, '2025-03-30 19:00:00', 'ACCEPTED'),
       (102, 2, 5, '2025-03-31 20:00:00', 'CANCELED'),
       (103, 3, 2, '2025-04-01 18:00:00', 'PENDING'),
       (104, 4, 6, '2025-04-02 21:00:00', 'ACCEPTED');

INSERT INTO vehicles (driver_id, vehicle_type, licence_plate, registration_date)
VALUES (1006, 'Sedan', '07ABC123', '2024-01-10'),
       (1007, 'Minivan', '07XYZ456', '2023-12-15');

INSERT INTO orders(order_id, table_id, order_date)
VALUES(1,2, '2025-03-23 9:00:00'),
      (2, 2, '2025-03-23 13:00:00'),
      (3, 5,'2025-03-23 12:00:00');

INSERT INTO order_details(detail_id, order_id, item_id, quantity)
VALUES (1,1,21,2),
       (2,1,13,2),
       (3,2,14,1),
       (4,3,32,2);


UPDATE order_details od
JOIN menu m ON m.item_id = od.item_id
SET od.price = m.price * od.quantity
WHERE od.order_id IN (1,2,3);

UPDATE orders o
SET o.total_price = (
    SELECT SUM(od.price)
    FROM order_details od
    WHERE o.order_id = od.order_id
    )
WHERE o.order_id IN (1,2,3);


INSERT INTO pickup_service (pickup_user, reservation_id, pickup_status, pickup_address, pickup_time)
VALUES (1, 101, TRUE, 'Alaiye Caddesi No:5', '2025-03-25 18:30:00'),
       (2, 102, TRUE, 'Bostancıpınarı Caddesi No:12', '2025-03-26 19:00:00'),
       (3, 103, FALSE, NULL, NULL),
       (4, 104, TRUE, 'Kale Caddesi No:8', '2025-03-27 20:00:00');

UPDATE tables SET is_available = FALSE WHERE table_id IN (2, 3, 5, 6);

UPDATE reservation
SET reservation_status = 'ACCEPTED'
WHERE reservation_date < '2025-04-01'
AND reservation_status = 'PENDING';

UPDATE menu
SET availability = FALSE
WHERE category = 'Deserts' AND availability = TRUE;

UPDATE pickup_service
SET pickup_status = TRUE
WHERE pickup_status = FALSE;

START TRANSACTION;
UPDATE staff
SET salary = salary * 1.10
WHERE position = 'Waiter';
ROLLBACK;