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

@WebServlet(name = "RemoveSP", urlPatterns = {"/RemoveSP"})
public class RemoveSP extends HttpServlet {

    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";
    String sql = "DELETE FROM serviceprovider WHERE serviceprov_id = ?;";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String SPID = request.getParameter("spID");
        
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, SPID);
            st.executeUpdate();
            out.println("<meta http-equiv='refresh' content='1;URL=addremovesp.jsp'>");
            out.println("<script>alert('Account Removal Successful')</script>");
        } catch(Exception e) {
            e.printStackTrace();
            out.println("<meta http-equiv='refresh' content='1;URL=addremovesp.jsp'>");
            out.println("<script>alert('Account Removal Failed')</script>");
        }
    }

}
