<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_script_css.jsp" %>
</head>
<body>
<div class="container">
<%@include file="navbar.jsp" %>
<h3>Please add note details for note</h3>
<!-- This is add form --> 

<form action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="title">Note title</label>
    <input type="text"
    name="title"
    class="form-control"
     class="form-control"
      id="title"
      placeholder="enter here"
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
     required>
  </div>
  <div class="form-group ">
      <button type="submit" class="btn btn-primary">Save Note</button>
</form>


</div>


</body>
</html>