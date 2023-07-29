<%@ page import="java.sql.*"%>
<html>
<head>
<title>FeedBack System</title>
<head>
	<title> ADMIN LOGIN </title>
	<link rel="stylesheet" href="mystyle.css">
<div class="topnav">
  <a class="active"
</div>
</style>
</head>
<body>
<center>
<div class="nav">
<a href="view.jsp">View</a>
<a href="delete.jsp">Delete</a>
<a href="logout.jsp">Logout</a>
</div>
<script>
  function confirmLogout() {
    return confirm("Are you sure you want to logout?");
  }
</script>
<%
String un=(String)session.getAttribute("un");
if(un==null)
{
response.sendRedirect("index.jsp");
}
%>
<br>
<form>
<input type="submit" value="Logout" name="btn" onclick="return confirmLogout()" class="button"/>
</form>
<%
if(request.getParameter("btn")!=null)
{
session.invalidate();
response.sendRedirect("index.jsp");
}
%>
</center>
</body>
</html>


