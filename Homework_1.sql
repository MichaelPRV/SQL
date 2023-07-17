-- 1. Создайте таблицу с мобильными телефонами. Заполните БД данными
USE lesson_1;

DROP TABLE IF EXISTS smartphones;
CREATE TABLE smartphones
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(25),
    Manufacturer VARCHAR(25) NOT NULL,
    ProductCount INT,
    Price FLOAT
);

INSERT smartphones(ProductName,Manufacturer,ProductCount,Price)
VALUES
	("iPhone X", "Apple", 3, 76000),
    ("iPhone 8", "Apple", 2, 51000),
    ("Galaxy S9", "Samsung", 2, 56000),
    ("Galaxy S8", "Samsung", 1, 51000),
    ("P20 Pro", "Huawei", 5, 36000);

SELECT * FROM smartphones;


-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price
FROM smartphones
WHERE ProductCount > 2;


-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT ProductName
FROM smartphones
WHERE Manufacturer = "SAMSUNG";


-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000
SELECT ProductName, Manufacturer, ProductCount, Price
FROM smartphones
WHERE (ProductCount * Price) > 100000 AND (ProductCount * Price) < 145000;

-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT ProductName, Manufacturer, ProductCount, Price
FROM smartphones
WHERE ProductName LIKE "%IPHONE%";

-- 4.2. Товары, в которых есть упоминание "Galaxy"
SELECT ProductName, Manufacturer, ProductCount, Price
FROM smartphones
WHERE ProductName LIKE "%GALAXY%";

-- 4.3. Товары, в которых есть ЦИФРЫ
SELECT ProductName, Manufacturer, ProductCount, Price
FROM smartphones
WHERE ProductName REGEXP '[:digit:]';

-- 4.4. Товары, в которых есть ЦИФРА "8"
SELECT ProductName, Manufacturer, ProductCount, Price
FROM smartphones
WHERE ProductName LIKE '%8%';



