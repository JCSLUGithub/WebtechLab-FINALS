<!DOCTYPE html>
<html>
	<head>
		<title>Webslesson | PHP Mysql Shopping Cart</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="">
    	<meta name="author" content="">

	    <!-- Bootstrap core CSS -->
	    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	    <!-- Custom styles for this template -->
	    <link href="css/heroic-features.css" rel="stylesheet">
	</head>
	<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="myScrollspy">
      <div class="container">
        <a class="navbar-brand" href="index.php">Costumes and Attires</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <form action="search.php" method="POST" class="md-form active-cyan-2 mb-3">
      
        <input class="form-control" name="search" type="text" placeholder="Search" aria-label="Search">
      </form>
      <div>
      
      <?php
      
      //$topic=$_REQUEST["topic"];
      $sql = $query = "SELECT product.name, product.rental_price, concat(serviceprovider.owner_firstname, ' ', serviceprovider.owner_lastname), product_category.category_name from product JOIN product_category on product.category_id = product_category.category_id JOIN serviceprovider on product.product_providerid = serviceprovider.serviceprov_id WHERE product.name LIKE '%casual%'";
      $result = mysqli_query($connect,$sql);

      ?>

      </div>
            <li class="nav-item">
              <a class="nav-link" href="#costumes">Costumes</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#attires">Attires</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#others">Others</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="halloween.php">Rentals</a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="#about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="login.php">Login</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	