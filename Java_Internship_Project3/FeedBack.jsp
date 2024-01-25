<%@ page import="java.sql.*" %>
<html>
<head>
      <title>FeedBack Management System</title>
      <link rel="icon" href="https://ideascale.com/wp-content/uploads/2023/09/Customer-Feedback-Management-cover.jpg">
      <link rel="stylesheet" href="style.css">
      <script >
		function fmap()
		{
   			let moviename=document.getElementById("11");
                        let name=document.getElementById("12");
   			let description=document.getElementById("13");
   			if(moviename.value.trim()=="" || description.value.trim()=="" || name.value.trim()=="")
   			{
        			alert("Don't leave empty space");
        			moviename.focus();
                                name.focus();
        			description.focus();
        			return false;
   			}
   			else if(moviename.value.match(/^[A-Za-z0-9]+$/)==null || name.value.match(/^[A-Za-z]+$/)==null)
   			{
        			alert("You have enter moviename or your name wrong");
        			moviename.value="";
                                name.value="";
        			description.value="";
        			moviename.focus();
                                name.focus();
        			description.focus();
        			return false;
   			}
   			else if(moviename.value.length>50 || description.value.length>1000 || name.value.length>20)
   			{
        			alert("Either your name or moviename or your description exceeds the maximum limit");
        			moviename.focus();
                                name.focus();
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
          <a href="Viewuser.jsp">Reviews</a>
          <a href="View.jsp">view</a>
      </div> 
      <form onsubmit="return fmap()" autocomplete="off">
               <h1>FeedBack</h1>
               <hr>
               <h2>Enter your Movie Name:</h2><input type="text" name="moviename" id="11" placeholder="Enter your movie name here" /><br>
               <h2>Enter your name:</h2><input type="text" name="name" id="12" placeholder="Enter your name here" /><br>
               <h2>Enter your description:</h2><textarea class="field" name="description" id="13" rows="4" cols="20" placeholder="Enter Description of movie here" ></textarea><br><br>
               <h2>Enter your Rating:</h2>
               <input type="radio" id="star5" name="rate5" value="5" />
      		<label for="star5" title="text">5 stars</label>
      		<input type="radio" id="star4" name="rate4" value="4" />
      		<label for="star4" title="text">4 stars</label>
      		<input type="radio" id="star3" name="rate3" value="3" />
      		<label for="star3" title="text">3 stars</label>
      		<input type="radio" id="star2" name="rate2" value="2" />
      		<label for="star2" title="text">2 stars</label>
      		<input type="radio" id="star1" name="rate1" value="1" />
      		<label for="star1" title="text">1 star</label>
               <input type="submit" name="button" value="check" class="btn"  />
     </form>
     <%
         String nam=(String)session.getAttribute("name");
         String email=(String)session.getAttribute("email");
	 if(nam==null || email==null)
	 response.sendRedirect("index.jsp");
	 else
	 {	
         if(request.getParameter("button")!=null)
         {
              String rate="";
              String moviename=request.getParameter("moviename");
              String name=request.getParameter("name");
              String describe=request.getParameter("description");
              if(request.getParameter("rate5")!=null)
              rate="5stars";
              if(request.getParameter("rate4")!=null)
              rate="4stars";
              if(request.getParameter("rate3")!=null)
              rate="3stars";
              if(request.getParameter("rate2")!=null)
              rate="2stars";
              if(request.getParameter("rate1")!=null)
              rate="1star";
              try{
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url="jdbc:mysql://localhost:3306/feedbackintern3";
			Connection con=DriverManager.getConnection(url,"root","abc123");
			String sql="insert into feed values(?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,moviename);
			pst.setString(2,name);
                        pst.setString(3,describe);
                        pst.setString(4,rate);
			pst.executeUpdate();
			out.println("record created");
			con.close();
		}
		catch(SQLException e)
		{
			out.println("issue "+ e);
		}
        }
        }
    %>
</body>
</html>