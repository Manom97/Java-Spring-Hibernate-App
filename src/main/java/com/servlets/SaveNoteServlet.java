package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Todo;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try {
		
	String title =	request.getParameter("title");
	String content =	request.getParameter("content");
	Todo note = new Todo(title,content, new Date());
		
	System.out.println(note.getTitle() +note.getContent()+note.getAddDate());
	
	Session s = FactoryProvider.getFactory().openSession();
	Transaction tx = s.beginTransaction();
	s.save(note);
	tx.commit();
	s.close();
	response.setContentType("text/html");
	PrintWriter pw = response.getWriter();
	pw.println("<h3 style ='text-align:center;'>Note is added successfully</h3>");
	pw.println("<h3 style ='text-align:center;'><a href='all_notes.jsp'>all notes</a></h6>");

 	
	}catch(Exception e) {}
	
	
		
	}

}
