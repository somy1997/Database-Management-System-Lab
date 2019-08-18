<?php
//print $_SERVER['DOCUMENT_ROOT'];
//echo '<br>';
//print $_SERVER['DOCUMENT_ROOT'].'/classes/DB.php';

include($_SERVER['DOCUMENT_ROOT'].'/classes/DB.php');

$success = 0;

if (isset($_POST['createoffering'])) 
{

	$dept_cd = $_POST['dept_cd'];
	$course_cd = $_POST['course_cd'];
	$semester = $_POST['semester'];
	
	if(!(DB::query('SELECT * FROM Department WHERE dept_cd = :dept_cd', array(':dept_cd'=>$dept_cd))))
	{
		echo "Department does not exist !";
	}
	else if(!(DB::query('SELECT * FROM Course WHERE course_cd = :course_cd', array(':course_cd'=>$course_cd))))
	{
		echo "Course does not exist !";
	}
	else if(!($semester == 'S' || $semester == 'A'))
	{
		echo "Invalid semester!";
	}
	else if(DB::query('SELECT * FROM Offering WHERE dept_cd = :dept_cd AND course_cd = :course_cd AND semester = :semester', array(':dept_cd'=>$dept_cd,':course_cd'=>$course_cd, ':semester'=>$semester)))
	{
		echo "Offering already exists !";
	}
	else
	{
		DB::query('INSERT INTO Offering VALUES (:dept_cd, :course_cd, :semester)', array(':dept_cd'=>$dept_cd,':course_cd'=>$course_cd, ':semester'=>$semester));
		echo "Now ".$dept_cd." offers ".$course_cd." in semester ".$semester."!";
		//$success = 1;
	}

}

?>

<h1>Create Offering</h1>
<form action="create-offering.php" method="post">
<input type="text" name="dept_cd" value="" placeholder="Department Code ..."><p />
<input type="text" name="course_cd" value="" placeholder="Course Code ..."><p />
<input type="text" name="semester" value="" placeholder="Semester ..."><p />
<input type="submit" name="createoffering" value="Add Offering">
</form>

<?php

if($success == 1)
{
	echo '<form action="login.php"><input type="submit" name="login" value="Go to Login Page"></form>';
}
?>

