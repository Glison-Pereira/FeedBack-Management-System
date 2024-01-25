<%@ page import="java.sql.*" %>
<html>
<head>
      <title>FeedBack Management System</title>
      <link rel="icon" href="https://ideascale.com/wp-content/uploads/2023/09/Customer-Feedback-Management-cover.jpg">
      <link rel="stylesheet" href="style.css">
</head>
<body>
      <div class="feedback">
          <a href="Delete.jsp">Delete</a>
          <a href="FeedBack.jsp">AddFeedBack</a>
      </div>
      
      <form class="yes"  method="post" autocomplete="off">
      <input type="submit" name="buon" value="Logout" />
      <table border="5" style="width:80%;">
	<tr>
	<th>Moviename</th>
	<th> Name </th>
	<th> Description </th>
        <th> rating </th>
	</tr>
      <%
         String nam=(String)session.getAttribute("name");
         String email=(String)session.getAttribute("email");
	 if(nam==null || email==null)
	 response.sendRedirect("index.jsp");
	 else
	 {
          try{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url="jdbc:mysql://localhost:3306/feedbackintern3";
		Connection con=DriverManager.getConnection(url,"root","abc123");
		String sql="select * from feed";
		PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
     %>  
                       <tr style="text-align:center;">
			<td> <%= rs.getString(1) %></td>
			<td> <%= rs.getString(2) %></td>
			<td> <%= rs.getString(3) %></td>
                        <td> <%= rs.getString(4) %></td>
			</tr>
                                
                       </form>
     <%
			}
			con.close();
		}
		catch(SQLException e)
		{
			out.println("issue "+ e);
		}
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