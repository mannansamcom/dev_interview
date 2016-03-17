<?php
$employees = array('Travis' => 29, 'John' => 30, 'Manny' => 24, 'Gabriel' => 20, 'Yogi' => 22);
ksort($employees);
print_r(json_encode($employees));
?>