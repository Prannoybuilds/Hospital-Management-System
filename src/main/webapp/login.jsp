<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
String btnval=request.getParameter("b1");
if(btnval.equalsIgnoreCase("login"))  
{
	 try
	  {

		  int g=0;
		  String t1=request.getParameter("t1");
		  String t2=request.getParameter("t2");
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
		  //out.println("Connected");
		  Statement smt=conn.createStatement();
		  ResultSet rs=smt.executeQuery("select * from login"); // rs is the buffer
		  while(rs.next())
		  {
	  	    if(rs.getString(1).equals(t1))
		  	{
		  		if(rs.getString(2).equals(t2))
		  		{
		  			g=1;
		  			break;
		  		}
		  	}
		  }
		  	if(g==1)
		  	{
		  		out.println("<script>window.open('menu.html')</script>");
		  	}
		  	else
		  	{
		  		out.println("<h1>Sorry</h1>");
		  	}
		  }
		  catch(Exception e)
		  {
		  out.println(e.toString());
		  }
}
%>

</body>
</html>