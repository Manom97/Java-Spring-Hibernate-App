package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Todo;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			
			String title = request.getParameter("title");
			
			String content = request.getParameter("content");
			 
			int id = Integer.parseInt(request.getParameter("id").trim());
			
			Session s = FactoryProvider.getFactory().openSession();

			Transaction tx = s.beginTransaction();
			
			Todo note = s.get(Todo.class, id);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddDate(new Date());
			
			tx.commit();
			
			s.close();

			response.sendRedirect("all_notes.jsp");
			
			
		}catch(Exception e) {}
		
		
		
	}

}
