<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.lang.*"%>
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
	ps=con.prepareStatement("select cost from cost where type=?");
	String a=request.getParameter("type");
	ps.setString(1,a);
	ps.executeUpdate();
	String b=request.getParameter("dist");
	out.println(a);
	ps.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>s

</body>
</html>