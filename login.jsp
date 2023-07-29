
<%@ page import="java.sql.*" %>

<html>

<title>Feedback Management System </title>
<head>
	<title> ADMIN LOGIN </title>
	<link rel="stylesheet" href="mystyle.css">
	<link rel="shortcut icon" href ="k.png">

</head><body>
<center>
<div class="container">
<div class="nav">
<a href="index.jsp">Home</a>
<a href="login.jsp">Admin Login</a>
</div>
<h1>Admin Login Page</h1>


<form>
<input type="text" name="un" placeholder="enter your name" required>
<br><br>
<input type="password" name="pw" placeholder="enter password" required>
<br><br>
<input type="submit" value="Login" name="btn">
<br><br>
</form>

<%
if(request.getParameter("btn") !=null)
{
String un=request.getParameter("un");
String pw=request.getParameter("pw");
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/ss_july26";
Connection con=DriverManager.getConnection(url,"root","abc123");
String sql="select * from login where un=? and pw=?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setString(1,un);
pst.setString(2,pw);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
session.setAttribute("un",un);
response.sendRedirect("view.jsp");
}
else
{
out.println("invalid login");
}

con.close();
}
catch(SQLException e)
{
out.println("sql issue"+e);
}
}
%>
</div>
</center>
</body>
</html>