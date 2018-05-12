package com.reservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ClientReservation", urlPatterns = {"/ClientReservation"})
public class ClientReservation extends HttpServlet {
    
    String sql = "SELECT * FROM transaction WHERE reservation_number=?;";
    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String ReservationNumber = request.getParameter("reservation_number");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ReservationNumber);
            st.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        }
        
    }

}
