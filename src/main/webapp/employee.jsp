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
	   String t3=request.getParameter("t3");
	   String t4=request.getParameter("t4");
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
		   //out.println("connected");
		   PreparedStatement psmt=conn.prepareStatement("insert into employee values(?,?,?,?)");
		   psmt.setString(1,t1);
		   psmt.setString(2,t2);
		   psmt.setString(3,t3);
		   psmt.setString(4,t4);
		   psmt.executeQuery();
		   JOptionPane.showMessageDialog(null,"Your data is succesfully saved...");
	   }
	   catch(Exception e)
	   {
		   JOptionPane.showMessageDialog(null,e.toString());
	   }
    }//end of save
   
   if(btnval.equalsIgnoreCase("allsearch"))  
   {
  	 try
  	  {
  		  Class.forName("oracle.jdbc.driver.OracleDriver");
  		  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
  		  //out.println("Connected");
  		  Statement smt=conn.createStatement();
  		  ResultSet rs=smt.executeQuery("select * from employee"); // rs is the buffer
  		  %>
  		  <center>
  		  <table border=2>
  		  <tr>
  		     <th>Employee Id</th>
  		     <th>Name</th>
  		     <th>Salary</th>
  		     <th>New salary</th>
  		  </tr>
  		  <% // open jsp
  		  while(rs.next()) // To read the column
  		  {
  		  %>  <!--close jsp-->
  		   <tr>
  		     <th><%=rs.getString(1)%></th> <!--1=1st column--->
  		     <th><%=rs.getString(2)%></th>  <!--2=2nd column-->
  		     <th><%=rs.getString(3)%></th> <!--3=3rd column--->
  		     <th><%=rs.getString(4)%></th>  <!--4=4th column-->
  		   </tr>
  		  <%
  		  }
  		  %>   <!-- close jsp (java server page)--->
  		   
  		  </table>
  		  <%
  	}
  	  catch(Exception e)
  	  { 
  		  out.println(e.toString());
  	  }
  		 
  }   // End of allsearch

%>
</body>
</html>