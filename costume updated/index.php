<?php 
session_start();
$connect = mysqli_connect("localhost", "root", "", "rent");

if(isset($_POST["add_to_cart"]))
{
  if(isset($_SESSION["shopping_cart"]))
  {
    $item_array_id = array_column($_SESSION["shopping_cart"], "item_id");
    if(!in_array($_GET["id"], $item_array_id))
    {
      $count = count($_SESSION["shopping_cart"]);
      $item_array = array(
        'item_id'     =>  $_GET["id"],
        'item_name'     =>  $_POST["hidden_name"],
        'item_price'    =>  $_POST["hidden_price"],
        'item_quantity'   =>  $_POST["quantity"]
      );
      $_SESSION["shopping_cart"][$count] = $item_array;
    }
    else
    {
      echo '<script>alert("Item Already Added")</script>';
    }
  }
  else
  {
    $item_array = array(
      'item_id'     =>  $_GET["id"],
      'item_name'     =>  $_POST["hidden_name"],
      'item_price'    =>  $_POST["hidden_price"],
      'item_quantity'   =>  $_POST["quantity"]
    );
    $_SESSION["shopping_cart"][0] = $item_array;
  }
}

if(isset($_GET["action"]))
{
  if($_GET["action"] == "delete")
  {
    foreach($_SESSION["shopping_cart"] as $keys => $values)
    {
      if($values["item_id"] == $_GET["id"])
      {
        unset($_SESSION["shopping_cart"][$keys]);
        echo '<script>alert("Item Removed")</script>';
        echo '<script>window.location="costumes.php"</script>';
      }
    }
  }
}

?>

<!DOCTYPE html>
<html lang="en">

  <head>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Costume And Attires</title>

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
			<div class="md-form active-cyan-2 mb-3">
				<input class="form-control" type="text" placeholder="Search" aria-label="Search">
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

    <!-- Page Content -->
   <div class="container">
 <header class="jumbotron my-4">
        <h1 class="display-3">Welcome Customer!</h1>
        <p class="lead">Need a costume for a party? Need an attire for an event? We got everything you need here at Costumes and Attires. We offer costumes and attires rentals for those who can't afford to buy brand new costumes or attires that will be use once. So shop now with us!</p>
        <a href="login.php" class="btn btn-primary btn-lg">Sign Up Now</a>
      </header>
          <div class="col">
          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="images/super.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images/jap.png" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images/att.jpg" alt="Third slide">
              </div>
            </div>
            </div>
          </div>
           
          <!-- Costume Section -->
        <section id="Costumes">
       <div class="container">
             <h1 class="text-center text-uppercase text-secondary mb-0">Costumes</h1>
             <br>
