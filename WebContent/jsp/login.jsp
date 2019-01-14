<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/forstyle.css" type="text/css">
<script src="/dhsp/js/validation.js"></script>
<script >
function main(){
var id=document.getElementById("userid").value;
var pass=document.getElementById("userpass").value;
var b=true
var c=true

if(checkEmpty(id)==false)
	{
	document.getElementById("msgid").innerHTML = "enter id"
		document.getElementById("userid").focus()
		b = false
	}
if(checkEmpty(pass)==false)
{
document.getElementById("msgpass").innerHTML = "enter password"
	document.getElementById("userpass").focus()
	b = false
	//c=false
}
/* if(c)
	{
if(checkLength(pass)==false)
{
document.getElementById("msgpass").innerHTML = "password must be greater than 8 character!"
	document.getElementById("userpass").focus()
	b = false
}} */
return b

}


</script>
</head>
<body style="background-image: url('/dhsp/images/doodles.png');" >
<% String ms=(String)request.getAttribute("msg"); %>

<%@include file="/WEB-INF/homemenu.html" %>
<div style="margin-left:350px; margin-top:100px;width:50%;height:400px;float:left;
background-color: #f2f2f2;padding-right: 50px;border-radius: 20px;padding: 50px;">
<div
			style=" height: 40px;text-align: center ;margin-bottom: 20px">
			<h1>Login</h1>
		</div>
<form action="/dhsp/Login" method="post" onsubmit="return main()">
<table style="margin-left: 50px;" >
<tr><th>UserId</th><th><input type="text" id="userid" name="userid" style="width: 100%;"></th>
<td><span id="msgid" style="color:red;"></span></td></tr>
<tr><th>Password</th><th><input type="password" id="userpass" name="userpass" style="width: 100%;"></th>
<td><span id="msgpass" style="color:red;"></span></td></tr>
<tr>
<%
if(ms!=null)
{

%>
<td><span style="color:red;"><%=ms  %></span></td>
<%} %>
</tr>

<tr><th colspan="2"><button type="submit" style=" width: 100%;background-color: #4CAF50;color: white; padding: 10px 16px; margin: 8px 0; border: none;
    border-radius: 4px;">Login</button></th></tr>

</table>

<%-- <%
if(ms!=null)
{

%>
<h6 style="color:red"><%=ms  %></h6>
<%} %> --%>

</form>

</div>
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>