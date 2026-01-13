USE global_dataset;

SELECT * FROM global_superstore
ORDER BY 3;

SELECT DISTINCT(Region), Market, Country
FROM global_superstore
ORDER BY 2;

SELECT COUNT(*) FROM global_superstore;

SELECT *
FROM global_superstore
WHERE Region = 'EMEA';
-- EMEA, In this context covers region such as  europe and middle east asia(west),central asia Africa , so i would like to split those into 2 differnt markets europe(EU)  and west asia
-- West Asia countries are Bahrain, Iran, Iraq, Israel, Jordan, Kuwait, Lebanon, Oman, Palestine, Qatar, Saudi Arabia, Syria, United Arab Emirates, Yemen
-- Euro countries are Poland, Ukraine, Belarus, Russia, Lithuania, Romania, Turkey, Hungary, Georgia, Albania, Montenegro, Austria, Estonia, Czech Republic, Bulgaria,
-- Slovenia, Bosnia and Herzegovina, Croatia, Moldova, Slovakia
-- Central asia are Azerbaijan, Mongolia, Kyrgyzstan, Uzbekistan, Turkmenistan, Kazakhstan, Tajikistan
-- Also, in APAC, Central asia was used for countries in south asia. same for using northasia in lieu of east asia

-- Also, North, East, West, South seems generic and could be confused easily. as N. America and N. Europe are separate.
-- The US markrt is separate so East, west, south US isn't same as East, West, South America;

SELECT DISTINCT(Country)
FROM global_superstore
WHERE Region = 'EMEA';

SELECT *
FROM global_superstore
WHERE Region = 'Central';

SELECT DISTINCT(Country)
FROM global_superstore
WHERE Region = 'West';

SELECT DISTINCT(Country)
FROM global_superstore
WHERE Region = 'Central';

SELECT *
FROM global_superstore
WHERE Region = 'East';

SELECT *
FROM global_superstore
WHERE Region = 'West';

SELECT DISTINCT(Country), Market, Region
FROM global_superstore
WHERE Region = 'West';

SELECT *
FROM global_superstore
WHERE Region = 'North';

SELECT *
FROM global_superstore
WHERE Region = 'Oceania';


SELECT DISTINCT(Market), Region
FROM global_superstore
;

SELECT DISTINCT(Region), Country
FROM global_superstore
WHERE Market = 'APAC';

SELECT DISTINCT(Region), Country
FROM global_superstore
WHERE Market = 'LATAM';

DROP TABLE IF EXISTS superstore;
CREATE TABLE superstore
LIKE global_superstore;

INSERT INTO superstore
SELECT *
FROM global_superstore;

SELECT Region
FROM superstore
WHERE Market IN ('US', 'EU')
;

;
-- EMEA, In this context covers region such as europe and middle east asia(west),central asia Africa , so i would like to split those into 2 differnt markets europe(EU)  and west asia
-- West Asia countries are Bahrain, Iran, Iraq, Israel, Jordan, Kuwait, Lebanon, Oman, Palestine, Qatar, Saudi Arabia, Syria, United Arab Emirates, Yemen
-- Euro countries are Poland, Ukraine, Belarus, Russia, Lithuania, Romania, Turkey, Hungary, Georgia, Albania, Montenegro, Austria, Estonia, Czech Republic, Bulgaria,
-- Slovenia, Bosnia and Herzegovina, Croatia, Moldova, Slovakia
-- Central asia are Azerbaijan, Mongolia, Kyrgyzstan, Uzbekistan, Turkmenistan, Kazakhstan, Tajikistan
-- Also, in APAC, Central asia was used for countries in south asia. same for using northasia in lieu of east asia, central EU changed as west EU

-- Also, North, East, West, South seems generic and could be confused easily. as N. America and N. Europe are separate.
-- The US markrt is separate so East, west, south US isn't same as East, West, South America;
-- EU
SELECT CONCAT(Region, " ", Market)
FROM superstore
WHERE Market IN ('US', 'EU')
;

