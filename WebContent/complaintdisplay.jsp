<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
th {
    background-color: green;
    color: black;
}
td {
    background-color:blue;
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
	
	
	rs=ps.executeQuery("select *from complaint");
	%><table border="5"><tr><th>EMAIL ID</th><th>COMPLAINT</th>
	</tr><%	
	while(rs.next())
	{%><tr>
	<td><% out.println(rs.getString(1));%></td>	
	<td><%out.println(rs.getString(2));%></td>
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