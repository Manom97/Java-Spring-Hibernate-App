<%@page import="java.text.DateFormat"%>
<%@page import="com.entities.Todo"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="all_script_css.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All N otes</title>
</head>
<body>
<div class="container">
<%@include file="navbar.jsp" %>
<h2 class="heading center">All notes </h2>
<div class="row">
<div class="col-12">



<%
Session s = FactoryProvider.getFactory().openSession();
 Query q = s.createQuery("from Todo");
List<Todo> notes = q.list();
for(Todo note : notes)
{
	%>

<div class="card m-3">
  <div class="card-body">
  <h5 class ="card-title"><%= note.getTitle() %></h5> 
    <p class="card-text"><%= note.getContent() %></p>
   <p><small>Last updated : <%= DateFormat.getInstance().format( note.getAddDate())%>  </small></p>
    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger ">Delete</a>
 	<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary ">Update</a>
  </div>
</div>

<%
}


s.close();






%>



</div>



</div>







</div>

</body>
</html>