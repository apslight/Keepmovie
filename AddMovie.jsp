<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html>

<% 
            String movie = (String)request.getParameter("mov");
            String watchdate =(String)request.getParameter("date");
            String user1 = (String)session.getAttribute("sessionuser");
            int count=0;
            out.println(movie);
            out.println(user1);
            out.println(watchdate);
             
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
	   	    Connection con = DriverManager.getConnection("jdbc:odbc:keepmovie");
	   	    Statement stmt = con.createStatement();
	   	    
			stmt.execute("SELECT MAX(ID) FROM activitylog");    
			ResultSet rs = stmt.getResultSet(); // 
			if (rs.next()) {
 		    count = rs.getInt(1);
			}
            count++;       
	   	    try {
                 String query = " insert into activitylog (ID,username,movie,dayofwatch)"+ " values( ?,?, ?, ?)";
                 PreparedStatement preparedStmt = con.prepareStatement(query);
                 preparedStmt.setInt(1, count);
	     	     preparedStmt.setString(2, user1);
			     preparedStmt.setString(3, movie);
			     preparedStmt.setString(4, watchdate);

			     preparedStmt.execute();
			      
             } catch (Exception e1) {
                      out.println(e1.getMessage());
                      out.println("nhi ho paya ye");
               }
            
 %>
 
<body>
</body>
</html>