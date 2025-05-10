CREATE DATABASE restaurant;
USE restaurant;

CREATE TABLE customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(200) NOT NULL,
    phone_number VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(250) NOT NULL
);

CREATE TABLE staff(
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    position VARCHAR(150) NOT NULL,
    phone_number VARCHAR(50) NOT NULL UNIQUE,
    salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE  vehicles(
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT NOT NULL,
    vehicle_type VARCHAR(100) NOT NULL,
    licence_plate VARCHAR(50) NOT NULL UNIQUE,
    registration_date DATE,
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (driver_id) REFERENCES staff(staff_id)
);

CREATE TABLE tables(
    table_id INT AUTO_INCREMENT PRIMARY KEY ,
    is_available BOOLEAN DEFAULT TRUE,
    staff_id INT NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE reservation(
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_status ENUM('ACCEPTED', 'PENDING', 'CANCELED') DEFAULT 'ACCEPTED',
    customer_id INT NOT NULL,
    table_id INT NOT NULL,
    reservation_date DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (table_id) REFERENCES tables(table_id)
);

CREATE TABLE menu(
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL,
    availability BOOLEAN DEFAULT TRUE
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    table_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (table_id) REFERENCES tables(table_id)
);

CREATE TABLE order_details (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT DEFAULT 1,
    price DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu(item_id)
);

CREATE TABLE  pickup_service(
    pickup_id INT AUTO_INCREMENT PRIMARY KEY,
    pickup_user INT NOT NULL,
    reservation_id INT NOT NULL,
    pickup_status BOOLEAN DEFAULT FALSE,
    pickup_address VARCHAR(250),
    pickup_time DATETIME,
    check ( pickup_status = TRUE or (pickup_address is NULL and pickup_time is NULL)),
    FOREIGN KEY (pickup_user) REFERENCES customers(customer_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id)
);
