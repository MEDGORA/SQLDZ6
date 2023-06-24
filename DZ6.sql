DROP DATABASE IF EXISTS lesson_6;
CREATE DATABASE lesson_6;
USE lesson_6;

-- Задание 1
DROP PROCEDURE IF EXISTS transfer_of_seconds;
DELIMITER //
CREATE PROCEDURE transfer_of_seconds
(
	IN input_numbers INT 
)
BEGIN
	DECLARE n INT;
    DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE secondes INT DEFAULT 0;
    
    SET n = input_numbers;
	
    set days = n DIV 86400; 
    set hours =  n DIV 3600 - days * 24; 
    set minutes = n DIV 60 - days * 1440 - hours * 60; 
    set secondes = n - days * 86400 - hours * 3600 - minutes * 60;
    
	SELECT days,
		hours,
        minutes,
        secondes;
END //

CALL transfer_of_seconds(123456);

-- Задание 2
DROP PROCEDURE IF EXISTS even;
DELIMITER //
CREATE PROCEDURE even
(
	IN input_numbers INT 
)
BEGIN
	DECLARE n INT;
    DECLARE i INT DEFAULT 0;
    DECLARE result VARCHAR(45) DEFAULT "";
    SET n = input_numbers;

	REPEAT
        SET n = n - 2;
        SET i = i + 2;
        SET result = CONCAT(result, i, ",");
        UNTIL n <= 0 
	END REPEAT;
	SELECT  result;
END //

CALL even(10);
	
