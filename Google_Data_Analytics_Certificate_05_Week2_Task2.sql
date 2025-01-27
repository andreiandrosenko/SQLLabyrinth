-- Manipulate strings

-- #1
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name 
FROM 
    customers;


-- #2
SELECT CONCAT_WS('.', 'www', 'your_company', 'com') as website FROM web_data;


-- #3
SELECT book_name || ' - ' || edition AS full_book_title FROM library;


-- #4
