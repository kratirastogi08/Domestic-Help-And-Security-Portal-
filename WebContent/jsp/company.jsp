<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Company</title>
<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" type="text/css" href="/dhsp/css/style.css">
<style>
.heading
{
color:blue;

}

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

<div style="float: left;width: 4%;height: 30px;margin-top: 15px;margin-left: 10px;">
<a href="/dhsp/jsp/servicerequest.jsp" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana;margin-top: 20px ">Back</a>
</div>
<div style="float: left;width: 3%;height: 35px;margin-left: 1000px;margin-top: 10px;">
<img  src="/dhsp/images/home2.png" style="width: 100%;height: 100%;">
</div>
<div style="float: left;width: 3%;height: 30px;margin-top: 15px;margin-left:10px;">
<a href="/dhsp/jsp/userhome.jsp" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana;margin-top: 20px ">HOME</a>
</div>
<div style="float: left;width: 3%;height: 35px;margin-left: 60px;margin-top: 10px;">
<img  src="/dhsp/images/logout.png" style="width: 100%;height: 100%;">
</div>
<div style="float: left;width: 3%;height: 30px;margin-top: 15px;margin-left:10px;">
<a href="/dhsp/Logoff" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana">LOGOUT</a>
</div>

 </div>
 <div style="background-color: darkblue;width: 20%;height: 500px;float: left;padding-top: 20px;">
<%@include file="/WEB-INF/usermenu.jsp" %>
<div style="width: 100%;height: 180px;background-color: darkblue;float: left;margin-top: 20px;">
<%@include file="/WEB-INF/bootstrapdemo.html" %></div>
</div>
<div style="width: 80%;height: 500px;background-image:url('/dhsp/images/des.jpg');float: left;">
<div	style="background-color: #f2f2f2; width: 90%; height: 400px; border-radius: 10px;margin-left :80px;margin-right:80px;
				 margin-top: 20px; padding-top: 10px; padding-left: 10px;overflow:auto;">
				<h1
					style="margin-left: 300px; font-family: Georgia; font-weight: bold;color: navy;">
					Company Details</h1>


<% String str="select * from company_details";
ResultSet r=CrudOperation.fetchData(str);
%>
<table border="1" style="margin-left:100px;margin-top:60px">
<tr ><th class="heading">CompanyId</th><th class="heading"> Compname</th><th class="heading"> Areaofwork</th><th class="heading"> Contactno</th><th class="heading"> Email</th></tr>
<% 
while(r.next())
		{
		String compid=r.getString("CompanyId");
	String compname=r.getString("Compname");
	String area=r.getString("Areaofwork");
	String phone=r.getString("Contactno");
	String email=r.getString("Email");
	String name=r.getString("Ownername");
	String add=r.getString("Address");
	%>


<tr><th><%=compid %></th><th><%=compname %></th><th><%=area %></th><th><%=phone %></th><th><%=email %></th></tr>
<%}
r.close();
%>

</table>
</div>
</div>
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>