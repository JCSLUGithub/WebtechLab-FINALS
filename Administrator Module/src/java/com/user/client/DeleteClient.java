package com.user.client;

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

@WebServlet(name = "DeleteUser", urlPatterns = {"/DeleteUser"})
public class DeleteClient extends HttpServlet {
    
    String sqlDelete = "DELETE FROM client WHERE client_id = ?;";
    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String Client_ID = request.getParameter("clientID");
        
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sqlDelete);
            st.setString(1, Client_ID);
            st.executeUpdate();
            out.println("<meta http-equiv='refresh' content='1;URL=delete_client.jsp'>");
            out.println("<script>alert('Delete Successful')</script>");
        } catch(Exception e) {
            e.printStackTrace();
            out.println("<meta http-equiv='refresh' content='1;URL=delete_client.jsp'>");
            out.println("<script>alert('User does not exist')</script>");
        }
        
    }

}
