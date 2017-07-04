<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/transportation";
try
{
	con=DriverManager.getConnection(URL,"root","siva");
	ps=con.prepareStatement("insert into signupuser values (?,?,?,?)");
	String a=request.getParameter("email");
	String b=request.getParameter("name");
	String c=request.getParameter("pwd");
	String d=request.getParameter("gender");
	ps.setString(1,a);
	ps.setString(2,b);
	ps.setString(3,c);
	ps.setString(4,d);
	ps.executeUpdate();
	out.println("user details updated");
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