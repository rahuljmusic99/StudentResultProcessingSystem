//package org.CanaraExamManager.controler;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//import org.CanaraExamManager.bean.LoginBean;
//import org.CanaraExamManager.dao.LoginDao;
//
//
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//  
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		String userNameString = request.getParameter("username");
//		String passwordString = request.getParameter("password");
//		
//		//creating an object for LoginBean class which setter and getter methods
//		LoginBean loginBean = new LoginBean();
//		
//		//setting user name and password through the loginBean object which can be used in the future.
//		loginBean.setUserName(userNameString);
//		loginBean.setPassword(passwordString);
//		
//		//creating object for LoginDao which contains the main logic of the application.
//		LoginDao loginDao = new LoginDao();
//		
//		//calling authenticate user method.
//		String userValidateString = loginDao.authenticateUser(loginBean); 
//		
//		//If the method returns success string then the user will be rooted to his/her page.
////		if(userValidateString.equals("SUCCESS")) {
////			
////			request.setAttribute("userName",userNameString);
////			request.getRequestDispatcher("/studdashboard.html").forward(request, response);
////			
////		}else {
////			
////			request.setAttribute("errorMessage",userValidateString);
////			request.getRequestDispatcher("/studentlogin.jsp").forward(request, response);
////		}
//		
//		
//		
//	}
//
//}