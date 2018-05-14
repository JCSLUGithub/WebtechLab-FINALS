<?php 
session_start();
$connect = mysqli_connect("localhost", "root", "", "weblove_attirerentals");
include 'inc/header.php';

?>
<br>
<div>
	<?php
	if(isset($_POST['search'])){
		$search = mysqli_real_escape_string($connect,$_POST['search']);
		$sql = "SELECT product.name, product.rental_price, concat(serviceprovider.owner_firstname, ' ', serviceprovider.owner_lastname), product_category.category_name, product.product_image from product JOIN product_category on product.category_id = product_category.category_id JOIN serviceprovider on product.product_providerid = serviceprovider.serviceprov_id WHERE product.name LIKE '%$search%' OR product.rental_price LIKE '%$search%' OR serviceprovider.owner_firstname LIKE '%$search%' OR serviceprovider.owner_lastname LIKE '%$search%' OR product_category.category_name LIKE '%$search%' ";
		//$sql = "SELECT * FROM casual WHERE name LIKE '%$search%' OR price LIKE '%$search%' ";
		$result = mysqli_query($connect, $sql);
		$queryResult = mysqli_num_rows($result);

		if($queryResult > 0){
			while($row = mysqli_fetch_assoc($result)){
				echo "<div>
					<h3>".$row['name']."</h3>
					<h3>".$row['rental_price']."</h3>
					</div>"
					?>

					<img src="images/<?php echo $row["product_image"]; ?>" class="img-responsive" />
					<?php
			}

		}else{
			echo "There are no results matching your search!";
		}
	}


	?>
</div>

<?php
include 'inc/footer.php';
?>