<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dhsp.dbtasks.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/style.css" type="text/css">
<script src="/dhsp/js/validation.js"></script>
<script>
  
  $(document).ready(function(){
	  
	  $("#cmbid").change( //event generated
	      		function(){
	      			var empid=this.value;
	      			
	      			//alert(empid)
	       
	      			 $.get("/dhsp/Delete",
	      			        {
	      			          did:empid
	      			          
	      			        },
	      			        function(data,status){
	      			        	
	      			           /*  alert("Data: " + data + "\nStatus: " + status);
	      			            $("#div1").html(data);
	      			             $("#div1").show(); */
	      			             //$("#div1").hide(5000);
	      			             //alert(data)
	      			             arr=data.split("#")
	      			             //alert(arr[0])
	      			            
	      			             document.getElementById("empname").value=arr[0]
	      			           document.getElementById("jobid").value=arr[1]
	      			           document.getElementById("gender").value=arr[2]
	      			             
	      			        });
	  });
	     });

</script>
<style>
.sh
{
margin-left: 100px;
}
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
				<a href="/dhsp/jsp/company_home.jsp"
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
			style="width: 30%; height: 600px; float: left; background-color: darkblue;">
			<%@include file="/WEB-INF/companymenu.jsp"%>
		</div>

		<div style="width: 70%; height: 600px; float: left;">
		<div
				style="background-color: #f2f2f2; width: 80%; height: 400px; border-radius: 4px;margin-left :80px;margin-right:80px;
				 margin-top: 50px; padding-top: 30px; padding-left: 15px;">
				<h1
					style="margin-left: 200px; font-family: Georgia; font-weight: bold; color: navy;">
					Delete Employee</h1>
					<%
					String str="select * from employee_details where CompanyId=?"; 
					 ResultSet rs= CrudOperation.fetchData(str,userid);%>
					 <form action="/dhsp/Deleteitem" method="post">
					
					<table class="sh">
					<tr><th>Employee Id</th><th><select id="cmbid" name="empid"><option value="default">Select</option>
					<% while(rs.next())
						{%>
					<option value="<%=rs.getString("EmpId") %>" id="empid"><%=rs.getString("EmpId")%></option>
					<%}
					%>
					</select></th>
					<tr><th>Employee Name</th><th><input type="text" id="empname"></th></tr>
					<tr><th>Job ID</th><th><input type="text" id="jobid" name=""></th></tr>
					<tr><th>Gender</th><th><input type="text" id="gender"></th></tr>
					<tr><th colspan="2"><button style="width: 50%; background-color: #4CAF50;color: white;padding: 10px 16px;margin-left:140px; border: none;
					 border-radius: 4px;
 cursor: pointer;">Delete</button>
					
					</table>
					</form>
					
					</div>
		
		
		
</div>

</body>
</html>