DECLARE
CURSOR e_employee is  SELECT NAME,SALARY FROM employee;
type e_list is varray (6) of employee.NAME%type;
type es_list is varray (6) of employee.SALARY%type;
name_list e_list := e_list();salary_list es_list :=es_list();
counter integer :=0;
BEGIN
	FOR n IN e_employee LOOP
		counter := counter + 1;name_list.extend; salary_list.extend;
		name_list(counter) := n.name;salary_list(counter) := n.salary;
		dbms_output.put_line('Employee('||counter 			||'):'||name_list(counter)||', salary:'||salary_list(counter));
	END LOOP;
END;
/
