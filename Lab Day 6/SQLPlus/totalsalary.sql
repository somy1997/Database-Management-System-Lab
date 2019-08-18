CREATE OR REPLACE FUNCTION totalsalary
RETURN number IS
total decimal(18,2) := 0;
BEGIN
	SELECT SUM(SALARY) into total FROM employee;
RETURN total;
END;
/
