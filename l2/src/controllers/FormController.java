package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

import models.BeanUser;
import utils.DAO;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/FormController")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BeanUser user = new BeanUser();
		
		try {
		
		   // Fill the bean with the request parmeters
		   BeanUtils.populate(user, request.getParameterMap());
		   
		   if (user.isComplete()) {
			   System.out.println("TODO: INSERT into DB");
			   try{
					DAO dao = new DAO();
					
					dao.insertSQL(user);
					
					if(dao.getStatus() > 0)
						System.out.println("You have been registred!");
					
					dao.disconnectBD();
						
				}
				catch (Exception e) {
		            System.out.println("error");
			    }
		   } 
		   else {
			   System.out.println("Waiting to submit...");
			   // Put the bean into the request as an attribute
			   request.setAttribute("user",user);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("/RegisterForm.jsp");
			   dispatcher.forward(request, response);
		   }
	    } 
		catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
	    }
		

		//System.out.println(user.getGender() + user.getDatebirth() + user.getName());
		    
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
