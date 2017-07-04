<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view</title>
<style>
table {
    width: 100%;
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>

</body>
<form method="post">

<table border="2" >
<tr>
<td>number</td>
<td>time from</td>
<td>time to</td>
<td>source</td>
<td>destination</td>
<td>type</td>



</tr>
<%

try
{


String query="select * from info";
Class.forName("com.mysql.jdbc.Driver");


Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transportation",
        "root", "siva");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
<TR>
   <td><%=rs.getInt("No") %></td>
    <td><%=rs.getString("timef") %></td>
   <td><%=rs.getInt("timet") %></td>
    <td><%=rs.getString("source") %></td>
   <td><%=rs.getInt("destination") %></td>
    <td><%=rs.getString("type") %></td>
   
       </TR>
        <%

}
%>
    </table>
    <%
    rs.close();
    stmt.close();
    con.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>

</form>
</html> 