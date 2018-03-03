<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
function myFunction() {
     var movie = document.getElementById("myInput").value;
     if (movie.length == 0) { 
        document.getElementById("txtHint").innerHTML = "kuch nhi h";
        return;
                           } 
      else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) 
            {
                  var jsonObj = JSON.parse(xmlhttp.responseText);

                  // jsonObj variable now contains the data structure and can
                  // be accessed as jsonObj.name and jsonObj.country.
                  document.getElementById("1").innerHTML = jsonObj.1;
                  document.getElementById("2").innerHTML = jsonObj.2;
               
            }
                                                 };
        xmlhttp.open("GET", "/aditya/searchbar.jsp?mov=" + movie, true);
        xmlhttp.send();
           }
}

function addmovie()
    {
      
      var movie = document.getElementById("myInput").value;
      var date = document.getElementById("date").value;
      alert(movie);
      alert(date);
      if (movie.length == 0) { 
        document.getElementById("txtHint").innerHTML = "hello";
        return;
                           } 
      else {
        var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
                                                             }
                                                 };
        xmlhttp.open("GET", "/aditya/AddMovie.jsp?mov=" + movie + "&date=" + date, true);
        xmlhttp.send();
           }
      
    }
function delmovie()
    {
      
      var movie = document.getElementById("myInput").value;
      alert(movie);
      if (movie.length == 0) { 
        document.getElementById("txtHint").innerHTML = "Kuch toh likho";
        return;
                           } 
      else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
                                                             }
                                                 };
        xmlhttp.open("GET", "/aditya/DelMovie.jsp?mov=" + movie, true);
        xmlhttp.send();
           }
    }  
</script>

<% 
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
	   	    Connection con = DriverManager.getConnection("jdbc:odbc:keepmovie");
            Statement stmt = con.createStatement(); 
%>
<body>

      <h1 align="center"> WELCOME <%=(String)request.getParameter("username")%> TO KEEPMOVIE </h1>
      
      <div class="w3-container">
             <input autocomplete="on" class="w3-input w3-border w3-padding" type="text" placeholder="Search for movie.." id="myInput" onkeyup="myFunction()">
             <input type="date" name="bday" min="2000-01-02" id="date">
             <button type="submit" value="addmovie" id="addmov" onclick="addmovie()">ADD MOVIE</button>
             <button type="submit" value="deletemovie" id="addmov" onclick="delmovie()">DEL MOVIE</button>
                     <ul class="w3-ul w3-margin-top" id="myUL">
                        <% 
                           ResultSet rs = stmt.executeQuery("Select * From allmovie");
                           while(rs.next())
                             { %>
	                            <li><%=(String)rs.getString("movie")%></li>
	                   <%    }
                            %>
	                </ul>
     </div>
     
<p>Suggestions: <span id="txtHint"></span></p> 
<p>Sugge111: <span id="1"></span></p> 
<p>Sugge222: <span id="2"></span></p> 

  
</body>
</html>


