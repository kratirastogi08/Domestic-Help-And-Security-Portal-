<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,dhsp.dbtasks.*,java.util.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Response</title>
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
 <div style="background-color: darkblue;width: 30%;height: 600px;float: left;">
<%@include file="/WEB-INF/companymenu.jsp" %>
</div>
<div style="width: 70%;height: 600px;background-image:url('/dhsp/images/des.jpg');float: left;">
<div style="width:90%;height:550px;background-color: #f2f2f2;margin-top:30px;margin-left:60px">
<h1 style="margin-left: 250px; margin-top: 20px; color: navy;font-weight: bold;">Service Response</h1>
<%
String str="select * from service_request where Servicestatus='false'";
ResultSet r1=CrudOperation.fetchData(str);
%>
<form action="/dhsp/Response" method="post">
 <table border="2" style=" margin-top: 40px; border-radius: 5px;margin-right: 10px;background-color: white;width: 90%;text-align: center;margin-left: 30px;">
<tr><th class="heading">Select</th><th class="heading">ReqId</th><th class="heading">Date of Request</th>
<th class="heading">Subject</th><th class="heading">Response</th></tr>
<%
while(r1.next())
{   
	String sub=r1.getString("Subject");
	String req=r1.getString("Request");
	Date d =(Date) r1.getDate("Dateofreq");
	

%>
<tr>
<th><input type="checkbox" name="chk" value="<%=r1.getString("Reqid")%>"></th>
<th class="txt"><%=r1.getString("Reqid")%></th>
<th class="txt"><%=d %></th>
<th class="txt"><%=sub %></th>
<th class="txt"><%=req %></th></tr>

<%}
r1.close();
%>
<tr><th colspan="5"><button type="submit" style=" width: 50%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 16px;
    margin-left:30px;
    border: none;
    border-radius: 4px; cursor: pointer;" >Respond</button></th></tr>


</table>
</form>
</div>
</div>
</body>



</html>