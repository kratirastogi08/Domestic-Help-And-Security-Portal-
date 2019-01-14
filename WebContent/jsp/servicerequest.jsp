<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Request</title>
<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" type="text/css" href="/dhsp/css/style.css">

</head>
<body>

<div style="width: 100%; background-color: white; height: 80px;">
			<div
				style="width: 10%; height: 100%; background-color: white; float: left;">
				<img src="/dhsp/images/logo.jpg" style="width: 100%; height: 100%;">
			</div>
			<div
				style="width: 70%; height: 100%; font-size: 60px; font-family: Georgia; margin-left: 100px; text-align: left; color: navy; float: left;">
				Domestic Help and Security Portal</div>
		</div>
<div style="width: 100%;height: 50px;float: left;background-color: black;">
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
 <div style="background-color: darkblue;width: 30%;height: 600px;float: left;">
<%@include file="/WEB-INF/usermenu.jsp" %>
<div style="width: 100%;height: 180px;background-color: darkblue;float: left;margin-top: 20px;">
<%@include file="/WEB-INF/bootstrapdemo.html" %></div>
</div>
<div style="width: 70%; height: 600px; float: left;">
<div style="background-color: #f2f2f2; width: 90%; height: 550px; border-radius: 4px;margin-left :50px;
				 margin-top: 20px; padding-top: 10px; padding-left: 15px;">
				 <h1
					style="margin-left: 250px; font-family: Georgia; font-weight: bold; color: navy;">
					Service Request</h1>

<form action="/dhsp/ServletRequest" method="post">
<table style="margin-left: 200px;color: black;text-align: center;margin-top: 20px;">
<%String str="select * from company_details" ;
ResultSet r=CrudOperation.fetchData(str);
%>
<tr><th><select name="cmbcompany" >
<option value="default">Select a company</option>
<%
while(r.next())
{
	String compid=r.getString("CompanyId");
	String compname=r.getString("Compname");
%>

<option  value="<%=compid %>"><%=compname%></option>

<%}%>
</select></th></tr>
<% 
r.close();
%>
<tr><th><a href="/dhsp/jsp/company.jsp">View All Companies</a></th></tr>

<tr><th>User id</th><th><input type="text" value="<%=userid%>" readonly="readonly"></th></tr>

<tr><th>Subject</th><th><input type="text" id="sub" name="sub"></th></tr>
<tr><th>Request</th><th><textarea rows="5" cols="35" id="req" name="req"></textarea></th></tr>
<tr><th colspan="4"><button type="submit" style=" width: 80%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 16px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;">Submit</button></th></tr>


</table>



</form>
</div>
</div>
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>