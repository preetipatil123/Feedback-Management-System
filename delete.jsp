<%@ page import ="java.sql.*" %>
<html>
<head>
<title>Feedback system </title>
<head>
	<title> DELETE </title>
	<link rel="stylesheet" href="mystyle.css">
<div class="topnav">
  <a class="active"
</div>
</head>
<body>
<center>
<div class="nav">
<a href="view.jsp">View</a>
<a href="delete.jsp">Delete</a>
<a href="logout.jsp">Logout</a>
</div>
<script>
function confirmDelete() {
    return confirm("Are you sure you want to delete this data?");
  }
</script>
<h1>Delete page</h1>
<form>
<input type="email" name="email" placeholder="enter email" required/>
<br><br>
<input type="submit" value="delete" name="btn" onclick="return confirmDelete()"/>
<br><br>
</form>

<%
if(request.getParameter("btn")!=null)
{
String email=request.getParameter("email");

try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/ss_july26";
Connection con=DriverManager.getConnection(url,"root","abc123");
String sql="delete from feedback where email=(?)";
PreparedStatement pst=con.prepareStatement(sql);
pst.setString(1,email);
pst.executeUpdate();
con.close();
}
catch(SQLException e)
{
out.println("issue"+e);
}
}
%>

</center>
</body>
</html>

