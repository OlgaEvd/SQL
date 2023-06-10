CREATE DATABASE HW2;
USE HW2;
CREATE TABLE sales
(id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL
);
SELECT *FROM sales
INSERT sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
INSERT sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
SELECT *FROM sales
SELECT id, order_date, count_product,
    CASE
        WHEN count_product < 100 THEN 'Маленький заказ'
        WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
        ELSE 'Большой заказ'
    END AS order_type
FROM sales;
SELECT id, order_date, count_product,
    CASE
        WHEN count_product < 100 THEN 'Маленький заказ'
        WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
        ELSE 'Большой заказ'
    END AS order_type
FROM sales;

SELECT id, order_date, count_product,
    IF(count_product < 100, 'Маленький заказ',
       IF(count_product BETWEEN 100 AND 300, 'Средний заказ', 'Большой заказ')) AS order_type
FROM sales;
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  employeeid VARCHAR (5) NOT NULL,
  amount DECIMAL(20,2) NOT NULL,
  orderstatus varchar(45) NOT NULL
 );
 SELECT *FROM orders
INSERT orders (employeeid, amount, orderstatus)
VALUES
    ('e03', 15.00, 'OPEN'),
	('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
    INSERT orders (employeeid, amount, orderstatus)
VALUES
    ('e03', 15.00, 'OPEN'),
	('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
    SELECT *FROM orders
SELECT id, orderstatus,
CASE 
	WHEN orderstatus = 'OPEN' THEN 'Order is in open state.'
	WHEN orderstatus = 'CLOSED' THEN 'Order is closed.'
	WHEN orderstatus = 'CANCELLED' THEN 'Order is in open state.'
	ELSE 'NONE'
END AS full_order_status
FROM orders;
SELECT  *,
  CASE
    WHEN orderstatus = 'OPEN' THEN 'Order is in open state'
    WHEN orderstatus = 'CLOSED' THEN 'Order is closed'
    WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled'
    ELSE 'Unknown order status'
  END AS full_order_status
FROM orders;