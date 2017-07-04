<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/transportation";
try
{
	con=DriverManager.getConnection(URL,"root","siva");
	ps=con.prepareStatement("select * from signupuser where email=? and pwd=?");
	String janame=request.getParameter("email");
	String jpass=request.getParameter("pwd");
	ps.setString(1,janame);
	ps.setString(2,jpass);
	rs=ps.executeQuery();
	if(rs.next())
	{
		session.setAttribute("user",janame);
		RequestDispatcher rd=request.getRequestDispatcher("main.html");
		rd.forward(request,response);
	}
	else
	{
		out.println("something wrong");
	}
ps.close();
con.close();
}
catch(Exception e)
{
	out.println(e);
}

%>

</body>
</html>