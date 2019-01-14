<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,dhsp.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminHome</title>

<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/style.css" type="text/css">
<script src="/dhsp/js/validation.js"></script>
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
<a href="/dhsp/jsp/admin_home.jsp" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana;margin-top: 20px ">HOME</a>
</div>
<div style="float: left;width: 3%;height: 35px;margin-left: 60px;margin-top: 10px;">
<img  src="/dhsp/images/logout.png" style="width: 100%;height: 100%;">
</div>
<div style="float: left;width: 3%;height: 30px;margin-top: 15px;margin-left:10px;">
<a href="/dhsp/Logoff" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana">LOGOUT</a>
</div>

 </div>
 <div style="background-color: darkblue;width: 30%;height: 630px;float: left;">
<%@include file="/WEB-INF/adminmenu.jsp" %>
<div style="width: 100%;height: 180px;background-color: darkblue;float: left;margin-top: 20px;">
<%@include file="/WEB-INF/bootstrapdemo.html" %></div>
</div>
<div style="width: 70%;height: 500px;background-image:url('/dhsp/images/des.jpg');float: left;">
<div
				style="background-color: #f2f2f2; width: 95%; height: 600px; border-radius: 4px;margin-left :30px;margin-right:30px;
				 margin-top: 30px; padding-top: 10px; padding-left: 10px;overflow:auto;">
				<h1
					style="margin-left: 300px; font-family: Georgia; font-weight: bold; color: navy;">
					View Company Details</h1>
<% 
String sql="Select * from company_details";
ResultSet r=CrudOperation.fetchData(sql);%>
<table border="2" style=" margin-top: 40px; border-radius: 5px;margin-right: 10px;background-color: white;width: 90%;text-align: center;margin-left: 30px;">
<tr><th class="heading">CompanyId</th><th class="heading">CompanyName</th><th class="heading">RegistrationNo</th><th class="heading">AreaOfWork</th>
<th class="heading">ContactNo</th><th class="heading">EmailId</th><th class="heading">OwnerName</th><th class="heading">Address</th></tr>
<% while(r.next())
	{
	%>
<tr><th class="txt"><%=r.getString("CompanyId") %></th>
<th class="txt"><%=r.getString("Compname") %></th>
<th class="txt"><%=r.getString("Registrationno") %></th>
<th class="txt"><%=r.getString("Areaofwork") %></th>
<th class="txt"><%=r.getString("Contactno") %></th>
<th class="txt"><%=r.getString("Email") %></th>
<th class="txt"><%=r.getString("Ownername") %></th>
<th class="txt"><%=r.getString("Address") %></th></tr>

<%}
r.close();%>
</table>
</div>
</div>
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>