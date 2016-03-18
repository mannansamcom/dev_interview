<?php
$employees = array('Travis' => 29, 'John' => 30, 'Manny' => 24, 'Gabriel' => 20, 'Yogi' => 22);
//Sorting array alphabatically
ksort($employees);
$result = array();
//Created a loop for iterating keys and values
foreach ($employees as $key => $value) {
	$temp_array = array();
    $temp_array['name'] = $key;
    $temp_array['age'] = $value;
    $result[] = $temp_array;
	$temp_array = NULL;
}
echo("<pre>");
print_r(json_encode($result));
echo("</pre>");
?>