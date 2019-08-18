DECLARE
SUBTYPE string IS char(11);
SUBTYPE alphanumeric IS varchar2(100);
name string;
rollno alphanumeric;
BEGIN
name := 'Shabharesh ';
rollno := '16CS60R69';
dbms_output.put_line('Hello '||name||'.Your Roll No:'||rollno);
END;
/
