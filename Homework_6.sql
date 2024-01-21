CREATE DATABASE IF NOT EXISTS lesson_6;

USE lesson_6;

/*
Задание 1.
Создайте функцию, которая принимает кол-во секунд и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
*/
DROP FUNCTION IF EXISTS seconds_to_ddhhmmss;

DELIMITER //
CREATE FUNCTION seconds_to_ddhhmmss(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE ddhhmmss VARCHAR(255);
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    
    SET days = seconds DIV (60 * 60 * 24);
    SET seconds = seconds % (60 * 60 * 24);
    SET hours = seconds DIV (60 * 60);
    SET seconds = seconds % (60 * 60);
    SET minutes = seconds DIV 60;
    SET seconds = seconds % 60;
    
    SET ddhhmmss = CONCAT(days, ' дней ', hours, ' часов ', minutes, ' минут ', seconds, ' секунд ');

	RETURN ddhhmmss;
END; //
SELECT seconds_to_ddhhmmss(123456) AS 'секунды в ддччммсс';



/*
Задание 2. 
Выведите только четные числа от 1 до 10 (Через цикл).
Пример: 2,4,6,8,10
*/
DROP PROCEDURE IF EXISTS even_nums;

DELIMITER //
CREATE PROCEDURE even_nums(num1 INT, num2 INT)
BEGIN
	DECLARE n INT;
    DECLARE result VARCHAR(45) DEFAULT '';
    SET n = num1;
    
    REPEAT
		IF NOT n % 2 THEN SET result = CONCAT(result, n, ',');
		END IF;
		SET n = n + 1;
	UNTIL n > num2
    END REPEAT;
    
    
    SELECT LEFT(result, LENGTH(result) -1) AS 'четные числа';
END; //

CALL even_nums(1, 10);
