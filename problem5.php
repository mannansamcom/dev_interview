<?php

//defining global variables
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASS','');
define('DB_NAME','dev_interview');

//set timezone to America/New_York
date_default_timezone_set('America/New_York');
// Establishing connection to MySQL server
$con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// Check connection
if ($con->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
} 

//Configuring start and end timestamp
$start_timestamp = "2016-03-19 00:00:00";
$end_timestamp = "2016-03-19 23:59:59";

/*Query flow
 *First it fetches various card_id whoes timestamp is betwwen givern credentials
 *Then in cart table, SQL fetches product_id and qty based on card_id
 *After getting product_id, it's look for price in product table
*/
$query = $con->query("SELECT sum(cart.qty) AS 'productSum', sum(cart.qty * product.price) AS 'productValue' FROM orders, cart, product WHERE (orders.timestamp BETWEEN '$start_timestamp' AND '$end_timestamp') AND orders.cart_id=cart.cart_id AND cart.product_id=product._id");
if($query->num_rows > 0){
	while ($row = $query->fetch_object()) {
		//We should check, if data is null or not
		echo "Total number of products ordered :  " . (is_null($row->productSum) ? 0 : $row->productSum);
		echo "<br />Total value of products ordered :  " . (is_null($row->productValue) ? 0 : $row->productValue);
    }
}
?>