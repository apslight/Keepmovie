<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html>

<% 
            String movie = (String)request.getParameter("mov");
            String user1 = (String)session.getAttribute("sessionuser");
            out.println(movie);
            out.println(user1);
            int userid = 0;
            try
	   	     {
            //for connection
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
	   	    Connection con = DriverManager.getConnection("jdbc:odbc:keepmovie");
	   	    Statement stmt = con.createStatement();
	   	    ResultSet rs = stmt.executeQuery("Select * From activitylog");
            while(rs.next()) {
                 String datauser = rs.getString("username");
                 
                 if(datauser.equals(user1))
	               {
	                 String datamovie = rs.getString("movie");
	                 if(datamovie.equals(movie))
	                     {
	                      userid = rs.getInt("ID");
                         }
                    }    
                 }
	   	   
	   	      stmt.executeUpdate("delete from activitylog where ID=" + userid );    
              }    
             catch(Exception e){
                      out.println(e.getMessage());
             }  
 %>
 
<body>
</body>
</html>