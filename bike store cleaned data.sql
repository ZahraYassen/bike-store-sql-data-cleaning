USE `bike store unclean`;
SELECT * FROM `BIKE SALES DATA`

-- FIRST STEP: check header of first column
-- ALTER TABLE `bike sales data` RENAME COLUMN `ï»؟Sales_Order #` TO Sales_Order_ID;
-- Check the douplication
-- SELECT Sales_Order_ID, count(*) FROM `bike sales data`
-- GROUP BY `Sales_Order_ID` HAVING COUNT(*) > 1;
-- Remove one of the douplicated rows
-- DELETE FROM `bike sales data`
-- WHERE Sales_Order_ID = 000261701
-- LIMIT 1;
-- Change the ID of the Diff rows
-- SELECT MAX(CAST(Sales_Order_ID AS UNSIGNED)) FROM `bike sales data`;
-- UPDATE `bike sales data`
-- SET Sales_Order_ID = LPAD(000261783, 9, '0')
-- WHERE Sales_Order_ID = 000261695
-- LIMIT 1;
-- Check the Pattern
-- SELECT *
-- FROM `bike sales data`
-- WHERE Sales_Order_ID NOT REGEXP '^000[0-9]{6}$';

-- SECOND STEP: date
-- SELECT date FROM `bike sales data`
-- WHERE date NOT REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{2}$';

-- THIRD STEP: month 
-- UPDATE `bike sales data`
-- SET month = 'December'
-- WHERE month = 'Decmber';

-- FOURTH STEP: age_group
-- UPDATE `bike sales data`
-- SET Age_Group = 'Adults (35-64)'
-- WHERE Customer_Age = 36;

-- FIFTH STEP: country
-- UPDATE `bike sales data`
-- SET country = LTRIM(country);
-- UPDATE `bike sales data`
-- SET country = REPLACE(country, '  ', ' ')
-- WHERE country = 'United  States';

-- SIXTH STEP: product_description
-- UPDATE `bike sales data`
-- SET product_description = NULL
-- WHERE product_description = '';

-- SEVETH STEP: unit_price & unit_cost
-- SELECT *
-- FROM `bike sales data`
-- WHERE CAST(REPLACE(unit_price, '$', '') AS DECIMAL(10,2)) = 0
--    OR CAST(REPLACE(unit_cost, '$', '') AS DECIMAL(10,2)) = 0;
-- -- UPDATE `bike sales data`
-- SET unit_price = CONCAT('$', FORMAT(
--   CAST(REPLACE(REPLACE(unit_cost, '$', ''), ',', '') AS DECIMAL(10,2)) * order_quantity, 2))
-- WHERE sales_order_id = '000261702';
-- UPDATE `bike sales data`
-- SET unit_cost = CONCAT('$', FORMAT(
--   CAST(REPLACE(REPLACE(unit_price, '$', ''), ',', '') AS DECIMAL(10,2)) / order_quantity, 2))
-- WHERE sales_order_id = '000261699';

-- EIGHTH STEP: cost
-- UPDATE bike sales data
-- SET cost = CONCAT('$', FORMAT(
--   CAST(REPLACE(REPLACE(unit_cost, '$', ''), ',', '') AS DECIMAL(10,2)) * order_quantity, 2))
-- WHERE sales_order_id = '000261699'; correct? short answer

-- NINTH STEP: revenu
-- UPDATE `bike sales data`
-- SET revenue = CONCAT('$', FORMAT(
--   CAST(REPLACE(REPLACE(unit_price, '$', ''), ',', '') AS DECIMAL(10,2)) * order_quantity, 2))
-- WHERE sales_order_id = '000261702';