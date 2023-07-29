<%@ page import="java.sql.*" %>

<html>
<head>
<title>Feedabck system</title>
<head>
	<title> ADMIN LOGIN </title>
	<link rel="stylesheet" href="mystyle.css">
	<div class="topnav">
  <a class="active"
</div>
<script>
function validation()
{
let name = document.getElementById("name");
let email = document.getElementById("email");
let fb = document.getElementById("fb");
if(name.value=="")
{
alert("name cannot be empty");
name.focus();
return false;
}
if(name.value.trim().length==0)
{
alert("name cannot be only spaces");
name.focus();
name.value="";
return false;
}
if(!name.value.match(/^[A-z]+$/ ))
{
alert("name should contain only alphabets");
name.focus();
name.value="";
return false;
}

if(email.value=="")
{
alert("email cannot be empty");
email.focus();
return false;
}
if(email.value.trim().length==0)
{
alert("name cannot be only spaces");
email.focus();
email.value="";
return false;
}


if(fb.value=="")
{
alert("feedback cannot be empty");
fb.focus();
return false;
}
if(fb.value.trim().length==0)
{
alert("feedback cannot be only spaces");
fb.focus();
fb.value="";
return false;
}
if(!fb.value.match(/^[A-z]+$/))
{
alert("feedback should contain only alphabets");
fb.focus();
fb.value="";
return false;
}
if((fb.value.trim().length<3) || (fb.value.trim().length>50))
{
alert("feedback should contain atleast 3 characters and atmost 50 characters");
fb.focus();
fb.value="";
return false;
}
}
</script>
</head>

<body>
<center>
<div class="nav">
<a href="index.jsp">Home</a>
<a href="login.jsp">Admin Login</a>
</div>
<h1>FEEDBACK &nbsp; PAGE</h1>
<form onsubmit="return validation()" method="post">
<input type="text" name="name" placeholder="Enter your name" id="name" />
<br><br>
<input type="email" name="email" placeholder="Enter your email" id="email"/>
<br><br>
<textarea name="feedback" placeholder="Enter your feedback here" rows=4 cols=30 minlength=3 maxlength=20 id="fb" ></textarea>
<br><br>
<label for="rating">Rate Us:</label>
<br><br>
<input type="radio" name="f" value="1" />1

<input type="radio" name="f" value="2"/>2

<input type="radio" name="f" value="3" checked=true/>3

<input type="radio" name="f" value="4"/>4

<input type="radio" name="f" value="5"/>5

<br><br>
<input type="submit" name="btn"/>
</form>

<%
if(request.getParameter("btn")!=null)
{
String name=request.getParameter("name");
String email=request.getParameter("email");
String feedback=request.getParameter("feedback");
int rating=Integer.parseInt(request.getParameter("f"));

boolean isValidName = name.matches("^[A-Za-z ]+$");
boolean isValidEmail = email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
boolean isValidFeedback = feedback.matches("^[A-Za-z ]+$");

if (isValidName && isValidEmail && isValidFeedback ) 
{
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/ss_july26";
Connection con=DriverManager.getConnection(url,"root","abc123");
String sql="insert into feedback values(?,?,?,?)";
PreparedStatement pst=con.prepareStatement(sql);
pst.setString(1,name);
pst.setString(2,email);
pst.setString(3,feedback);
pst.setInt(4,rating);
pst.executeUpdate();
out.println("Thank you for your feedback!!!!");
con.close();
}
catch(SQLException e)
{
out.println("issue"+e);
}
}
}

%>
</center>
</body>
</html>