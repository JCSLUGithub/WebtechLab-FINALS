package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
    
    String sql = "SELECT * FROM administrator WHERE username=? AND password=?";
    String url = "jdbc:mysql://localhost:3306/weblove_attirerentals";
    
    public boolean check(String AdminUserName, String AdminPass) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, AdminUserName);
            st.setString(2, AdminPass);
            ResultSet rs = st.executeQuery();
            
            if(rs.next()) {
                return true;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }

}
