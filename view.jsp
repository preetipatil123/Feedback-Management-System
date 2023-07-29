<%@ page import ="java.sql.*" %>
<html>
<head>
<title>Feedback Management System </title>
<head>
	<title> VIEW </title>
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
<h1>view page</h1>
<table border="5" style="width:50%;">
<tr>
<th>Name</th>
<th>Email</th>
<th>Feedback</th>
<th>Rating</th>
</tr>

<%
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/ss_july26";
Connection con=DriverManager.getConnection(url,"root","abc123");
String sql="select * from feedback";
PreparedStatement pst=con.prepareStatement(sql);
ResultSet rs=pst.executeQuery();

while(rs.next())
{
%>
<tr style="text-align:center;">
<td> <%=rs.getString(1) %></td>
<td> <%=rs.getString(2) %></td>
<td> <%=rs.getString(3) %></td>
<td> <%=rs.getInt(4) %></td>
</tr>
<%
}
con.close();
}
catch(SQLException e)
{
out.println("sql issue"+e);
}
%>
</table>
</center>
</body>
</html>
