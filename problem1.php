<?php
//Array of name, email and twitter data
$input = array(
    'name' => 'Dhruv Patel',
    'email' => 'dpate171@nyit.edu',
    'twitter' => 'DhruvP1110'
);

//function for validating data on various basis
function validator($input){
    if(empty($input['name'])){
		throw new Exception("Name can't be empty");
	}
	//first trim the name and seperate via space,. After that count array elements, if array contains 2 elements then valid else throw exception
    elseif(count(explode(' ', trim($input['name'])))!=2){ 
		throw new Exception("First name and last name, both required");
	}
    else if(empty($input['email'])){
		throw new Exception("Email can't be empty");
	}
	//Apply php inbuilt email filter
    else if(!filter_var($input['email'], FILTER_VALIDATE_EMAIL)){
		throw new Exception("Supplied email is not valid");
	}
	else{
		echo "Inputs accepted";
	}
}


try {
    validator($input);
}
catch(Exception $exception) {
    echo 'Exception raised: ' .$exception->getMessage();
}
?>