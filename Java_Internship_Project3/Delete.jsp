<%@ page import="java.sql.*" %>
<html>
<head>
      <title>FeedBack Management System</title>
      <link rel="icon" href="https://ideascale.com/wp-content/uploads/2023/09/Customer-Feedback-Management-cover.jpg">
      <link rel="stylesheet" href="style.css">
</head>
<body>
      <div class="feedback">
          <a href="Viewuser.jsp">Reviews</a>
          <a href="FeedBack.jsp">AddFeedBack</a>
      </div>
    <form class="yes"  method="post" autocomplete="off">
    <input type="text" name="delete" id="15" placeholder="Enter your movie name to be deleted from rating here" />
    <input type="submit" name="del" value="Delete" />
    <input type="text" name="name" id="18" placeholder="Enter your name here" />
    <input type="text" name="check" id="17" placeholder="Enter your movie name to be checked from rating here" />
    <input type="submit" name="che" value="check" />
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
    if(request.getParameter("che")!=null)
       {
          String check=request.getParameter("check");
          String name=request.getParameter("name");
          try{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url="jdbc:mysql://localhost:3306/feedbackintern3";
		Connection con=DriverManager.getConnection(url,"root","abc123");
		String sql="select * from feed where movie=? or name=?";
		PreparedStatement pst=con.prepareStatement(sql);
                pst.setString(1,check);
                pst.setString(2,name);
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
     else if(request.getParameter("del")!=null)
       {
          String dele=request.getParameter("delete");
          try{
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url="jdbc:mysql://localhost:3306/feedbackintern3";
		Connection con=DriverManager.getConnection(url,"root","abc123");
		String sql="delete from feed where movie=? and name=?";
		PreparedStatement pst=con.prepareStatement(sql);
                pst.setString(1,dele);
                pst.setString(2,nam);
                long r=pst.executeUpdate();
                out.println("record deleted");
		con.close();
        }
	catch(SQLException e)
	{
		out.println("issue "+ e);
	}
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