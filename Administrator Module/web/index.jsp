<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index.jsp</title>
    </head>
    <body>
        
        <!-- Check if user is logged in -->
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            if (session.getAttribute("username") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        
        <h1>INDEX.jsp Page</h1>
        
        <!--form action="Logout">
            <input type="submit" value="Logout">
        </form-->
        
    </body>
</html>
