<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
h4{
font:sans-serif;color:hotpink
}
html{
  background-color: #ffffff;
}
body,
input,
textarea,
select {
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  color: #4c4c4c;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, 
pre, form, fieldset, input, textarea, p, blockquote, th, td { 
  padding:0;
  margin:0;}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function showdepart(str)
{
	var xmlhttp;
	if(str=="")
		{
		document.getElementById("txtHint").innerHTML="";
		return;
		}
		xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=function()
		{
			if(xmlhttp.readyState==4&&xmlhttp.status==200)
				{
				document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
				}
		}
		xmlhttp.open("GET","ajax4.jsp?q="+str,true);
		xmlhttp.send();
	
	}
</script>
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
ps=con.prepareStatement("select no from info");
rs=ps.executeQuery();


%>


<form action="">
<h4>type:</h4>
	<select name="number" onchange="showdepart(this.value)">
	<option value="">select number</option>
	<%
	while(rs.next())
	{
	%>
	<option value=<%=rs.getString(1) %>>
	<%=rs.getString(1) %> 
	</option>
	<%
	}
	%>
	</select>
</form>
<%
}
catch(Exception e)
{
	out.println(e);
}
ps.close();
rs.close();
con.close();
%>
<br>
<div id="txtHint"><h4>bus details of selected type are displayed here</h4></div>	
</body>
</html>
