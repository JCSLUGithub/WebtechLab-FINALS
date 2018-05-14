<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Administrator - Product Management</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS -->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/sb-admin.css" rel="stylesheet">
    </head>
    
    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            if (session.getAttribute("username") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
          <a class="navbar-brand" href="index.jsp">Web-LOVE Adminsitration</a>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="index.jsp">
                  <i class="fa fa-fw fa-dashboard"></i>
                  <span class="nav-link-text">Dashboard</span>
                </a>
              </li>
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                <a class="nav-link" href="transaction.jsp">
                  <i class="fa fa-fw fa-link"></i>
                  <span class="nav-link-text">Transaction Management</span>
                </a>
              </li>
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                <a class="nav-link" href="producttable.jsp">
                  <i class="fa fa-fw fa-sitemap"></i>
                  <span class="nav-link-text">Product Management</span>
                </a>
              </li>
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
                  <i class="fa fa-fw fa-table"></i>
                  <span class="nav-link-text">User Management</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseComponents">
                  <li>
                    <a href="addremoveclient.jsp">Client Accounts</a>
                  </li>
                  <li>
                    <a href="addremovesp.jsp">Service Provider Accounts</a>
                  </li>
                </ul>
              </li>
            </ul>
            <ul class="navbar-nav sidenav-toggler">
              <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                  <i class="fa fa-fw fa-angle-left"></i>
                </a>
              </li>
            </ul>
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    Welcome, <b>${username}</b> <i class="fa fa-fw fa-sign-out"></i>Logout</a>
              </li>
            </ul>
          </div>
        </nav>
        <div class="content-wrapper">
          <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="index.jsp">Dashboard</a>
              </li>
              <li class="breadcrumb-item active">Product Management</li>
            </ol>
        
        <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-table"></i><b> PRODUCT TABLE</b></div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            
                <%@page import="java.sql.Connection"%>
                <%@page import="java.sql.DriverManager"%>
                <%@page import="java.sql.PreparedStatement"%>
                <%@page import="java.sql.ResultSet"%>
                <%@page import="java.sql.Statement"%>
                
                <thead>
                    <tr>
                        <td><b>Product Code</b></td>
                        <td><b>Service Provider</b></td>
                        <td><b>Product Name</b></td>
                        <td><b>Product Description</b></td>
                        <td><b>Product Category</b></td>
                        <td><b>Rental Price</b></td>
                        <td><b>Availability</b></td>
                        <td><b>Product Image</b></td>
                    </tr>
                </thead>

                <%  
                    String result = "SELECT * FROM product;";
                    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, "root", "");
                        Statement st = con.createStatement();
                        ResultSet rSet = st.executeQuery(result);
                        while (rSet.next()) {
                %>

                <tbody>
                    <tr>
                        <td><%=rSet.getString("product_code")%></td>
                        <td><%=rSet.getString("product_providerid")%></td>
                        <td><%=rSet.getString("name")%></td>
                        <td><%=rSet.getString("description")%></td>
                        <td><%=rSet.getString("category_id")%></td>
                        <td><%=rSet.getString("rental_price")%></td>
                        <td><%=rSet.getBoolean("availability")%></td>
                        <td><%=rSet.getBlob("product_image")%></td>
                    </tr>
                </tbody>

                <%
                        }
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                %>
                </table>
                
                <center>
                    <form action="RemoveProduct" method="post">
                        Enter the <b>Product Code</b> of the item you wish to remove:<br>
                        <input name="productCode" type="text"><br>
                        <input name="deleteProduct" type="submit" value="SUBMIT">
                    </form>
                </center>
                
                </div>
              </div>
            </div>
          </div>
                
            
                
          <!-- /.container-fluid-->
          <!-- /.content-wrapper-->
          <footer class="sticky-footer">
            <div class="container">
              <div class="text-center">
                <small>Copyright © WebLove Attire and Clothing Rental 2018</small>
              </div>
            </div>
          </footer>
          <!-- Scroll to Top Button-->
          <a class="scroll-to-top rounded" href="#page-top">
            <i class="fa fa-angle-up"></i>
          </a>
          <!-- Logout Modal-->
          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                  <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                  <form action="Logout">
                      <input type="submit" value="Logout" class="btn btn-primary">
                  </form>
                </div>
              </div>
            </div>
          </div>
          <!-- Bootstrap core JavaScript-->
          <script src="vendor/jquery/jquery.min.js"></script>
          <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
          <!-- Core plugin JavaScript-->
          <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
          <!-- Page level plugin JavaScript-->
          <script src="vendor/chart.js/Chart.min.js"></script>
          <script src="vendor/datatables/jquery.dataTables.js"></script>
          <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
          <!-- Custom scripts for all pages-->
          <script src="js/sb-admin.min.js"></script>
          <!-- Custom scripts for this page-->
          <script src="js/sb-admin-datatables.min.js"></script>
          <script src="js/sb-admin-charts.min.js"></script>
        </div>
        
    </body>
</html>
