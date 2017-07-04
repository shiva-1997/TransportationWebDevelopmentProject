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
	ps=con.prepareStatement("insert into complaint values (?,?)");
	String name=(String)session.getAttribute("user");
	String b=request.getParameter("complaint");
	ps.setString(1,name);
	ps.setString(2,b);
	ps.executeUpdate();
	out.println("complaint generated");
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