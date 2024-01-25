<%@ page import="java.sql.*" %>
<html>
<head>
      <title>FeedBack Management System</title>
      <link rel="icon" href="https://ideascale.com/wp-content/uploads/2023/09/Customer-Feedback-Management-cover.jpg">
      <link rel="stylesheet" href="style.css">
</head>
<body>
      <div class="feedback">
          <a href="CreateFeed.jsp">CreateFeedBack</a>
          <a href="FeedBack.jsp">AddFeedBack</a>
      </div>
     <form class="yes"  method="post" autocomplete="off">
     <input type="submit" name="buon" value="Logout" />
     </form>
      <%
          try{
                String str="";
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url="jdbc:mysql://localhost:3306/javaintern3120124";
		Connection con=DriverManager.getConnection(url,"root","abc123");
		String sql="select * from feedback";
		PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
                                
     %>                         <form class="yes"  method="post">
					<h3>Movie name:<%= rs.getString(1) %></h3>
					<span><p>Movie Description:<%= rs.getString(2) %></p></span>
                                </form>
                                
     <%
			}
			con.close();
		}
		catch(SQLException e)
		{
			out.println("issue "+ e);
		}
    %>
     
     <%
       if(request.getParameter("buon")!=null)
       {
          session.invalidate();
          response.sendRedirect("index.jsp");
       }
     %>
</body>
</html>