UPDATE superstore
SET Region = CONCAT(Region, " ", Market)
WHERE Market IN ('US', 'EU');

SELECT Region
FROM superstore
WHERE Market IN ('US', 'EU');

SELECT CASE
	WHEN Country IN ("Bahrain" , "Iran", "Iraq", "Israel", "Jordan",
				"Kuwait", "Lebanon", "Oman", "Palestine", "Qatar", "Saudi Arabia", "Syria", "United Arab Emirates", "Yemen") THEN "West Asia"
	WHEN Country IN ("Poland", "Ukraine", "Belarus", "Russia", "Lithuania", "Romania", "Hungary", "Czech Republic", "Slovakia", "Moldova", "Bulgaria") THEN "East EU"
    WHEN Country IN ("Turkey", "Georgia", "Albania", "Montenegro", "Slovenia", "Bosnia and Herzegovina", "Croatia") THEN "South EU"
    WHEN Country IN ("Austria") THEN "West EU"
    WHEN Country IN ("Estonia") THEN "North EU"
	WHEN Country IN ("Azerbaijan", "Mongolia", "Kyrgyzstan", "Uzbekistan", "Turkmenistan", "Kazakhstan", "Tajikistan") THEN "central Asia"
    ELSE 'Unknown'
    
END AS EMEA_Region
FROM superstore
WHERE Market = 'EMEA';

UPDATE superstore
SET Region = 
CASE
	WHEN Country IN ("Bahrain" , "Iran", "Iraq", "Israel", "Jordan",
				"Kuwait", "Lebanon", "Oman", "Palestine", "Qatar", "Saudi Arabia", "Syria", "United Arab Emirates", "Yemen") THEN "West Asia"
	WHEN Country IN ("Poland", "Ukraine", "Belarus", "Russia", "Lithuania", "Romania", "Hungary", "Czech Republic", "Slovakia", "Moldova", "Bulgaria") THEN "East EU"
    WHEN Country IN ("Turkey", "Georgia", "Albania", "Montenegro", "Slovenia", "Bosnia and Herzegovina", "Croatia") THEN "South EU"
    WHEN Country IN ("Austria") THEN "West EU"
    WHEN Country IN ("Estonia") THEN "North EU"
	WHEN Country IN ("Azerbaijan", "Mongolia", "Kyrgyzstan", "Uzbekistan", "Turkmenistan", "Kazakhstan", "Tajikistan") THEN "central Asia"
    ELSE 'Unknown'
    
END
WHERE Market = 'EMEA';

SELECT DISTINCT(Market)
FROM superstore;

SELECT CASE
	WHEN Country IN ("Bahrain" , "Iran", "Iraq", "Israel", "Jordan",
				"Kuwait", "Lebanon", "Oman", "Palestine", "Qatar", "Saudi Arabia", "Syria", "United Arab Emirates", "Yemen") THEN "MECA"
	WHEN Country IN ("Poland", "Ukraine", "Belarus", "Russia", "Lithuania", "Romania", "Turkey", "Hungary",
					"Georgia", "Albania", "Montenegro", "Austria", "Estonia", "Czech Republic", "Bulgaria",
                    "Slovenia", "Bosnia and Herzegovina", "Croatia", "Moldova", "Slovakia") THEN "EU"
	WHEN Country IN ("Azerbaijan", "Mongolia", "Kyrgyzstan", "Uzbekistan", "Turkmenistan", "Kazakhstan", "Tajikistan") THEN "MECA"
    ELSE 'Unknown'
END AS EMEA
FROM superstore
WHERE Market = 'EMEA'
ORDER BY 1;


