create table t as
select * from test1 where a1<8;

delimiter //

CREATE PROCEDURE simpleproc (OUT param1 INT)
 BEGIN
   SELECT COUNT(*) INTO param1 FROM t;
 END//


delimiter ;

CALL simpleproc(@a);

SELECT @a;

CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!');

