<?php
//print $_SERVER['DOCUMENT_ROOT'];
//echo '<br>';
//print $_SERVER['DOCUMENT_ROOT'].'/classes/DB.php';

include($_SERVER['DOCUMENT_ROOT'].'/classes/DB.php');

$success = 0;
$result = NULL;

if (isset($_POST['showcourse'])) 
{

	$course_cd = $_POST['course_cd'];
	
	if(!(DB::query('SELECT * FROM Course WHERE course_cd = :course_cd', array(':course_cd'=>$course_cd))))
	{
		echo "Course does not exist !";
	}
	else
	{
		$result = DB::query('SELECT dept_cd, dept_name, year_established, semester FROM Offering NATURAL JOIN Department WHERE course_cd = :course_cd', array(':course_cd'=>$course_cd));
		//echo "Successfully registered !";
		if($result)
			$success = 1;
		else
			$success = 2;
	}

}

?>

<h1>Course Details</h1>
<form action="show-course.php" method="post">
<input type="text" name="course_cd" value="" placeholder="Course Code ..."><p />
<input type="submit" name="showcourse" value="Show Course Details">
</form>

<?php

class TableRows extends RecursiveIteratorIterator { 
    function __construct($it) { 
        parent::__construct($it, self::LEAVES_ONLY); 
    }

    function current() {
        return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
    }

    function beginChildren() { 
        echo "<tr>"; 
    } 

    function endChildren() { 
        echo "</tr>" . "\n";
    } 
} 

if($success == 1)
{
	echo "<h2>Showing Details of Course ".$course_cd."</h2>";
	echo "<table style='border: solid 1px black;'>";
	echo "<tr><th>Department Code</th><th>Department Name</th><th>Year Established</th><th>Semester</th></tr>";

	$servername = "127.0.0.1";
	$username = "root";
	$password = "burn the wall";
	$dbname = "depcourse";

	try {
	    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	    $stmt = $conn->prepare('SELECT dept_cd, dept_name, year_established, semester FROM Offering NATURAL JOIN Department WHERE course_cd = :course_cd'); 
	    $stmt->execute(array(':course_cd'=>$course_cd));

	    // set the resulting array to associative
	    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
	    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
	        echo $v;
	    }
	}
	catch(PDOException $e) {
	    echo "Error: " . $e->getMessage();
	}
	$conn = null;
	echo "</table>";
}
else if($success == 2)
{
	echo "No departments exists !";
}

?>

