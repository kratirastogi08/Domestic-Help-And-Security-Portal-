<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Registration</title>
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
      $("#txtid").blur( //event generated
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

		var id = document.getElementById("txtid").value;
		var pass = document.getElementById("txtpass").value;
		
		var name = document.getElementById("txtname").value;
	 	var address = document.getElementById("address").value;
		var num = document.getElementById("txtnum").value;
		var email = document.getElementById("txtemail").value;
		var gendermale =document.getElementById("gendermale").checked;
		var genderfemale =document.getElementById("genderfemale").checked;
		
		var b = true
		var c=true

		if (checkEmpty(id) == false) {

			document.getElementById("msgid").innerHTML = "enter id"
			document.getElementById("txtid").focus()
			b = false

		}

		if (checkEmpty(pass) == false) {

			document.getElementById("msgpass").innerHTML = "enter password"
			document.getElementById("txtpass").focus()
			b = false
            c=false
		} 
		if(c)
			{
		 if(checkLength(pass)==false)
		{

			document.getElementById("msgpass").innerHTML = "password must be greater than 8 character"
			document.getElementById("txtpass").focus()
			b=false

		
		}}
		if (checkEmpty(name) == false) {

			document.getElementById("msgname").innerHTML = "enter company name"
			document.getElementById("txtname").focus()
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
		 
		
		
		if (checkEmpty(address) == false) {

			document.getElementById("msgadd").innerHTML = "enter adress"
			document.getElementById("address").focus()
		b=false
		} 
		 if(gendermale==false&&genderfemale==false)
			{
			
			document.getElementById("msggender").innerHTML="select gender"
				
				b=false
			
			}
		 
		return b
 }
</script>
</head>
<body>
	 <%@include file="/WEB-INF/homemenu.html"%>
	
	
	<div
		style="margin-left: 150px; background-color: #f2f2f2; width: 80%; height: 700px; margin-top: 50px; border-radius: 10px;">
		<div
			style="margin-left: 300px; height: 40px;">
			<h1>Registration Form For Client</h1>
		</div>

		<div style="margin-top: 40px;">
		<form action="/dhsp/ClientRegistration" method="post" onsubmit="return main()">
			<table>
				<tr>
					<th>User Id</th>
					<th><input type="text" name="txtid" id="txtid"></th>
					<td><span id="msgid" style="color: red;"></span></td>
				</tr>
				<tr>
					<th>Password</th>
					<th><input type="password" name="txtpass" id="txtpass"></th>
					<td><span id="msgpass" style="color: red;"></span></td>
				</tr>
				<tr>
					<th> Name</th>
					<th><input type="text" name="txtname" id="txtname"></th>
					<td><span id="msgname" style="color: red;"></span></td>
				</tr>

				
				<tr><th>Address</th><th><textarea rows="3" cols="25" name="address" id="address"></textarea></th>
				<td><span id="msgadd" style="color: red;"></span></td>
				</tr>
					<tr><th>Contact No.</th><th><input type="number" name="txtnum" id="txtnum"></th>
					<td><span id="msgnum" style="color: red;"></span></td>
					</tr>
					<tr>
					<th> Email</th>
					<th><input type="email" name="txtemail" id="txtemail"></th>
					<td><span id="msgemail" style="color: red;"></span></td>
				</tr>
				<tr>
					<th>Gender</th>
					<th><input type="radio" id="gendermale" name="gender" value="male">Male
						<input type="radio" id="genderfemale" name="gender" value="female">Female</th>
						<td><span id="msggender" style="color: red;"></span></td>
				</tr>
					
					
					<tr><th colspan="7"><input type="submit"></th></tr>
					
			</table></form>
		</div>
	</div>
	
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>