UPDATE superstore
SET Market = 
CASE
	WHEN Country IN ("Bahrain" , "Iran", "Iraq", "Israel", "Jordan",
				"Kuwait", "Lebanon", "Oman", "Palestine", "Qatar", "Saudi Arabia", "Syria", "United Arab Emirates", "Yemen") THEN "MECA"
	WHEN Country IN ("Poland", "Ukraine", "Belarus", "Russia", "Lithuania", "Romania", "Turkey", "Hungary",
					"Georgia", "Albania", "Montenegro", "Austria", "Estonia", "Czech Republic", "Bulgaria",
                    "Slovenia", "Bosnia and Herzegovina", "Croatia", "Moldova", "Slovakia") THEN "EU"
	WHEN Country IN ("Azerbaijan", "Mongolia", "Kyrgyzstan", "Uzbekistan", "Turkmenistan", "Kazakhstan", "Tajikistan") THEN "MECA"
    ELSE 'Unknown'
END

WHERE Market = 'EMEA';

-- Also, in APAC, Central asia was used for countries in south asia. same for using northasia in lieu of east asia, central EU changed as west EU

-- Also, North, East, West, South seems generic and could be confused easily. as N. America and N. Europe are separate.
-- The US markrt is separate so East, west, south US isn't same as East, West, South America;
-- EU

SELECT DISTINCT(Country)
FROM superstore
WHERE Region = "Central" AND Market = "LATAM";

SELECT CONCAT(Region, " America") 
FROM superstore
WHERE Market IN ('LATAM') AND Region <> "Caribbean"
;

UPDATE superstore
SET Region = CONCAT(Region, " America") 
WHERE Market IN ('LATAM') AND Region <> "Caribbean";


UPDATE superstore
SET Region = "South Asia"
WHERE Region = "Central Asia";

UPDATE superstore
SET Region = "East Asia"
WHERE Region = "North Asia"
;

UPDATE superstore
SET Region = "Central EU"
WHERE Region = "West EU"
;

SELECT DISTINCT(region)
FROM superstore
ORDER  BY 1;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'superstore';


SELECT *, COUNT(*) counts
FROM superstore
GROUP BY Category, City, Country, `Customer ID`, `Customer Name`, Discount, Market, 
	`Order Date`, `Order ID`, `Order Priority`, `Postal Code`, `Product ID`, `Product Name`,
    Profit, Quantity, Region, `Row ID`, Sales, Segment, `Ship Date`, `Ship Mode`, `Shipping Cost`, State, `Sub-Category`
ORDER BY counts DESC;

SELECT COUNT(DISTINCT(`Product ID`)), COUNT(*)
FROM superstore;

SELECT DISTINCT(Segment)
FROM superstore;

SELECT *
FROM superstore
WHERE `Postal Code` IS NOT NULL AND `Postal Code` <> ""
ORDER BY `Postal code`;
-- Only US has postal code in use;

SELECT `Postal Code`, LENGTH(`Postal Code`)
FROM superstore
WHERE Country = 'Australia';

SELECT *
FROM superstore
WHERE Profit > 0 AND  `Product Name` = "Hoover Stove, White"
ORDER BY `Product ID` ;

SELECT DISTINCT(`Sub-Category`)
FROM superstore
;

-- handler
;
-- Normalizing data types
SELECT STR_TO_DATE('20-02-1989', '%d-%m-%Y') as newd
;

SELECT `Order Date`, `Ship Date` , STR_TO_DATE(`Order Date`, '%d-%m-%Y'), 
		STR_TO_DATE(`Ship Date`, '%d-%m-%Y')
FROM superstore;

UPDATE superstore
SET `Order Date` = STR_TO_DATE(`Order Date`, '%d-%m-%Y');
UPDATE superstore
SET `Ship Date` = STR_TO_DATE(`Ship Date`, '%d-%m-%Y');

ALTER TABLE superstore
MODIFY COLUMN `Order Date` DATE;

SELECT `Order Date`, `Ship Date`, `waiting time`, Category
FROM superstore
WHERE `waiting time` > 5;

ALTER TABLE superstore
MODIFY COLUMN `Ship Date` DATE;

ALTER TABLE superstore
ADD `Waiting time` INT;

UPDATE superstore
SET `Waiting time` = DATEDIFF(`Ship Date`,`Order Date`);


SELECT *
FROM superstore;