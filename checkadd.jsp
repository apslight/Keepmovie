<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="javax.servlet.http.*" %>
<html>

<% 
            String inputmovie = (String)request.getParameter("mov");
            out.println(inputmovie);
            
            int count = 1;
            JSONObject obj = new JSONObject();

            try{

		    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:keepmovie");

			PreparedStatement stmt = con.prepareStatement("select * from allmovie where movie like ?");
				stmt.setString(1,"%"+ inputmovie +"%");
				ResultSet rs = stmt.executeQuery();
				while(rs.next())
				   {
				     obj.put(String.valueOf(count),rs.getString("movie"));
					 count++;
				   }
				out.print(obj);
               
			   }
		   catch(Exception e) { 
		          out.println(e.getMessage()); 
	            	}	
 %>
 
<body>
</body>
</html>