<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Request Service</title>
<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" type="text/css" href="/dhsp/css/style.css">
<style>
.home{
width: 100px; height: 100px; 
background-color: white; 
float: left;
 margin-left: 200px;
 margin-top: 50px;
}
.icon
{
 margin-left:15px;
 color: navy;
 font-weight: bold;}
</style>


</head>
<body>
	<div
	style="width: 100%; background-color:white; height: 80px;">
	<div style="width: 10%;height: 100%;background-color: white;float: left;">
<img  src="/dhsp/images/logo.jpg" style="width: 100%;height: 100%;">
</div>
	<div style="width: 70%;height: 100%;font-size: 60px;font-family: Georgia;margin-left: 100px;text-align:left;color: navy;float: left;">
	Domestic Help and Security Portal
</div>
</div>
<div
		style="width: 100%; height: 50px; float: left; background-color: black;">
		<div
			style="float: left; width: 3%; height: 35px; margin-left: 1000px; margin-top: 10px;">
			<img src="/dhsp/images/home2.png" id="" style="width: 100%; height: 100%;">
		</div>
		<div
			style="float: left; width: 3%; height: 30px; margin-top: 15px; margin-left: 10px;">
			<a href="/dhsp/jsp/userhome.jsp"
				style="text-decoration: none; color: white; font-size: 20px; font-family: Verdana; margin-top: 20px">HOME</a>
		</div>
		<div
			style="float: left; width: 3%; height: 35px; margin-left: 60px; margin-top: 10px;">
			<img src="/dhsp/images/logout.png" style="width: 100%; height: 100%;">
		</div>
		<div
			style="float: left; width: 3%; height: 30px; margin-top: 15px; margin-left: 10px;">
			<a href="/dhsp/Logoff"
				style="text-decoration: none; color: white; font-size: 20px; font-family: Verdana">LOGOUT</a>
		</div>

	</div>
	 <div style="background-color: darkblue;width: 20%;height: 550px;float: left;padding-top: 40px;">
<%@include file="/WEB-INF/usermenu.jsp" %>
<div style="width: 100%;height: 200px;background-color: darkblue;float: left;margin-top: 20px;">
<%@include file="/WEB-INF/bootstrapdemo.html" %></div>
</div>
		
	
	<div
		style="width: 80%; height: 550px; background-color:white; float: left;background-image: url('/dhsp/images/subtle_grunge.png');">


		<div
			class="home">
			<img src="/dhsp/images/cook.png" style="width: 100px; height: 100px"></img>
			<a href="/dhsp/jsp/servicerequest.jsp" class="icon">COOK</a>
			
		</div>
		<div
			class="home">
			<img src="/dhsp/images/guard.png" style="width: 100px; height: 100px"></img>
			<a href="/dhsp/jsp/servicerequest.jsp" class="icon">SECURITY GUARDS</a>

		</div>
		<div
			class ="home">
			<img src="/dhsp/images/helper.png "
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">HELPER</a>

		</div>
		<div
			class ="home">
			<img src="/dhsp/images/nanny.png "
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">NANNY</a>

		</div>
		<div
			class ="home">
			<img src="/dhsp/images/driver.png "
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">DRIVER</a>

		</div>
		<div
			class ="home">
			<img src="/dhsp/images/office.png"
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">OFFICE BOY</a>

		</div>
		<div
			class ="home">
			<img src="/dhsp/images/peon.png" 
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">PEON</a>

		</div>
		<div
			class="home">
			<img src="/dhsp/images/baby.png" 
				style="width: 100px; height: 100px"></img> 
				<a href="/dhsp/jsp/servicerequest.jsp" class="icon">BABYSITTER</a>

		</div>
	</div>
	
	

	

<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>

</body>
</html>