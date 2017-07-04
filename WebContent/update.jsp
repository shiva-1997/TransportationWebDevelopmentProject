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
	ps=con.prepareStatement("update info set timef=?,timet=?,soruce=?,destination=?,type=? where no=?");
	String a=request.getParameter("no");
	String b=request.getParameter("tof");
	String c=request.getParameter("tot");
	String d=request.getParameter("src");
	String e=request.getParameter("dest");
	String f=request.getParameter("type");
	ps.setString(6,a);
	ps.setString(1,b);
	ps.setString(2,c);
	ps.setString(3,d);
	ps.setString(4,e);
	ps.setString(5,f);
	ps.executeUpdate();
	out.println("info details updated");
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