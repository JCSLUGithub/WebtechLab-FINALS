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

@WebServlet(name = "AddSP", urlPatterns = {"/AddSP"})
public class AddSP extends HttpServlet {

    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";
    String sql = "INSERT INTO serviceprovider(username, password, email, business_name,"
                + "phone_number, owner_firstname, owner_lastname, address_line, city, "
                + "province, postal_code, is_approved) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String Username = request.getParameter("username");
        String Password = request.getParameter("password");
        String Email = request.getParameter("email");
        String BusinessName = request.getParameter("businessName");
        String Phone = request.getParameter("phoneNumber");
        String OwnerFirstName = request.getParameter("ownerFirstname");
        String OwnerLastName = request.getParameter("ownerLastname");
        String AddressLine = request.getParameter("addressLine");
        String City = request.getParameter("city");
        String Province = request.getParameter("province");
        String PostalCode = request.getParameter("postalCode");
        boolean isApproved = true;
        
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, Username);
            st.setString(2, Password);
            st.setString(3, Email);
            st.setString(4, BusinessName);
            st.setString(5, Phone);
            st.setString(6, OwnerFirstName);
            st.setString(7, OwnerLastName);
            st.setString(8, AddressLine);
            st.setString(9, City);
            st.setString(10, Province);
            st.setString(11, PostalCode);
            st.setBoolean(12, isApproved);
            st.executeUpdate();
            
            out.println("<meta http-equiv='refresh' content='1;URL=addremovesp.jsp'>");
            out.println("<script>alert('Account Registration Successful')</script>");
        } catch(Exception e) {
            out.println("<meta http-equiv='refresh' content='1;URL=addremovesp.jsp'>");
            out.println("<script>alert('Account Registration Failed')</script>");
            e.printStackTrace();
        }
        
    }

}
