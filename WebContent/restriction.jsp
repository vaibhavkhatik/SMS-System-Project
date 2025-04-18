
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.datech"%>

<%@page import="com.Allcom"%>
<%
	if (session.getAttribute("username") != null) {
%>

<!DOCTYPE HTML>

<html>
<head>
<title>IIDS</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-panels.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-desktop.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
</head>
<body class="homepage">
	<%
 if(request.getParameter("ok")!=null)
 {
	 out.println("<script>alert('privileges Assign Successfull ')</script>");
 }
 
 %>
 
 <%
 if(request.getParameter("no")!=null)
 {
	 out.println("<script>alert('privileges Not Assign Successfull ')</script>");
 }
 
 %>
	<!-- Header -->
	<div id="header">
		<div class="container">

			<!-- Logo -->
			<div id="logo">
				<marquee>
					<h1>
						<a href="#">SMS For Finding Internal Attack </a>
					</h1>
				</marquee>
			</div>

			<!-- Nav -->
			<nav id="nav">

				<ul>
			 <li><a class="active" href="adminhome.jsp">Home</a></li>
       <li><a href="Logout">Logout</a></li> 
				</ul>
			</nav>

		</div>
	</div>

<div id="featured">
			<div class="container">
			<div align="center">

   <div class="title">
     
       <h2>Welcome Administrator</h2>
       <br>    <br>
        
        <div class="contact-form">
        <% String user=request.getParameter("username");
        	session.setAttribute("user", user);
        %>
   <form action="restriction" method="post">	
       
     
			<table cellspacing="15">
			<tr><td>USB</td><td>Date</td><td>Directory</td></tr>
			
		  <tr>
		  <td><select name="usb" required >
		  <option value="">---Select---</option>
		 
		  <option value="yes">Yes</option>
		  <option value="no">No</option>
		  </select></td>
		  
		  <td><select name="date" required >
		  <option value="">---Select---</option>
		
		  <option value="yes">Yes</option>
		  <option value="no">No</option>
		  </select></td>
		  
		  <td><select name="directory" required >
		  <option value="">---Select---</option>
		 
		
		  <option value="yes">Yes</option>
		  <option value="no">No</option>
		  </select></td>
		  
		 
		   </tr>
		    </table><br/>
  
   
  </form> 
<br> <br>
  <td><input type="submit" value="submit"> 
                            
      </div>
      
     
    </div>			</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	

</body>
</html>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>