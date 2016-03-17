<?php
$query_string = false;
if(isset($_POST["form_post"])){
	$query_string = true;
	$name = $_POST["fname"] . " " . $_POST["lname"];
	$email = $_POST["email"];
	$twitter = $_POST["twitter_handle"];
	$input = array("name" => $name,
					"email" => $email,
					"twitter" => $twitter);
}
?>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script type="text/javascript">
function validateData(){
	var email = $("#email").val();
	var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  	if(!regex.test(email)){
		alert("Email validation error");
  	}else{
		$("#frm").submit();
	}
	return false;
}
</script>
</head>
<body>
<section>
<?php
if($query_string){
	echo "<pre>";
	print_r($input);
	echo "</pre>";
}else{
	?>
    <form id="frm" name="frm" action="#" method="post" onsubmit="return validateData();">
        <input type="hidden" name="form_post" value="true" />
        <table>
            <tr>
                <td><label for="fname">First name</label></td>
                <td><input type="text" name="fname" id="fname" placeholder="Your first name" required="required" /></td>
            </tr>
            <tr>
                <td><label for="lname">Last name</label></td>
                <td><input type="text" name="lname" id="lname" placeholder="Your last name" required="required" /></td>
            </tr>
            <tr>
                <td><label for="email">Email</label></td>
                <td><input type="email" name="email" id="email" placeholder="Your email id" required="required" /></td>
            </tr>
            <tr>
                <td><label for="twitter_handle">Twitter handle</label></td>
                <td><input type="text" name="twitter_handle" id="twitter_handle" placeholder="@example" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Submit" /></td>
            </tr>
         </table>
    </form>
<?php
}
?>
</section>
</body>
</html>