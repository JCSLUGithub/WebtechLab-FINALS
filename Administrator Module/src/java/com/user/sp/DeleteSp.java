/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.sp;

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

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteSp", urlPatterns = {"/DeleteSp"})
public class DeleteSp extends HttpServlet {
String sqlDelete = "DELETE FROM serviceprovider WHERE serviceprov_id = ?;";
    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String Serviceprov_ID = request.getParameter("spID");
        
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sqlDelete);
            st.setString(1, Serviceprov_ID);
            st.executeUpdate();
            out.println("<meta http-equiv='refresh' content='1;URL=delete_sp.jsp'>");
            out.println("<script>alert('Delete Successful')</script>");
        } catch(Exception e) {
            e.printStackTrace();
            out.println("<meta http-equiv='refresh' content='1;URL=delete_sp.jsp'>");
            out.println("<script>alert('User does not exist')</script>");
        }
        
    }

}
