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
var arr=new Array(4)
var path="/dhsp/images/"
arr[0]=path+"baby-sitter.jpg"
arr[1]=path+"pe.jpg"
arr[2]=path+"ca.jpg"
arr[3]=path+"ha.jpg"
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
  
 
  <div style="width: 100%; height: 300px; float:left;">
  
  <img id="img" style="width:100%; height: 300px;  ">
 </div>
 </div>
 <div style="float: left; width: 30%; height: 320px;background-color:#f2f2f2;float: left;margin-top: 2px">
 <h3 style="text-align: center">NEWS</h3>
 <marquee direction="up" scrollamount="3" behavior="scroll" scrolldelay="3" height="250px">
 <% String str="select * from news";
    ResultSet rs=CrudOperation.fetchData(str); 
    while(rs.next())
    { 
   
  %>
 <div style="margin-left: 30px;margin-top: 10px;font-family: serif;font-weight: bold;"><%=rs.getString("Subject") %></div>
  <div style="margin-left: 30px;font-family:Constantia;"><%=rs.getString("Contents") %></div>
 
  
 <%}
    rs.close();%>
    </marquee>
 </div>
 <div style="background-image:url('/dhsp/images/doodles.png'); width: 70%; height: 300px; margin-top: 20px;float: left">
 <h1 style="margin-left: 300px;">What we offer</h1>
 <marquee behavior="scroll" direction="left" style="float: left ;margin-top: 40px">
<div style="float: left;margin-left: 20px" ><img src="/dhsp/images/helper.png" width="100" height="100" alt="" >
<p ><a href="/dhsp/jsp/servicerequest.jsp" style="text-decoration: none;float: left;margin-left: 20px">HELPER</a></p></div>

<div style="float: left;margin-left: 100px" ><img src="/dhsp/images/nanny.png" width="100" height="100" alt="" >
<p ><a href="/dhsp/jsp/servicerequest.jsp" style="text-decoration: none;float: left;margin-left: 20px">NANNY</a></p></div>

<div style="float: left;margin-left: 100px" ><img src="/dhsp/images/driver.png" width="100" height="100" alt="" >
<p ><a href="/dhsp/jsp/servicerequest.jsp" style="text-decoration: none;float: left;margin-left: 20px">DRIVER</a></p></div>

<div style="float: left;margin-left: 100px" ><img src="/dhsp/images/office.png" width="100" height="100" alt="" >
<p ><a href="/dhsp/jsp/servicerequest.jsp" style="text-decoration: none;float: left;margin-left: 20px">OFFICE</a></p></div>

<div style="float: left;margin-left: 100px" ><img src="/dhsp/images/peon.png" width="100" height="100" alt="" >
<p ><a href="/dhsp/jsp/servicerequest.jsp" style="text-decoration: none;float: left;margin-left: 20px">PEON</a></p></div>

<!-- <div style="float: left;margin-left: 50px" ><img src="/dhsp/images/baby.png" width="100" height="100" alt="" >
<p ><a href="/dhsp/jsp/servicerequest.jsp" style="text-decoration: none;float: left">BABYSITTER</a></p></div> -->
</marquee>
 </div>
 
  <div  style="float: left; width: 100% ; height: 30px;background-color:grey;">
  <h6 style="text-align:center; color: white;">Privacy Policy | Terms of Services Agreement | Website Disclaimer</h6></div>
  <div  style="float: left; width: 100% ; height: 50px;background-color:black;">
  <h6 style="text-align:center; color: white;s">Copyrights © 2016 Domestic help and security portal All rights reserved</h6></div>
  
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>