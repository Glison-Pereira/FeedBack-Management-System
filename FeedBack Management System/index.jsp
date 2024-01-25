<%@ page import="java.sql.*" %>
<html>
<head>
      <title>FeedBack Management System</title>
      <link rel="icon" href="https://ideascale.com/wp-content/uploads/2023/09/Customer-Feedback-Management-cover.jpg">
      <link rel="stylesheet" href="style.css">
      <script>
	function imap()
	{
                alert("Hi");
  	 	let name=document.getElementById("1");
  	 	let email=document.getElementById("2");
   		let password=document.getElementById("3");
   		let confirmpassword=document.getElementById("4");
   		if(name.value.trim()=="" || email.value.trim()=="" || password.value.trim()=="" || confirmpassword.value.trim()=="")
   		{
        		alert("Don't leave empty space");
        		name.focus();
        		email.focus();
        		password.focus();
        		confirmpassword.focus();
        		return false;
   		}
   		else if(name.value.match(/^[A-Za-z]+$/)==null || email.value.match(/^[A-Za-z0-9.@]+$/)==null)
   		{
        		alert("You have enter either name or email wrong");
        		name.value="";
        		email.value="";
        		name.focus();
        		email.focus();
        		password.focus();
        		confirmpassword.focus();
        		return false;
   		}
   		else if(password.value.charAt(0).match(/^[A-Za-z0-9]+$/)==null || confirmpassword.value.charAt(0).match(/^[A-Za-z0-9]+$/)==null)
   		{
        		alert("Your password shouldn't start with special symbol");
        		name.focus();
        		email.focus();
        		password.focus();
        		confirmpassword.focus();
        		return false;
   		}
                else if(password.value!=confirmpassword.value)
   		{
        		alert("Enter correct Password");
        		name.focus();
        		email.focus();
        		password.focus();
        		confirmpassword.focus();
        		return false;
   		}
   		else if(name.value.length>20 || email.value.length>20 || password.value.length>20 || confirmpassword.value.length>20)
   		{
        		alert("You have exceeded words or numbers or special symbols above 20");
        		name.focus();
        		email.focus();
        		password.focus();
        		confirmpassword.focus();
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
          <a href="CreateFeed.jsp">CreateFeedBack</a>
          <a href="View.jsp">view</a>
      </div>
      <form onsubmit="return imap()" autocomplete="off">
               <h1>Login</h1>
               <hr>
               <h2>Enter your Name:</h2><input type="text" name="name" id="1" placeholder="Enter your name here" /><br>
               <h2>Enter your Email:</h2><input type="text" name="email" id="2" placeholder="Enter your email here" /><br>
               <h2>Enter your Password:</h2><input type="text" name="password" id="3" placeholder="Enter your password here" /><br>
               <h2>Enter your Confirm Password:</h2><input type="text" name="confirmpassword" id="4" placeholder="confirm password" /><br><br>
               <input type="submit" name="button" value="check" class="btn" />
     </form>
     <%
         if(request.getParameter("button")!=null)
         {
              String name=request.getParameter("name");
              String email=request.getParameter("email");
              String confirmpassword=request.getParameter("confirmpassword");
              try{
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url="jdbc:mysql://localhost:3306/loginintern3";
			Connection con=DriverManager.getConnection(url,"root","abc123");
			String sql="insert into login values(?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,name);
			pst.setString(2,email);
                        pst.setString(3,confirmpassword);
			pst.executeUpdate();
			out.println("record created");
			con.close();
		}
		catch(SQLException e)
		{
			out.println("issue "+ e);
		}
                finally
                {
                     session.setAttribute("name",name);
                     session.setAttribute("email",email);
                }
        }
    %>
   	
</body>
</html>