<?php
//print $_SERVER['DOCUMENT_ROOT'];
//echo '<br>';
//print $_SERVER['DOCUMENT_ROOT'].'/classes/DB.php';

include($_SERVER['DOCUMENT_ROOT'].'/classes/DB.php');

$success = 0;
$result = NULL;

if (isset($_POST['showdept'])) 
{

	$dept_cd = $_POST['dept_cd'];
	
	if(!(DB::query('SELECT * FROM Department WHERE dept_cd = :dept_cd', array(':dept_cd'=>$dept_cd))))
	{
		echo "Department does not exist !";
	}
	else
	{
		$result = DB::query('SELECT course_cd, course_name, no_of_credits, semester FROM Offering NATURAL JOIN Course WHERE dept_cd = :dept_cd', array(':dept_cd'=>$dept_cd));
		//echo "Successfully registered !";
		if($result)
			$success = 1;
		else
			$success = 2;
	}

}

?>

<h1>Department Details</h1>
<form action="show-department.php" method="post">
<input type="text" name="dept_cd" value="" placeholder="Department Code ..."><p />
<input type="submit" name="showdept" value="Show Department Details">
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
	echo "<h2>Showing Details of Department ".$dept_cd."</h2>";
	echo "<table style='border: solid 1px black;'>";
	echo "<tr><th>Course Code</th><th>Course Name</th><th>No. of Credits</th><th>Semester</th></tr>";

	$servername = "127.0.0.1";
	$username = "root";
	$password = "burn the wall";
	$dbname = "depcourse";

	try {
	    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	    $stmt = $conn->prepare('SELECT course_cd, course_name, no_of_credits, semester FROM Offering NATURAL JOIN Course WHERE dept_cd = :dept_cd'); 
	    $stmt->execute(array(':dept_cd'=>$dept_cd));

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
	echo "No courses exists !";
}

?>

