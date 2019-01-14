<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,dhsp.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company Verification</title>
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
<a href="/dhsp/jsp/admin_home.jsp" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana;margin-top: 20px ">HOME</a>
</div>
<div style="float: left;width: 3%;height: 35px;margin-left: 60px;margin-top: 10px;">
<img  src="/dhsp/images/logout.png" style="width: 100%;height: 100%;">
</div>
<div style="float: left;width: 3%;height: 30px;margin-top: 15px;margin-left:10px;">
<a href="/dhsp/Logoff" style="text-decoration: none;color: white;font-size: 20px;font-family:Verdana">LOGOUT</a>
</div>

 </div>
 <div style="background-color: darkblue;width: 30%;height: 600px;float: left;">
<%@include file="/WEB-INF/adminmenu.jsp" %>
<div style="width: 100%;height: 180px;background-color: darkblue;float: left;margin-top: 20px;">
<%@include file="/WEB-INF/bootstrapdemo.html" %></div>
</div>
<div style="width: 70%;height: 600px;background-image:url('/dhsp/images/des.jpg');float: left;">
<div
				style="background-color: #f2f2f2; width: 90%; height: 500px; border-radius: 4px;margin-left :40px;margin-right:120px;
				 margin-top: 30px; padding-top: 30px; padding-left: 15px;overflow:auto;">
				<h1
					style=" font-family: Georgia; font-weight: bold;color: navy;text-align: center">
					Company Verification</h1> 
<% 
String sql="Select * from login_details where Status='false'";
ResultSet resultSet=CrudOperation.fetchData(sql);
%>
 <table border="2" style=" margin-top: 40px; border-radius: 5px;margin-right: 10px;background-color: white;width: 90%;text-align: center;margin-left: 30px;">
<tr><th class="heading">CompanyId</th><th class="heading">Status</th><th class="heading">RegistrationNo</th></tr>
<% 

while(resultSet.next())
	{ String usertype=resultSet.getString("Usertype");
	if(usertype.equalsIgnoreCase("company"))
	{String id=resultSet.getString("Id");
	%>
<tr><th>
<% 
String string="Select * from company_details where CompanyId=?";
ResultSet rSet=CrudOperation.fetchData(string,id);
if(rSet.next())
{ String cid=rSet.getString("CompanyId");
String cnm=rSet.getString("Compname");
String reg=rSet.getString("Registrationno");


%>

<a href="#mymodal2?compid=<%=cid %>" href="" data-toggle="modal" data-target="#myModalNorm2" class="txt"><%=resultSet.getString("Id") %></a >

<div class="modal fade" id="myModalNorm2" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title" style=" color: black;margin-top: 20px;font-size: 20px">Company Verification</h4>
            <button type="button" class="close" data-dismiss="modal" style="margin-top: 20px">&times;</button>
      
               
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form role="form" action="/dhsp/Updatecompany" method="post">
                  
                  <div class="form-group">
                    <label for="compid" style="color: black;margin-right:450px">CompanyId</label>
                    
                      <input type="text" class="form-control" value="<%=cid %>" readonly="readonly"
                      id="compid" name="compid"/>
                  </div>
                  <div class="form-group">
                    <label for="name" style="color: black;margin-right:450px">CompanyName</label>
                      <input type="text" class="form-control" value="<%=cnm %>" readonly="readonly"
                      id="name" name="name" >
                  </div>
                   <div class="form-group">
                    <label for="reg" style="color: black;margin-right:450px">RegistrationNo</label>
                      <input type="text" class="form-control" value="<%=reg %>" readonly="readonly"
                      id="reg" name="reg"/>
                  </div>
                  
                 <div class="form-group">
                    <label for="status" style="color: black;margin-right:450px">Status</label>
                      <input type="text" class="form-control"
                      id="status" name="status"/>
                  </div>
                 
                  <button type="submit" class="btn btn-primary" style="font-size: 20px;margin-left: 20px;font-family: serif;">Submit</button>
                </form>
                
                
            </div>
            
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                            Close
                </button>
                <button type="button" class="btn btn-primary">
                    Save changes
                </button>
            </div>
        </div>
    </div>
</div>
</th>
<th class="txt"><%=resultSet.getString("Status") %></th>
<%
String str="select Registrationno from company_details where CompanyId=?";

ResultSet resultSet2=CrudOperation.fetchData(str, id);
if(resultSet2.next())
{
%>
<th class="txt"><%=resultSet2.getString("Registrationno") %></th>
</tr>

<%}
}
	}
	}
resultSet.close();%>
</table>
</div>
</div>
<script src="/dhsp/bootstrap/bootstrapfiles/jquery-3.3.1.min.js"></script>
<script src="/dhsp/bootstrap/bootstrapfiles/bootstrap.min.js"></script>
</body>
</html>