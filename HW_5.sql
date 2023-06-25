DROP DATABASE IF EXISTS HW_5;
CREATE DATABASE HW_5;

USE HW_5;

DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT * FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000;
SELECT * FROM CheapCars;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW CheapCars AS
SELECT Name
FROM cars
WHERE cost < 30000;
SELECT * FROM CheapCars;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
CREATE VIEW SkAu AS SELECT * FROM cars WHERE name IN ('Skoda', 'Audi');
SELECT * FROM SkAu;

-- Доп задания:
-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания
SELECT
ROW_NUMBER() OVER (ORDER BY cost) AS 'number', name, cost
FROM cars
ORDER BY cost;

-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
SELECT name, cost FROM cars ORDER BY cost DESC LIMIT 3;

SELECT SUM(cost) AS total_cost
FROM (
  SELECT 
    cost
  FROM cars
  ORDER BY cost DESC
  LIMIT 3
) AS top_cars;

-- 3* Получить список автомобилей, у которых цена больше предыдущей цены (т.е. у которых произошло повышение цены)
SELECT c1.name
FROM cars c1
JOIN cars c2 ON c1.id = c2.id + 1
WHERE c1.cost > c2.cost;

-- 4* Получить список автомобилей, у которых цена меньше следующей цены (т.е. у которых произойдет снижение цены)
SELECT c1.name
FROM cars c1
JOIN cars c2 ON c1.id = c2.id - 1
WHERE c1.cost < c2.cost;



-- 5*Получить список автомобилей, отсортированный по возрастанию цены, 
-- и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля
SELECT name, cost, cost - LAG(cost) OVER (ORDER BY cost) AS diff
FROM cars
ORDER BY cost;




