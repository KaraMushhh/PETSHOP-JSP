package it.betacom.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.betacom.bean.Login;
import it.betacom.dao.LoginDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 5284667188786893699L;
	private LoginDao loginDao;
	private int counter;
	
	public void init() {
	    loginDao = new LoginDao();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			
		    String username = request.getParameter("username");
		    String password = request.getParameter("password");
		    Login login = new Login();
		    login.setUsername(username);
		    login.setPassword(password);
		    String role=loginDao.validate(login);
		    counter=loginDao.getCounter(login);
		    
		    if (role!=null) {
			    if (counter<3 && loginDao.returnStatus(login).equals("A")) {
			    	
			        	if (loginDao.returnStatusPWD(login).equals("Y")) {
			        		loginDao.resetCounter(login);
				            HttpSession session = request.getSession();
				            session.setAttribute("username",username);
				            session.setAttribute("role", role);
				            response.sendRedirect("resetpassword.jsp");
			        	} else {
				        	loginDao.resetCounter(login);
				            HttpSession session = request.getSession();
				            session.setAttribute("username",username);
				            session.setAttribute("role", role);
				            response.sendRedirect("index.jsp");
			        	}
			    } else {
			    	
			    	if (loginDao.returnStatus(login).equals("A")) {
			    		loginDao.updateStatus(login, "D");
			    		response.sendRedirect("accountsospeso.jsp");
			    	} else {
			    		response.sendRedirect("accountsospeso.jsp");
			    	}
			    }
		    } else {
	        	
	        	loginDao.counterUp(login);  //++counter;
	            response.sendRedirect("loginfailed.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}