CREATE DATABASE Phone;
USE Phone;
CREATE TABLE Mobile
(id INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(30) NOT NULL,
Manufacturwr VARCHAR(30) NOT NULL,
ProductCount INT,
Price INT
);
SELECT * FROM Mobile
INSERT Mobile(ProductName, Manufacturwr, ProductCount, Price)
VALUES
("Iphone X", "Apple", 3, 76000),
("Iphone 8", "Apple", 2, 51000),
("Galaxy S9", "Samsung", 2, 56000),
("Galaxy S8", "Samsung", 1, 41000),
("P20 Pro", "Huawei", 5, 36000);
SELECT *FROM Mobile


SELECT *FROM Mobile
-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturwr, Price FROM Mobile WHERE ProductCount > 2;
-- Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM Mobile WHERE Manufacturwr = 'Samsung';
-- С помощью регулярных выражений найти: Товары, в которых есть упоминание "Iphone"
SELECT * FROM Mobile WHERE ProductName REGEXP 'Iphone';
-- С помощью регулярных выражений найти:"Samsung"
SELECT * FROM Mobile WHERE Manufacturwr = 'Samsung';
-- С помощью регулярных выражений найти: Товары, в которых есть ЦИФРА "8"  
SELECT * FROM Mobile WHERE ProductName REGEXP '[8]';