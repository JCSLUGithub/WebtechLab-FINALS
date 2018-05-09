package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
    
    String sql = "SELECT * FROM administrators WHERE AdminName=? AND AdminPass=?";
    String url = "jdbc:mysql://localhost:3306/loginregistration";
    
    public boolean check(String AdminName, String AdminPass) {
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, AdminName);
            st.setString(2, AdminPass);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            
        return false;
    }
    
}
