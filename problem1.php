<?php
//Array of name, email and twitter data
$input = array(
    'name' => 'Dhruv Patel',
    'email' => 'dpate171@nyit.edu',
    'twitter' => '@DhruvP1110'
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
	//If twitter handle is available check for @ sign in the begining
	else if($input['twitter'] != ""){
		if(!preg_match("/\@[a-z0-9_]+/i", $input['twitter'])){
			throw new Exception("Twitter handle must be start with @ sign");
		}
	}
}


try {
    validator($input);
	echo "Inputs accepted";
}
catch(Exception $exception) {
    echo 'Exception raised: ' .$exception->getMessage();
}
?>