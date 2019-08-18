DECLARE
total decimal(18,2);
BEGIN
	total := totalsalary();
	dbms_output.put_line('Sum of Salaries:'||total);
END;
/
