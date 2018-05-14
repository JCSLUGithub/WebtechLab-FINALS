<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Administrator - User Management</title>
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
              <li class="breadcrumb-item">User Management</li>
              <li class="breadcrumb-item active">Service Provider Accounts</li>
            </ol>
        
        <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-table"></i><b> SERVICE PROVIDER ACCOUNT TABLE</b></div>
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
                            <td><b>Service Provider ID</b></td>
                            <td><b>Username</b></td>
                            <td><b>e-Mail</b></td>
                            <td><b>Business Name</b></td>
                            <td><b>Phone Number</b></td>
                            <td><b>First Name</b></td>
                            <td><b>Last Name</b></td>
                            <td><b>City</b></td>
                            <td><b>Province</b></td>
                            <td><b>Postal Code</b></td>
                            <td><b>Registration Date</b></td>
                            <td><b>Approval Status</b></td>
                        </tr>
                    </thead>

                    <%  
                        String result = "SELECT * FROM serviceprovider;";
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
                            <td><%=rSet.getInt("serviceprov_id")%></td>
                            <td><%=rSet.getString("username")%></td>
                            <td><%=rSet.getString("email")%></td>
                            <td><%=rSet.getString("business_name")%></td>
                            <td><%=rSet.getString("phone_number")%></td>
                            <td><%=rSet.getString("owner_firstname")%></td>
                            <td><%=rSet.getString("owner_lastname")%></td>
                            <td><%=rSet.getString("address_line")%></td>
                            <td><%=rSet.getString("city")%></td>
                            <td><%=rSet.getString("province")%></td>
                            <td><%=rSet.getString("postal_code")%></td>
                            <td><%=rSet.getString("registration_date")%></td>
                        </tr>
                    </tbody>

                    <%
                            }
                        } catch(Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </table>

                <form action="RemoveSP" method="post">
                    <center>
                        Enter the <b>Service Provider ID</b> of the user you wish to remove:
                        <br><input name="spID" type="text"></br>
                        <br><input name="removeSP" type="submit" value="SUBMIT"></br>
                    </center>
                </form>
                    
              </div>
            </div>
          </div>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            if (session.getAttribute("username") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-table"></i><b> ADD SERVICE PROVIDER ACCOUNT</b></div>
            <div class="card-body">
                <form action="AddSP" method="post">
                    <center>
                        Username: <br><input name="username" type="text" value=""><br>
                        Password: <br><input name="password" type="password" value=""><br>
                        E-Mail: <br><input name="email" type="text" value=""><br>
                        Business Name: <br><input name="businessName" type="text" value=""><br>
                        Business Phone: <br><input name="phoneNumber" type="text" value=""><br>
                        Owner First Name: <br><input name="ownerFirstname" type="text" value=""><br>
                        Owner Last Name: <br><input name="ownerLastname" type="text" value=""><br>
                        Address Line: <br><input name="addressLine" type="text" value=""><br>
                        City: <br><input name="city" type="text" value=""><br>
                        Province: <br><input name="province" type="text" value=""><br>
                        Postal Code: <br><input name="postalCode" type="text" value=""><br>
                        <br><input type="submit" value="SUBMIT">
                    </center>
                </form>
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
