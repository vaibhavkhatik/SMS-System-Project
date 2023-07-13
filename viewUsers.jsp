
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
		if (request.getParameter("ok") != null) {
			}
	%>

	<%
		if (request.getParameter("no") != null) {
				out.println("<script>alert('privileges Not Assign Successfull ')</script>");
			}

			if (request.getParameter("removeUserSucc") != null) {
				out.println("<script>alert('User removed successfully. ')</script>");
			}
			if (request.getParameter("updated") != null) {
				out.println("<script>alert('User updated successfully. ')</script>");
			}
			if (request.getParameter("removeUserSucc") != null) {
				out.println("<script>alert('Failed to update user. ')</script>");
			}
	%>
	<!-- Header -->
	<div id="header">
		<div class="container">

			<!-- Logo -->
			<div id="logo">
				<marquee>
					<h1>
						<a href="#">SMS For Finding Internal Attack</a>
					</h1>
				</marquee>
			</div>

			<!-- Nav -->
			<nav id="nav">

				<ul>
				<li><a href="adminhome.jsp">Home</a></li>
				      <li><a href="register.jsp">Add User</a></li>
				<li><a class="active" href="viewUsers.jsp">Users</a></li>
				<li><a href="Logout">Logout</a></li>
				</ul>
			</nav>

		</div>
	</div>

<div id="featured">
			<div class="container">
			<div align="center">

	<div class="title">

						<h1> Welcome Administrator </h1>

<br><br>
						<div class="contact-form">


								<table cellspacing="15" border="1" style="color: black;" cellpadding="3">
									<tr>
										<td style="width: 3cm;">User Name</td>
										<td style="width: 4cm;">Give Restriction</td>
										<td style="width: 4cm;">Action</td>
										<td style="width: 4cm;">View User</td>
									</tr>

									<%
										Connection con = DbConnection.getConnection();
											PreparedStatement ps = con.prepareStatement("select * from usermem_info");
											ResultSet rs = ps.executeQuery();
											while (rs.next()) {
									%>

									<tr style="color: blue">
										<td  style="width: 2cm;"><%=rs.getString("username")%></td>
										<td style="width: 2cm;"><a
											href="restriction.jsp?username=<%=rs.getString("username")%>"><font
												color="Blue">Give Restriction</font></a></td>
										<%
											
										%></td>

										<td style="width: 2cm;"><a
											href="viewUsers.jsp?userId=<%=rs.getString("id")%>"><font
												color="red">Remove</font></a></td>
										<%
											
										%></td>

										<td><a
											href="viewUser.jsp?username=<%=rs.getString("username")%>"><font
												color="Green">View Details</font></a></td>
										</td>
									</tr>
									<%
										}
									%>
								</table>
								<br />


						</div>

						<%
							if (request.getParameter("userId") != null) {

									String userId = request.getParameter("userId");

									PreparedStatement pst = con
											.prepareStatement("DELETE FROM usermem_info where id = '" + userId + "'");
									pst.executeUpdate();

									response.sendRedirect("viewUsers.jsp?removeUserSucc");

								}
						%>
						<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

			</div>
			</div>
		</div>
	
</body>
</html>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>