<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
th {
    background-color: yellow;
    color: black;
}
td {
    background-color:black;
    color: yellow;
}
</style>
</head>
<body>
<%
Connection con=null;
Statement ps=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/transportation";
try
{ 
	con=DriverManager.getConnection(URL,"root","siva");
	ps=con.createStatement();
	
	
	rs=ps.executeQuery("select *from info");
	%><table border="5"><tr><th>NUMBER</th><th>TIME FROM</th><th>TIME TO</th><th>SOURCE</th><th>DESTINATION</th><th>TYPE</th>
	</tr><%	
	while(rs.next())
	{%><tr>
	<td><% out.println(rs.getString(1));%></td>	
	<td><%out.println(rs.getString(2));%></td>
	<td><%out.println(rs.getString(3));%></td>
	<td><%out.println(rs.getString(4));%></td>
	<td><%out.println(rs.getString(5));%></td>
	<td><%out.println(rs.getString(6));%></td>
	</tr><%
	}
   %> </table><%
}
catch(Exception e)
{
	out.println(e);
}	
%>
</body>
</html>