<?php
        $query = "SELECT * FROM halloween ORDER BY id ASC";
        $result = mysqli_query($connect, $query);
        if(mysqli_num_rows($result) > 0)
        {
          while($row = mysqli_fetch_array($result))
          {
        ?>
      <div class="col-md-4">
        <form method="post" action="costumes.php?action=add&id=<?php echo $row["id"]; ?>">
          <div class="panel">
          <div style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px;" align="center">
            <img src="images/<?php echo $row["image"]; ?>" class="img-responsive" /><br />

            <h4 class="text-info"><?php echo $row["name"]; ?></h4>

            <h4 class="text-danger">$ <?php echo $row["price"]; ?></h4>

            <input type="hidden" name="hidden_name" value="<?php echo $row["name"]; ?>" />

            <input type="hidden" name="hidden_price" value="<?php echo $row["price"]; ?>" />

          </div>
        </div>
        </form>
      </div>
      <?php
          }
        }
      ?>
      <?php
        $query = "SELECT * FROM cosplay ORDER BY id ASC";
        $result = mysqli_query($connect, $query);
        if(mysqli_num_rows($result) > 0)
        {
          while($row = mysqli_fetch_array($result))
          {
        ?>
      <div class="col-md-4">
        <form method="post" action="costumes.php?action=add&id=<?php echo $row["id"]; ?>">
          <div class="panel">
          <div style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px;" align="center">
            <img src="images/<?php echo $row["image"]; ?>" class="img-responsive" /><br />

            <h4 class="text-info"><?php echo $row["name"]; ?></h4>

            <h4 class="text-danger">$ <?php echo $row["price"]; ?></h4>

            <input type="hidden" name="hidden_name" value="<?php echo $row["name"]; ?>" />

            <input type="hidden" name="hidden_price" value="<?php echo $row["price"]; ?>" />

          </div>
        </div>
        </form>
      </div>
      <?php
          }
        }
      ?>
      <?php
        $query = "SELECT * FROM christmas ORDER BY id ASC";
        $result = mysqli_query($connect, $query);
        if(mysqli_num_rows($result) > 0)
        {
          while($row = mysqli_fetch_array($result))
          {
        ?>
      <div class="col-md-4">
        <form method="post" action="costumes.php?action=add&id=<?php echo $row["id"]; ?>">
          <div class="panel">
          <div style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px;" align="center">
            <img src="images/<?php echo $row["image"]; ?>" class="img-responsive" /><br />

            <h4 class="text-info"><?php echo $row["name"]; ?></h4>

            <h4 class="text-danger">$<?php echo $row["price"]; ?></h4>

            <input type="hidden" name="hidden_name" value="<?php echo $row["name"]; ?>" />

            <input type="hidden" name="hidden_price" value="<?php echo $row["price"]; ?>" />

          </div>
        </div>
        </form>
      </div>
      <?php
          }
        }
      ?>
      </section>

      <section id="attires">
       <div class="container">
             <h1 class="text-center text-uppercase text-secondary mb-0">Attires</h1>
             <br>
        <?php
        $query = "SELECT * FROM formal ORDER BY id ASC";
        $result = mysqli_query($connect, $query);
        if(mysqli_num_rows($result) > 0)
        {
          while($row = mysqli_fetch_array($result))
          {
        ?>
      <div class="col-md-4">
        <form method="post" action="costumes.php?action=add&id=<?php echo $row["id"]; ?>">
          <div class="panel">
          <div style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px;" align="center">
            <img src="images/<?php echo $row["image"]; ?>" class="img-responsive" /><br />

            <h4 class="text-info"><?php echo $row["name"]; ?></h4>

            <h4 class="text-danger">₱ <?php echo $row["price"]; ?></h4>

            <input type="hidden" name="hidden_name" value="<?php echo $row["name"]; ?>" />

            <input type="hidden" name="hidden_price" value="<?php echo $row["price"]; ?>" />

          </div>
        </div>
        </form>
      </div>
      <?php
          }
        }
      ?>
      <?php
        $query = "SELECT * FROM casual ORDER BY id ASC";
        $result = mysqli_query($connect, $query);
        if(mysqli_num_rows($result) > 0)
        {
          while($row = mysqli_fetch_array($result))
          {
        ?>
      <div class="col-md-4">
        <form method="post" action="costumes.php?action=add&id=<?php echo $row["id"]; ?>">
          <div class="panel">
          <div style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px;" align="center">
            <img src="images/<?php echo $row["image"]; ?>" class="img-responsive" /><br />

            <h4 class="text-info"><?php echo $row["name"]; ?></h4>

            <h4 class="text-danger">₱ <?php echo $row["price"]; ?></h4>

            <input type="hidden" name="hidden_name" value="<?php echo $row["name"]; ?>" />

            <input type="hidden" name="hidden_price" value="<?php echo $row["price"]; ?>" />

          </div>
        </div>
        </form>
      </div>
      <?php
          }
        }
      ?>
      </section>
      <!-- Others -->
        

      <section id="others">
       <div class="container">
             <h1 class="text-center text-uppercase text-secondary mb-0">Others</h1>
             <br>
          <?php
        $query = "SELECT * FROM others ORDER BY id ASC";
        $result = mysqli_query($connect, $query);
        if(mysqli_num_rows($result) > 0)
        {
          while($row = mysqli_fetch_array($result))
          {
        ?>
      <div class="col-md-4">
        <form method="post" action="costumes.php?action=add&id=<?php echo $row["id"]; ?>">
          <div class="panel">
          <div style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px;" align="center">
            <img src="images/<?php echo $row["image"]; ?>" class="img-responsive" /><br />

            <h4 class="text-info"><?php echo $row["name"]; ?></h4>

            <h4 class="text-danger">₱ <?php echo $row["price"]; ?></h4>

            <input type="hidden" name="hidden_name" value="<?php echo $row["name"]; ?>" />

            <input type="hidden" name="hidden_price" value="<?php echo $row["price"]; ?>" />

          </div>
        </div>
        </form>
      </div>
      <?php
          }
        }
      ?>
      </section>
           <br><br><br><br><br><br><br>
        <!-- /.col-lg-9 -->
    </div>
    <!-- /.container -->
  <section id="about">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary">About</h2>
        <div class="row">
          <div class="col-lg-4 ml-auto">
            <p class="lead">This website contains summary for the final period topics. In the Server-Side Web Scripting we inlude JSP, PHP, Python, and ASP.Net. The Web Application security was based on OWASP Top 10 Web Application Security Risks </p>
          </div>
          <div class="col-lg-4 mr-auto">
            <p class="lead">We are group one from 9340A class under Ms. Clemente Macon. This website aims to develop a website for academic purposes where students can read, watch videos, and take quizzes for assessment. Users need to register their account in the Register Navigation.</p>
          </div>
        </div>
      </div>
    </section>
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Webtech 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
  </body>

</html>
