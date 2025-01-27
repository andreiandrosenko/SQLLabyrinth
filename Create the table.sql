CREATE TABLE items (
    itemID INTEGER PRIMARY KEY,
    itemcode VARCHAR(5) NULL,
    itemname VARCHAR(40) NOT NULL DEFAULT ' ',
    quantity INTEGER NOT NULL DEFAULT 0,
    price DECIMAL(9,2) NOT NULL DEFAULT 0.00
);

INSERT INTO items (itemID, itemcode, itemname, quantity, price)
SELECT 
    productid, 
    LEFT(CONCAT(supplierid, categoryid, discontinued), 5),  -- Создание itemcode, если требуется
    productname, 
    unitsinstock, 
    unitprice
FROM Products;
