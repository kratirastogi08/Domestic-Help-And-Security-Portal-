<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="dhsp.dbtasks.*,java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Employee</title>

<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/style.css" type="text/css">
<script src="/dhsp/js/validation.js"></script>
<script>
  
  $(document).ready(function()
  		
  		{
      $("#empid").blur( //event generated
      		function(){
      			var ui=this.value;
       
      			 $.get("/dhsp/Checkemp",
      			        {
      			          userid:ui
      			          
      			        },
      			        function(data,status){
      			        	
      			             $("#msgempid").html(data);
      			          
        			          });
        			
        });
  });
  
</script>


<script>
	function main() {
		var eid = document.getElementById("empid").value;
		var name = document.getElementById("empname").value;
		var date = document.getElementById("date").value;
		var jobid = document.getElementById("jobid").value;
		var num = document.getElementById("num").value;
		var exp = document.getElementById("exp").value;
		var gendermale =document.getElementById("gendermale").checked;
		var genderfemale =document.getElementById("genderfemale").checked;
		var add = document.getElementById("address").value;
	
		
		//alert(date)
         
		var b = true
		if (checkEmpty(add) == false) {

			document.getElementById("msgaddress").innerHTML = "enter address"
			document.getElementById("address").focus()
			b = false

		}
   
		if (checkEmpty(eid) == false) {

			document.getElementById("msgempid").innerHTML = "enter employee-id"
			document.getElementById("empid").focus()
			b = false

		}
		if (checkEmpty(name) == false) {

			document.getElementById("msgempname").innerHTML = "enter name"
			document.getElementById("empname").focus()
			b = false

		}
		 if (checkEmpty(date) == false) {

			document.getElementById("msgdate").innerHTML = "select date"
			document.getElementById("date").focus()
			b = false

		} 
		if(getAge(date)<18)
			{
			document.getElementById("msgdate").innerHTML = " not eligible"
				document.getElementById("date").focus()
				b = false
			}
		if (checkEmpty(jobid) == false) {

			document.getElementById("msgjobid").innerHTML = "enter job-id"
			document.getElementById("jobid").focus()
			b = false

		}
		if (checkEmpty(exp) == false) {

			document.getElementById("msgexp").innerHTML = "enter experience"
			document.getElementById("exp").focus()
			b = false

		}
		if (checkEmpty(num) == false) {

			document.getElementById("msgnum").innerHTML = "enter number"
			document.getElementById("num").focus()
			b = false

		}
		 if(gendermale==false&&genderfemale==false)
			{
			
			document.getElementById("msggen").innerHTML="select gender"
				
				b=false
			
			}
		 

		return b

	}
</script> 

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
			style="width: 25%; height: 620px; float: left; background-color: darkblue;">
			<%@include file="/WEB-INF/companymenu.jsp"%>
		</div>

		<div style="width: 75%; height: 620px; float: left;">

			<div
				style="background-color: #f2f2f2; width: 90%; height: 580px; border-radius: 4px;margin-left :50px;
				 margin-top: 30px; padding-top: 10px; padding-left: 15px;">
				<h1
					style="margin-left: 250px; font-family: Georgia; font-weight: bold; color: navy;">
					Employee Details</h1>
					
        <form action="/dhsp/AddEmployee" method="post"  enctype="multipart/form-data" onsubmit="return main()" >
				<table style="margin-left: 50px;">
					<tr>
						<th>Employee Id</th>
						<th><input type="text" id="empid" name="empid"></th>
						<td><span id="msgempid" style="color: red;"></span></td>
					
						
						<th>Employee Name</th>
						<th><input type="text" id="empname" name="empname"></th>
						<td><span id="msgempname" style="color: red;"></span></td></tr>
						<tr>
					
						<th>Date of Birth</th>
						<th><input type="date" id="date" name="date" ></th>
				        <td><span id="msgdate" style="color: red;"></span></td>
				        
				       
				     <% String str="select * from job where CompId=?";
				     ResultSet rs =CrudOperation.fetchData(str,userid);
				               %>
						<th>Job Id</th><th>
						 <select name="combjobid" ><option value=default>Select JobId</option>
						<% while(rs.next())
							{ %>
						
						 <option value="<%=rs.getString("JobId") %>"><%=rs.getString("JobName") %></option>
				      <%}
						rs.close();%>
				      </select> </th> 
						<td><span id="msgjobid" style="color: red;"></span></td></tr>
						<tr>
					
						<th>Experience</th>
						<th><input type="number" id="exp" name="exp"
							placeholder="(years)"></th>
						<td><span id="msgexp" style="color: red;"></span></td>
						<th>Contact No.</th>
						<th><input type="number" id="num" name="num"></th>
						<td><span id="msgnum" style="color: red;"></span></td>
					</tr>
					<tr>
						<th>Gender</th>
						<th><input type="radio" name="gender" value="male"
							id="gendermale">Male</th>
						<th><input type="radio" name="gender" value="female" style="margin-right: 50px"
							id="genderfemale">Female</th>
						<td><span id="msggen" style="color: red;"></span></td>
					<tr>
						<th>Address</th>
						<th><textarea cols="8" rows="3" id="address" name="address"></textarea></th>
						<td><span id="msgaddress" style="color: red;"></span></td>
					</tr>
					<tr>
						<th>Photo</th>
						<th><input type="file" name="photo" ></th>
					</tr>
					<tr><th colspan="4"><input type="submit" style="margin-left: 70px;margin-top: 20px"></th></tr>


				</table>
	</form>
	</div>
	</div>
	<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>