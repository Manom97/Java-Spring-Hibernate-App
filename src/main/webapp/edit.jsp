<%@page import="com.entities.Todo"%>
<%@page import="org.omg.CosNaming.NamingContextPackage.NotEmpty"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="all_script_css.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Notes</title>
</head>
<body>
<div class="container">
        <%@include file="navbar.jsp"%>
    
    
    <h2>Edit Note</h2>
    <%
    
    int id = Integer.parseInt( request.getParameter("note_id").trim());

    Session s = FactoryProvider.getFactory().openSession();
    
    Todo note = (Todo)s.get(Todo.class, id);
    
    
    %>
    <form action="UpdateServlet" method="post">
    
    <!-- Ho -->
    <input value="<%= note.getId() %>" name="id" type="hidden"/>
  <div class="form-group">
    <label for="title">Note title</label>
    <input type="text"
    name="title"
    class="form-control"
     class="form-control"
      id="title"
      placeholder="enter here"
      value="<%= note.getTitle() %>"
      required
      >
      
  </div>
  <div class="form-group">
    <label for="content">Note content</label>
    <input type="text-area"
     name="content"
     class="form-control"
     style="height:300px;"
     id="content" 
    value="<%= note.getContent() %>" 
     required>
  </div>
  <div class="form-group ">
      <button type="submit" class="btn btn-success">Update Note</button>
</form>
    
    
    
    
    
    
    
    
    </div>

</body>
</html>