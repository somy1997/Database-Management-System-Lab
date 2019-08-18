CREATE OR REPLACE PROCEDURE 
    findMin(x IN number, y IN number) AS
    BEGIN
	IF x < y THEN
		dbms_output.put_line(x);
	ELSE
		dbms_output.put_line(y);
	END IF;
    END;
   /
