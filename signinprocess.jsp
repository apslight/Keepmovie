<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html>
<head>
</head>
<body>

<% 
       String userid =(String)request.getParameter("username");
	   String pass = (String)request.getParameter("password");
	   int flag = 0;
	   int i = 1;
	   	try{
	   		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
	   		Connection con = DriverManager.getConnection("jdbc:odbc:keepmovie");
	   		Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery("Select * From profile");
            while(rs.next()) {
                 String datauser = rs.getString("username");
                 if(datauser.equals(userid))
	               {
	                 String datapass = rs.getString("password");
	                 if(datapass.equals(pass)){ 
	                 
	                 session.setAttribute("sessionuser", userid);
                     session.setAttribute("sessionpass", pass);
	                    %>
	                     <jsp:forward page="/profilecheck.jsp" />
	                    <% } 
	               }        
		    }
		    if(flag==0)
		      {
		      
		      response.sendRedirect("signin.html");
		      
		      }
		    }
	    catch(Exception e){ out.println(e.getMessage());}
%>



</body>
</html>

