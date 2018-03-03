<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html>

<% 
            String inputmovie = (String)request.getParameter("mov");
            out.println(inputmovie);
            
            int count = 0;
            try{

		    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:keepmovie");

			PreparedStatement stmt = con.prepareStatement("select * from allmovie where movie like ?");
				stmt.setString(1,"%"+ inputmovie +"%");
				ResultSet rs = stmt.executeQuery();
				while(rs.next())
				   {
					out.println(rs.getString("movie"));
				   }
			   }
		   catch(Exception e) { 
		          System.out.println(e.getMessage()); 
	            	}	
 %>
 
<body>
</body>
</html>