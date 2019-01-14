<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sent Item</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<div style="width: 100%;height: 48px; background-color: black;">
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
<a href="/dhsp/Logoff" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana">LOGOUT</a></div>
</div>
<div
			style="width: 30%; height: 620px; float: left; background-color: darkblue;">
			<%@include file="/WEB-INF/adminmenu.jsp"%>
			<div style="width: 100%;height: 180px;background-color: darkblue;float: left;margin-top: 20px;">
<%@include file="/WEB-INF/bootstrapdemo.html" %></div>
		</div>
		
<div style="width: 70%; height: 550px; float: left;">
<div
				style="background-color: #f2f2f2; width: 90%; height: 600px; border-radius: 4px;margin-left :40px;margin-right:120px;
				 margin-top: 30px; padding-top: 30px; padding-left: 15px;overflow:auto;">
				<h1
					style=" font-family: Georgia; font-weight: bold;color: navy;text-align: center">
					Sent Items</h1> 
<%
    String str ="select * from sentitem where SenderId=?";
    ResultSet rs = CrudOperation.fetchData(str, userid);
%>
 <table border="2" style=" margin-top: 40px; border-radius: 5px;margin-right: 10px;background-color: white;width: 90%;text-align: center;margin-left: 30px;">
<tr><th class="heading">Msg Id</th><th class="heading">Receiver Id</th><th class="heading">Subject</th>
<th class="heading">Message</th><th class="heading">Date</th></tr>

<%
while(rs.next())
{
	
%>
<tr><th class="txt"><input type="checkbox" name="chk" value="<%=rs.getString("MsgId")%>"></th>
<th class="txt"><%=rs.getString("ReceiverId")%></th>



<th class="txt"><%=rs.getString("Subject")%></th>

<th class="txt"><%=rs.getString("Message") %></th>
<th class="txt"><%=rs.getString("Date")%></th></tr>


<%
}
rs.close();
%>
<tr><th colspan="5"><button type="submit" style=" width: 50%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 16px;
    margin-left:80px;
    border: none;
    border-radius: 4px;
    cursor: pointer;">Delete</button></th></tr>
</table>
</div></div>
 <script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>