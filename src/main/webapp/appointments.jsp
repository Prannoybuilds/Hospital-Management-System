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
	   String t5=request.getParameter("t5");
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
		   out.println("connected");
		   PreparedStatement psmt=conn.prepareStatement("insert into appointments values(?,?,?,?,?)");
		   psmt.setString(1,t1);
		   psmt.setString(2,t2);
		   psmt.setString(3,t3);
		   psmt.setString(4,t4);
		   psmt.setString(5,t5);
		   psmt.executeQuery();
		   JOptionPane.showMessageDialog(null,"Your data is succesfully saved...");
	   }
	   catch(Exception e)
	   {
		   JOptionPane.showMessageDialog(null,e.toString());
	   }
    }//end of save
   
   
   if(btnval.equalsIgnoreCase("delete"))//to delete the record
   {
	   String t1=request.getParameter("t1");
	   
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
		   out.println("connected");
		   PreparedStatement psmt=conn.prepareStatement("delete from pharmacy where =?");
		   psmt.setString(1,t1);
		   psmt.executeQuery();
		   JOptionPane.showMessageDialog(null,"Your data is succesfully deleted...");
	   }
	   catch(Exception e)
	   {
		   JOptionPane.showMessageDialog(null,e.toString());
	   }
    }//end of delete


   
   
   if(btnval.equalsIgnoreCase("update"))//to upadate the record
   {
	   String t1=request.getParameter("t1");
	   String t2=request.getParameter("t2");
	   String t3=request.getParameter("t3");
	   String t4=request.getParameter("t4");
	   String t5=request.getParameter("t5");
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
		   out.println("connected");
		   PreparedStatement psmt=conn.prepareStatement("update appointments set patient_id=?,doctor_id=?,appointment=?,status=? where appointment_id=?");
		   psmt.setString(1,t2);
		   psmt.setString(2,t3);
		   psmt.setString(3,t4);
		   psmt.setString(4,t5);
		   psmt.setString(5,t1);
		   psmt.executeQuery();
		   JOptionPane.showMessageDialog(null,"Your data is succesfully updated...");
	   }
	   catch(Exception e)
	   {
		   JOptionPane.showMessageDialog(null,e.toString());
	   }
    }//end of update
   
   
   
   if(btnval.equalsIgnoreCase("allsearch"))  
   {
  	 try
  	  {
  		  Class.forName("oracle.jdbc.driver.OracleDriver");
  		  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
  		  out.println("Connected");
  		  Statement smt=conn.createStatement();
  		  ResultSet rs=smt.executeQuery("select * from appointments"); // rs is the buffer
  		  %>
  		  <center>
  		  <table border=2>
  		  <tr>
  		     <th>Appointment Id</th>
  		     <th>Patient Id</th>
  		     <th>Doctor Id</th>
  		     <th>Appointment</th>
  		     <th>Status</th>
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
  		     <th><%=rs.getString(5)%></th>  <!--5=5th column-->
  		   </tr>
  		  <%
  		  }
  		  %>   <!-- close jsp (java server page)--->
  		   <input type=button value="print" onclick="window.print()">
  		  </table>
  		  <%
  	}
  	  catch(Exception e)
  	  { 
  		  out.println(e.toString());
  	  }
  		 
  }   // End of allsearch
   
   
   if(btnval.equalsIgnoreCase("psearch"))  
   {
  	 try
  	  {
  		  String t1=request.getParameter("t1");
  		  Class.forName("oracle.jdbc.driver.OracleDriver");
  		  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
  		  out.println("Connected");
  		  Statement smt=conn.createStatement();
  		  ResultSet rs=smt.executeQuery("select * from appointments where lower(appointment_id)='"+t1.toLowerCase()+"'"); // rs is the buffer
  		  %>
  		  <center>
  		  <table border=2>
  		  <tr>
  		     <th>Appointment Id</th>
  		     <th>Patient Id</th>
  		     <th>Doctor Id</th>
  		     <th>Appointment</th>
  		     <th>Status</th>
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
  		     <th><%=rs.getString(5)%></th>  <!--5=5th column-->
  		     
  		   </tr>
  		  <%
  		  }
  		  %>   <!-- close jsp (java server page)--->
  		   <input type=button value="print" onclick="window.print()">
  		  </table>
  		  <%
  	}
  	  catch(Exception e)
  	  { 
  		  out.println(e.toString());
  	  }
  		 
  }   // End of psearch

   
   if(btnval.equalsIgnoreCase("allsearch"))  
   {
  	 try
  	  {
  		  Class.forName("oracle.jdbc.driver.OracleDriver");
  		  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
  		  out.println("Connected");
  		  Statement smt=conn.createStatement();
  		  ResultSet rs=smt.executeQuery("select * from appointments"); // rs is the buffer
  		  %>
  		  <center>
  		  <table border=2>
  		  <tr>
  		     <th>Appointment Id</th>
  		     <th>Patient Id</th>
  		     <th>Doctor Id</th>
  		     <th>Appointment</th>
  		     <th>Status</th>
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
  		     <th><%=rs.getString(5)%></th>  <!--5=5th column-->
  		   </tr>
  		  <%
  		  }
  		  %>   <!-- close jsp (java server page)--->
  		   <input type=button value="print" onclick="window.print()">
  		  </table>
  		  <%
  	}
  	  catch(Exception e)
  	  { 
  		  out.println(e.toString());
  	  }
  		 
  }   // End of allsearch
   
   
   if(btnval.equalsIgnoreCase("find"))  
   {
  	 try
  	  {
  		  String t1=request.getParameter("t1");
  		  String col=request.getParameter("s");
  		  Class.forName("oracle.jdbc.driver.OracleDriver");
  		  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hospital","hospital");
  		  //out.println("Connected");
  		  Statement smt=conn.createStatement();
  		  ResultSet rs=smt.executeQuery("select * from appointments where lower("+col+")='"+t1.toLowerCase()+"'"); // rs is the buffer
  		  %>
  		  <center>
  		  <table border=2>
  		  <tr>
  		     <th>Appointment Id</th>
  		     <th>Patient Id</th>
  		     <th>Doctor Id</th>
  		     <th>Appointment</th>
  		     <th>Status</th>
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
  		     <th><%=rs.getString(5)%></th>  <!--5=5th column-->
  		     
  		   </tr>
  		  <%
  		  }
  		  %>   <!-- close jsp (java server page)--->
  		   <input type=button value="print" onclick="window.print()">
  		  </table>
  		  <%
  	}
  	  catch(Exception e)
  	  { 
  		  out.println(e.toString());
  	  }
  		 
  }   //
   
   
  

%>
