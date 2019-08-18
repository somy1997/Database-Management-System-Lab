DECLARE
e_id employee.ID%type := 1;
e_name employee.NAME%type;
e_age employee.AGE%type;
e_sal employee.SALARY%type;
BEGIN
SELECT NAME, AGE, SALARY INTO e_name, e_age, e_sal
FROM employee
WHERE ID = e_id;
dbms_output.put_line
('Employee ' ||e_name || ' having age ' || e_age || ' earns ' || e_sal);
END;
/
