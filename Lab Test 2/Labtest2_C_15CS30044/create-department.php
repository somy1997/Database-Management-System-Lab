<?php
//print $_SERVER['DOCUMENT_ROOT'];
//echo '<br>';
//print $_SERVER['DOCUMENT_ROOT'].'/classes/DB.php';

include($_SERVER['DOCUMENT_ROOT'].'/classes/DB.php');

$success = 0;

if (isset($_POST['createdept'])) 
{

	$dept_cd = $_POST['dept_cd'];
	$dept_name = $_POST['dept_name'];
	$yearest = $_POST['yearest'];

	if(DB::query('SELECT * FROM Department WHERE dept_cd = :dept_cd', array(':dept_cd'=>$dept_cd)))
	{
		echo "Department already exists !";
	}
	else if(!(strlen($yearest)==4 && preg_match('/^[0-9]+$/', $yearest)))
	{
		echo "Invalid year!";
	}
	else
	{
		DB::query('INSERT INTO Department VALUES (:dept_cd, :dept_name, :yearest)', array(':dept_cd'=>$dept_cd, ':dept_name'=>$dept_name, ':yearest'=>$yearest));
		echo "Successfully added Department ".$dept_name."!";
		//$success = 1;
	}

}

?>

<h1>Create Department</h1>
<form action="create-department.php" method="post">
<input type="text" name="dept_cd" value="" placeholder="Department Code ..."><p />
<input type="text" name="dept_name" value="" placeholder="Department Name ..."><p />
<input type="text" name="yearest" value="" placeholder="Year of establishment ..."><p />
<input type="submit" name="createdept" value="Add Department">
</form>

<?php

if($success == 1)
{
	echo '<form action="login.php"><input type="submit" name="login" value="Go to Login Page"></form>';
}
?>

