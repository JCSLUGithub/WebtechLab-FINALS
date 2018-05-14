package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddClient", urlPatterns = {"/AddClient"})
public class AddClient extends HttpServlet {

    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";
    String sql = "INSERT INTO client(username, password, email, firstname, lastname, "
                + "phone_number, address_line, city, province, postal_code)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String Username = request.getParameter("username");
        String Password = request.getParameter("password");
        String Email = request.getParameter("email");
        String FirstName = request.getParameter("firstName");
        String LastName = request.getParameter("lastName");
        String Phone = request.getParameter("phoneNumber");
        String AddressLine = request.getParameter("addressLine");
        String City = request.getParameter("city");
        String Province = request.getParameter("province");
        String PostalCode = request.getParameter("postalCode");
        
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, Username);
            st.setString(2, Password);
            st.setString(3, Email);
            st.setString(4, FirstName);
            st.setString(5, LastName);
            st.setString(6, Phone);
            st.setString(7, AddressLine);
            st.setString(8, City);
            st.setString(9, Province);
            st.setString(10, PostalCode);
            st.executeUpdate();
            
            out.println("<meta http-equiv='refresh' content='1;URL=addremoveclient.jsp'>");
            out.println("<script>alert('Account Registration Successful')</script>");
        } catch(Exception e) {
            e.printStackTrace();
            out.println("<meta http-equiv='refresh' content='1;URL=addremoveclient.jsp'>");
            out.println("<script>alert('Account Registration Failed')</script>");
        }
        
    }

}
