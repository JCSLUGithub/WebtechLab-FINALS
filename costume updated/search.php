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
				?>
			<div class="col-md-4">
				<form method="post" action="costumes.php?action=add&id=<?php echo $row["id"]; ?>">
					<div class="panel">
					<div style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px;" align="center">
						<img src="images/<?php echo $row["product_image"]; ?>" class="img-responsive" /><br />

						<h4 class="text-info"><?php echo $row["name"]; ?></h4>

						<h4 class="text-danger">$ <?php echo $row["rental_price"]; ?></h4>

						<input type="hidden" name="hidden_name" value="<?php echo $row["name"]; ?>" />

						<input type="hidden" name="hidden_price" value="<?php echo $row["price"]; ?>" />

					</div>
				</div>
				</form>
			</div>
			<?php

		}	
	}
}	

	?>
</div>

<?php
include 'inc/footer.php';
?>