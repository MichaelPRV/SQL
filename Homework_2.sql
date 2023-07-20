-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

USE lesson_2;

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales(id, order_date, count_product)
VALUES 
	(1, "2022-01-01", 156),
	(2, "2022-01-02", 180),
    (3, "2022-01-03", 21),
    (4, "2022-01-04", 124),
    (5, "2022-01-05", 341);
    
SELECT * FROM sales;



-- 2. Сгруппируйте значения количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT
	id,
    order_date,
    count_product,
    CASE
		WHEN count_product < 100
			THEN "Маленький заказ"
		WHEN count_product > 99 AND count_product < 301
			THEN "Средний заказ"
		WHEN count_product > 300
			THEN "Большой заказ"
		ELSE "Error"
	END AS segments
FROM sales;



-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10) NOT NULL,
    amount DECIMAL(10,2),
    order_status VARCHAR(20)
);

INSERT INTO  orders(id, employee_id, amount, order_status)
VALUES 
	(1, "e03", 15.00, "OPEN"),
	(2, "e01", 25.50, "OPEN"),
    (3, "e05", 100.70, "CLOSED"),
    (4, "e02", 22.18, "OPEN"),
    (5, "e04", 9.50, "CANCELLED");
    
SELECT * FROM orders;

SELECT
	id,
    employee_id,
    amount,
    order_status,
    CASE order_status
		WHEN "OPEN"
			THEN "Order is in open state"
		WHEN "CLOSED"
			THEN "Order is closed"
		WHEN "CANCELLED"
			THEN "Order is cancelled"
		ELSE "Error"
	END AS full_order_status
FROM orders;
