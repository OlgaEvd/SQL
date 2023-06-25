DROP DATABASE IF EXISTS HW_6;
CREATE DATABASE HW_6;

USE HW_6;
-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DELIMITER //

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE formatted VARCHAR(255);

    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds % (24 * 3600);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;

    SET formatted = CONCAT(days, ' дн ', hours, ' ч ', minutes, ' мин ', seconds, ' сек');

    RETURN formatted;
END //

DELIMITER ;

-- 1 день 10 часов 17 minutes 36 seconds  = 123456 секунд
SELECT format_seconds(123456);

-- 1 день = 86400 секунд
SELECT format_seconds(86400);


-- 2. Создайте процедуру которая, выводит только четные числа от 1 до 10. 
-- Пример: 2,4,6,8,10 
DELIMITER //

CREATE PROCEDURE chet_numbers()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE number INT;

    CREATE TEMPORARY TABLE IF NOT EXISTS chet_numbers (num INT);
    TRUNCATE TABLE chet_numbers;

    WHILE counter <= 10 DO
        IF counter % 2 = 0 THEN
            SET number = counter;
            INSERT INTO chet_numbers (num) VALUES (number);
        END IF;
        
        SET counter = counter + 1;
    END WHILE;

    SELECT num FROM chet_numbers;
END //

DELIMITER ;


CALL chet_numbers();

