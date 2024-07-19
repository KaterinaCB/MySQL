/* 
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
*/

DELIMITER $$
CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE days INT;
	DECLARE hours INT;
	DECLARE minutes INT;
	DECLARE secs INT;
	DECLARE result VARCHAR(255);

	SET days = seconds DIV (24 * 3600);
	SET seconds = seconds MOD (24 * 3600);
	SET hours = seconds DIV 3600;
	SET seconds = seconds MOD 3600;
	SET minutes = seconds DIV 60;
	SET secs = seconds MOD 60;

	SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');

	RETURN result;
END $$;
DELIMITER ;

SELECT format_seconds(123456);

/*
2.	Выведите только четные числа от 1 до 10 включительно. Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/

DROP PROCEDURE get_even;
DELIMITER $$
CREATE PROCEDURE get_even(start INT, end INT)
BEGIN
	DECLARE i INT DEFAULT start;
    DECLARE res TEXT DEFAULT NULL;
    WHILE  i <= end DO
        IF i % 2 = 0 THEN
			IF res IS NULL THEN
				SET res = CONCAT(i);
			ELSE
				SET res = CONCAT(res, ', ', i);
			END IF;
		END IF;
        SET i = i + 1;
    END WHILE;
	SELECT res;
END $$
DELIMITER ;

CALL get_even(1, 10);

