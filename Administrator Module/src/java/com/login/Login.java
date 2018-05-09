package com.login;

import com.login.dao.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    
    public Login(){
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        
        LoginDao dao = new LoginDao();
        
        if(dao.check(uname, pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", uname);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
            
    }
    
}
