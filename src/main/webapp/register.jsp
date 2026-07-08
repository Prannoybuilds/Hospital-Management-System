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
if(btnval.equalsIgnoreCase("save"))//to save the record
{
	   String t1=request.getParameter("t1");
	   String t2=request.getParameter("t2");
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
		   //out.println("connected");
		   Statement smt=conn.createStatement();
		   ResultSet rs=smt.executeQuery("select * from login"); // rs is the buffer
		   PreparedStatement psmt=conn.prepareStatement("insert into login values(?,?)");
		   psmt.setString(1,t1);
		   psmt.setString(2,t2);
		   psmt.executeQuery();
		   JOptionPane.showMessageDialog(null,"Your data is succesfully saved...");
	   }
	   catch(Exception e)
	   {
		   JOptionPane.showMessageDialog(null,e.toString());
	   }
    }//end of save
%>

</body>
</html>