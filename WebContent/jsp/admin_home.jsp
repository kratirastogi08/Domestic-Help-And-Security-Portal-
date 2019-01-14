<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminHome</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/style.css" type="text/css">
<script>
	//alert("hello")
	
	var arr1 = new Array(3)
	arr1[0] = "blue"
	arr1[1] = "teal"
	arr1[2] = "purple"
	var id = 0
	function changeColor() {
		var sp = document.getElementById("txt")
		sp.style.color = arr1[id]
		id++
		if (id > 2)
			id = 0
		setTimeout("changeColor()", 1000);

	}
	
	
</script>
</head>
<body onload="changeColor()">

<div
	style="width: 100%; background-color:white; height: 80px;">
	<div style="width: 10%;height: 100%;background-color: white;float: left;">
<img  src="/dhsp/images/logo.jpg" style="width: 100%;height: 100%;">
</div>
	<div style="width: 70%;height: 100%;font-size: 60px;font-family: Georgia;margin-left: 100px;text-align:left;color: navy;float: left;">
	Domestic Help and Security Portal
</div>
</div>
<div style="width: 100%;height: 50px;float: left;background-color: black;">
<div style="float: left;width: 3%;height: 35px;margin-left: 1000px;margin-top: 10px;">
<img  src="/dhsp/images/home2.png" style="width: 100%;height: 100%;">
</div>
<div style="float: left;width: 3%;height: 30px;margin-top: 15px;margin-left:10px;">
<a href="/dhsp/jsp/admin_home.jsp" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana;margin-top: 20px ">HOME</a>
</div>
<div style="float: left;width: 3%;height: 35px;margin-left: 60px;margin-top: 10px;">
<img  src="/dhsp/images/logout.png" style="width: 100%;height: 100%;">
</div>
<div style="float: left;width: 3%;height: 30px;margin-top: 15px;margin-left:10px;">
<a href="/dhsp/Logoff" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana">LOGOUT</a>
</div>

 </div>
 <div style="background-color: darkblue;width: 30%;height: 600px;float: left;">
<%@include file="/WEB-INF/adminmenu.jsp" %>
<div style="width: 100%;height: 180px;background-color: darkblue;float: left;margin-top: 20px;">
<%@include file="/WEB-INF/bootstrapdemo.html" %>
<% if(userid==null || hs.isNew())
{
	request.setAttribute("msg","Unauthorised Access");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response);
	
} %></div>
</div>
<div style="width: 70%;height: 600px;background-image:url('/dhsp/images/subtle_grunge.png');float: left;">
 <div>
       
       <h1 id="txt" style="text-align: center; font-size:70px; font-weight: bold; margin-top: 100px;font-family: Georgia;margin-left: 60px;"> 
       Welcome! 
       <%=userid %> 
       to your home</h1>
       
       </div>
</div>
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>

</body>
</html>