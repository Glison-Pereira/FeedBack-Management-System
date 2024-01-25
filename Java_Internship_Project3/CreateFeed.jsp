<%@ page import="java.sql.*" %>
<html>
<head>
      <title>FeedBack Management System</title>
      <link rel="icon" href="https://ideascale.com/wp-content/uploads/2023/09/Customer-Feedback-Management-cover.jpg">
      <link rel="stylesheet" href="style.css">
      <script >
		function createfeed()
		{
   			let moviename=document.getElementById("5");
   			let description=document.getElementById("6");
   			if(moviename.value.trim()=="" || description.value.trim()=="")
   			{
        			alert("Don't leave empty space");
        			moviename.focus();
        			description.focus();
        			return false;
   			}
   			else if(moviename.value.match(/^[A-Za-z0-9]+$/)==null)
   			{
        			alert("You have enter moviename wrong");
        			moviename.value="";
        			description.value="";
        			moviename.focus();
        			description.focus();
        			return false;
   			}
   			else if(moviename.value.length>50 || description.value.length>1000)
   			{
        			alert("Either your moviename or your description exceeds the maximum limit");
        			moviename.focus();
        			description.focus();
        			return false;
   			}
   			else
   			{
        			return true;
   			}
	     }
    </script>
</head>
<body>
      <div class="feedback">
          <a href="FeedBack.jsp">AddFeedBack</a>
          <a href="View.jsp">view</a>
      </div>
      <form onsubmit="return createfeed()" autocomplete="off">
               <h1>Movie FeedBack</h1>
               <hr>
               <h2>Enter your movie Name:</h2><input type="text" name="moviename" id="5" placeholder="Enter your movie name here" /><br>
               <h2>Enter Description of Movie:</h2><textarea class="field" name="description" id="6" rows="4" cols="20" placeholder="Enter Description of movie here" ></textarea><br><br>
               <input type="submit" name="button" value="check" class="btn"  />
     </form>
     <%
          if(request.getParameter("button")!=null)
           {
                String movie=request.getParameter("moviename");
                String describe=request.getParameter("description");
                try{
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url="jdbc:mysql://localhost:3306/javaintern3120124";
			Connection con=DriverManager.getConnection(url,"root","abc123");
			String sql="insert into feedback values(?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,movie);
			pst.setString(2,describe);
			pst.executeUpdate();
			out.println("record created");
			con.close();
		}
		catch(SQLException e)
		{
			out.println("issue "+ e);
		}
	  }
   %>
  	
</body>
</html>