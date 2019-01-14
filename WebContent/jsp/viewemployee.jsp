<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,dhsp.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Employee</title>

<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/style.css" type="text/css">
<script src="/dhsp/js/validation.js"></script>
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
		<div style="width: 100%; height: 48px; background-color: black;">
			<div
				style="float: left; width: 3%; height: 35px; margin-left: 1000px; margin-top: 10px;">
				<img src="/dhsp/images/home2.png" style="width: 100%; height: 100%;">
			</div>
			<div
				style="float: left; width: 3%; height: 30px; margin-top: 15px; margin-left: 10px;">
				<a href="/dhsp/jsp/home.jsp"
					style="text-decoration: none; color: white; font-size: 20px; font-family: Verdana; margin-top: 20px">HOME</a>
			</div>
			<div
				style="float: left; width: 3%; height: 35px; margin-left: 60px; margin-top: 10px;">
				<img src="/dhsp/images/logout.png"
					style="width: 100%; height: 100%;">
			</div>
			<div
				style="float: left; width: 3%; height: 30px; margin-top: 15px; margin-left: 10px;">
				<a href="/dhsp/Logoff"
					style="text-decoration: none; color: white; font-size: 20px; font-family: Verdana">LOGOUT</a>
			</div>
		</div>
		<div
			style="width: 30%; height: 650px; float: left; background-color: darkblue;">
			<%@include file="/WEB-INF/companymenu.jsp"%>
		</div>

		<div style="width: 70%; height: 600px; float: left;">

			<div
				style="background-color: #f2f2f2; width: 90%; height: 600px; border-radius: 4px;margin-left :40px;margin-right:120px;
				 margin-top: 30px; padding-top: 30px; padding-left: 15px;overflow:auto;">
				<h1
					style=" font-family: Georgia; font-weight: bold;color: navy;text-align: center">
					Employee Details</h1> 
						<%
		String path=request.getContextPath();
		System.out.println(path);
		String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		System.out.println(basePath);
		
		String imgname="";
		String picsrc=null;

		String strsql="select * from employee_details where CompanyId=?";

		ResultSet rs=CrudOperation.fetchData(strsql,userid);%>
		
		 <table border="2" style=" margin-top: 40px; border-radius: 5px;margin-right: 10px;background-color: white;width: 90%;text-align: center;margin-left: 30px;">
		  <tr><th>Photo</th><th>Employee Id</th> <th>Employee Name</th><th>Address</th><th>Job Id</th><th>Experience</th>
		  <th>DOB</th><th>Gender</th><th>Contact no</th>
	 <% while(rs.next())
		{
		imgname=rs.getString("Photo");
		if(imgname==null)
		{
			picsrc="/dhsp/images/download (4).jpg";
			
		}
		else{
			
			picsrc=basePath+userid+"/"+imgname;
	
		}

		%>
					 
					  <tr><th><img src="<%=picsrc %>" class="img-circle" alt="Cinque Terre" width="50" height="50"> </th>
					 <th ><%=rs.getString("EmpId")%></th>
					 <th ><%=rs.getString("Empname")%></th>
					<th ><%=rs.getString("Address")%></th>
					  <th> <%=rs.getString("JobId")%></th>
					  <th ><%=rs.getString("Experience")%></th>
					  <th ><%=rs.getString("DOB")%></th>
					  <th ><%=rs.getString("Gender")%></th>
					  <th ><%=rs.getString("Contactno")%></th></tr>
					  
					  <%}
					  rs.close();%>
					  
					  </table> 
				</div>
				</div>
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>