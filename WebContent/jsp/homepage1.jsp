<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,dhsp.dbtasks.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
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

<script>
var arr=new Array(3)
var path="/dhsp/images/"
arr[0]=path+"baby-sitter.jpg"
arr[1]=path+"abc.jpg"
arr[2]=path+"jkl.jpg"
arr[3]=path+"yui.jpg"
var idx=0
function animation()
{
	var im=document.getElementById("img")
	im.src=arr[idx]
	idx++
	if(idx>3)
		idx=0
	setTimeout("animation()",2000)
	}
 </script>
</head>
<body onload="animation()">
	<%@include file="/WEB-INF/homemenu.html" %>

<div style="width: 100% ;height: 300px;">
  <div style="float: left; width: 30%; height: 300px;background-color: black;margin-left: 20px;">
  
  <% String str="select * from news";
    ResultSet rs=CrudOperation.fetchData(str); 
   %>
   <% while(rs.next()) 
   { %>
  
  <a href="#" style="margin-left: 40px;margin-top: 40px; font-size: 30px;"><marquee direction="up" onmouseout="this.start()" onmouseover="this.stop()" scrollamount="2"><%=rs.getString("Subject") %></marquee></a>
  <% }
   rs.close();%>
  
 </div>
 
  <div style="width: 60%; height: 300px; float:left; background-color: blue;">
  
  <img id=img style="width:100%; height: 300px; ">
 </div>
 </div>
 <div style="background-color: yellow; width: 100%; height: 400px; margin-top: 10px;">
 <h1 style="margin-left: 550px;">What we offer</h1>
 <div class="home"
			>
			<img src="/dhsp/images/cook.png" style="width: 100px; height: 100px"></img>
			<a href="/dhsp/jsp/.jsp" class="icon">COOK</a>
			
		</div>
		<div
class="home">			<img src="/dhsp/images/guard.png" style="width: 100px; height: 100px"></img>
			<a href="/dhsp/jsp/servicerequest.jsp" class="icon" style="margin-left: 0px;">SECURITY GUARDS</a>

		</div>
		<div class="home"
			>
			<img src="/dhsp/images/helper.png "
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">HELPER</a>

		</div>
		<div
			class="home">
			<img src="/dhsp/images/nanny.png "
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">NANNY</a>

		</div>
		<div class="home"
			>
			<img src="/dhsp/images/driver.png "
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">DRIVER</a>

		</div>
		<div
			class="home">
			<img src="/dhsp/images/office.png"
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon" style="margin-left: 0px;">OFFICE BOY</a>

		</div>
		<div
			class="home">
			<img src="/dhsp/images/peon.png" 
				style="width: 100px; height: 100px"></img> <a
				href="/dhsp/jsp/servicerequest.jsp" class="icon">PEON</a>

		</div>
		<div
			class="home">
			<img src="/dhsp/images/baby.png" 
				style="width: 100px; height: 100px"></img> 
				<a href="/dhsp/jsp/servicerequest.jsp" class="icon">BABYSITTER</a>

		</div></div>
 
  <div  style="float: left; width: 100% ; height: 30px;background-color:grey;">
  <h6 style="margin-left: 400px; color: white; margin-top: 5px;">Privacy Policy | Terms of Services Agreement | Website Disclaimer</h6></div>
  <div  style="float: left; width: 100% ; height: 50px;background-color:black;">
  <h6 style="margin-left: 200px; color: white; margin-top: 10px;">Copyrights © 2016 Domestic help and security portal All rights reserved</h6></div>
  

<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>