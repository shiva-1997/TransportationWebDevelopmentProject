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
	ps=con.prepareStatement("insert into info values (?,?,?,?,?,?)");
	String a=request.getParameter("no");
	String b=request.getParameter("tof");
	String c=request.getParameter("tot");
	String d=request.getParameter("src");
	String e=request.getParameter("dest");
	String f=request.getParameter("type");
	ps.setString(1,a);
	ps.setString(2,b);
	ps.setString(3,c);
	ps.setString(4,d);
	ps.setString(5,e);
	ps.setString(6,f);
	ps.executeUpdate();
	String name=(String)session.getAttribute("admin");
	out.println("info details updated for admin"+" "+name);
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