<?php
//print $_SERVER['DOCUMENT_ROOT'];
//echo '<br>';
//print $_SERVER['DOCUMENT_ROOT'].'/classes/DB.php';

include($_SERVER['DOCUMENT_ROOT'].'/classes/DB.php');

$success = 0;

if (isset($_POST['createcourse'])) 
{

	$course_cd = $_POST['course_cd'];
	$course_name = $_POST['course_name'];
	$no_of_credits = $_POST['no_of_credits'];

	if(DB::query('SELECT * FROM Course WHERE course_cd = :course_cd', array(':course_cd'=>$course_cd)))
	{
		echo "Course already exists !";
	}
	else if(!($no_of_credits == '2' || $no_of_credits == '3' || $no_of_credits == '4' || $no_of_credits == '5'))
	{
		echo "Invalid credits!";
	}
	else
	{
		DB::query('INSERT INTO Course VALUES (:course_cd, :course_name, :no_of_credits)', array(':course_cd'=>$course_cd, ':course_name'=>$course_name, ':no_of_credits'=>$no_of_credits));
		echo "Successfully added Course ".$course_name."!";
		//$success = 1;
	}

}

?>

<h1>Create Course</h1>
<form action="create-course.php" method="post">
<input type="text" name="course_cd" value="" placeholder="Course Code ..."><p />
<input type="text" name="course_name" value="" placeholder="Course Name ..."><p />
<input type="text" name="no_of_credits" value="" placeholder="No. of credits ..."><p />
<input type="submit" name="createcourse" value="Add Course">
</form>

<?php

if($success == 1)
{
	echo '<form action="login.php"><input type="submit" name="login" value="Go to Login Page"></form>';
}
?>

