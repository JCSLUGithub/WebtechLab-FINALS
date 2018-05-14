package com.product;

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

@WebServlet(name = "RemoveProduct", urlPatterns = {"/RemoveProduct"})
public class RemoveProduct extends HttpServlet {

    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";
    String sql = "DELETE FROM product WHERE product_code = ?;";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String ProductCode = request.getParameter("productCode");
        
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ProductCode);
            st.executeUpdate();
            out.println("<meta http-equiv='refresh' content='1;URL=producttable.jsp'>");
            out.println("<script>alert('Product Delete Successful')</script>");
        } catch(Exception e) {
            e.printStackTrace();
            out.println("<meta http-equiv='refresh' content='1;URL=producttable.jsp'>");
            out.println("<script>alert('Product Delete Failed')</script>");
        }
    }

}
