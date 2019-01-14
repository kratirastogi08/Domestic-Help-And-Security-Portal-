<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="dhsp.dbtasks.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.css">
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/popper.min.js"></script>
<link rel="stylesheet" href="/dhsp/css/forstyle.css" type="text/css">
<script src="/dhsp/js/validation.js"></script>
<script>
  
  $(document).ready(function()
  		
  		{
      $("#comid").blur( //event generated
      		function(){
      			var ui=this.value;
       
      			 $.get("/dhsp/Check",
      			        {
      			          userid:ui
      			          
      			        },
      			        function(data,status){
      			        	
      			             $("#msgid").html(data);
      			          });
      			
      });
  });
  
</script>
<script>
	function main() {

		var id = document.getElementById("comid").value;
		var pass = document.getElementById("compass").value;
		 var  comname= document.getElementById("comname").value;

		var resno = document.getElementById("txtresno").value;

		
		var num = document.getElementById("txtnum").value;
		var email = document.getElementById("txtemail").value;
		var name = document.getElementById("name").value;
		var address = document.getElementById("address").value;
		var city = document.getElementById("area").value;
		 
		var b = true
		var c=true

		if (checkEmpty(id) == false) {

			document.getElementById("msgid").innerHTML = "enter id"
			document.getElementById("comid").focus()
			b = false

		}

		if (checkEmpty(pass) == false) {

			document.getElementById("msgpass").innerHTML = "enter password"
			document.getElementById("compass").focus()
			b = false
           // c=false
		} 
		/* if(c)
			{ */
		 if(checkLength(pass)==false)
		{

			document.getElementById("msgpass").innerHTML = "password must be greater than 8 character"
			document.getElementById("compass").focus()
			b=false

		
		}
		if (checkEmpty(comname) == false) {

			document.getElementById("msgcomname").innerHTML = "enter company name"
			document.getElementById("comname").focus()
		b=false
		}
		
		if (checkEmpty(resno) == false) {

			document.getElementById("msgresno").innerHTML = "enter your registration"
			document.getElementById("txtresno").focus()
			b=false

		}
		
		
		if (checkEmpty(num) == false) {

			document.getElementById("msgnum").innerHTML = "enter phone no."
			document.getElementById("txtnum").focus()
		b=false
		}
		 
		if (checkEmpty(email) == false) {

			document.getElementById("msgemail").innerHTML = "enter email"
			document.getElementById("txtemail").focus()
		b=false
		}
		 
		
		if (checkEmpty(name) == false) {

			document.getElementById("msgname").innerHTML = "enter name"
			document.getElementById("name").focus()
		b=false
		}
		if (checkEmpty(address) == false) {

			document.getElementById("msgadd").innerHTML = "enter adress"
			document.getElementById("address").focus()
		b=false
		}
		if(checkCombo(city)==false)
		{
		
		document.getElementById("cmb").innerHTML="nothing selected"
			b=false;
		}
		return b
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/homemenu.html"%>
	<div
		style="margin-left: 150px; width: 80%; height: 1000px; margin-top: 50px; border-radius: 10px;background-color: #f2f2f2;">
		
		<div
			style="margin-left: 300px; height: 40px; ">
			<h1>Registration Form For Company</h1>
		</div>

		<div style="margin-top: 40px;">
			<form action="/dhsp/CompanyRes" method="post"
				onsubmit="return main()">
				<table>
					<tr>
						<th>Company Id</th>
						<th><input type="text" name="comid" id="comid"></th>
						<td><span id="msgid" style="color: red;"></span></td>
					</tr>
					<tr>
						<th>Create Password</th>
						<th><input type="password" name="compass" id="compass"></th>
						<td><span id="msgpass" style="color: red;"></span></td>
					</tr>
					<tr>
						<th>Company Name</th>
						<th><input type="text" name="comname" id="comname"></th>
						<td><span id="msgcomname" style="color: red;"></span></td>
					</tr>

					<tr>
						<th>Registration Number</th>
						<th><input type="text" name="txtresno" id="txtresno"></th>
						<td><span id="msgresno" style="color: red;"></span></td>
					</tr>
					<tr>
						<th>Area of Work</th>
						<th><select id="area" name="area">
						<option value=default>Select city</option>
								<option value="lko">Lucknow</option>
								<option value="banglore">Bangluru</option>
								<option value="pune">Pune</option>
								<option value="mumbai">Mumbai</option>

						</select></th>
						
						<td><span id="cmb" style="color: red;"></span></td></tr>
					

					<tr>
						<th>Contact No.</th>
						<th><input type="number" name="txtnum" id="txtnum"></th>
						<td><span id="msgnum" style="color: red;"></span></td>
					</tr>
					<tr>
						<th>Email</th>
						<th><input type="email" name="txtemail" id="txtemail">
						</th>
						<td><span id="msgemail" style="color: red;"></span></td>
					</tr>
					<tr>
						<th>OwnerName</th>
						<th><input type="text" name="name" id="name"></th>
						<td><span id="msgname" style="color: red;"></span></td>
					</tr>
					<tr>
						<th>Address</th>
						<th><textarea rows="3" cols="25" name="address" id="address"></textarea></th>
						<td><span id="msgadd" style="color: red;"></span></td>
					</tr>

					<tr>
						<th colspan="9"><input type="submit"></th>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>