<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Job</title>
<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/style.css" type="text/css">
<style>
.heading
{
 color: blue;
 font-size: large; }
 .txt
 {
 font-size: medium;
 font-weight: normal;}


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
<div style="width: 100%;height: 50px;float: left;background-color: black;">
<div style="float: left;width: 3%;height: 35px;margin-left: 1000px;margin-top: 10px;">
<img  src="/dhsp/images/home2.png" style="width: 100%;height: 100%;">
</div>
<div style="float: left;width: 3%;height: 30px;margin-top: 15px;margin-left:10px;">
<a href="/dhsp/jsp/company_home.jsp" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana;margin-top: 20px ">HOME</a>
</div>
<div style="float: left;width: 3%;height: 35px;margin-left: 60px;margin-top: 10px;">
<img  src="/dhsp/images/logout.png" style="width: 100%;height: 100%;">
</div>
<div style="float: left;width: 3%;height: 30px;margin-top: 15px;margin-left:10px;">
<a href="/dhsp/Logoff" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana">LOGOUT</a>
</div>

 </div>
 <div style="background-color: darkblue;width: 30%;height: 630px;float: left;">
<%@include file="/WEB-INF/companymenu.jsp" %>
</div>
<div style="width: 70%;height: 600px;background-image:url('/dhsp/images/des.jpg');float: left;">
<div
				style="background-color: #f2f2f2; width: 90%; height: 600px; border-radius: 4px;margin-left :40px;margin-right:120px;
				 margin-top: 30px; padding-top: 30px; padding-left: 15px;overflow:auto;">
				<h1
					style=" font-family: Georgia; font-weight: bold;color: navy;text-align: center">
					Show Job</h1> 
<%
String str="select * from job where CompId=?";
ResultSet r1=CrudOperation.fetchData(str,userid);
%>
<form action="/dhsp/Response" method="post">
 <table border="2" style=" margin-top: 40px; border-radius: 5px;margin-right: 10px;background-color: white;width: 90%;text-align: center;margin-left: 30px;">
<tr><th class="heading">Job Id</th><th class="heading">Job Name</th>

<%
while(r1.next())
{   
	String id=r1.getString("JobId");
	String name=r1.getString("JobName");
	

%>
<tr>

<th class="txt"><%=id %></th>
<th class="txt"><%=name %></th></tr>

<%}
r1.close();
%>


</table>
</form>
</div>
</div>
</body>
</html>