<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*,dhsp.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<script>
  
  $(document).ready(function()
  		
  		{
      $("#rid").blur( //event generated
      		function(){
    	  
      			var ui=this.value;
       
      			 $.get("/dhsp/Composecheck",
      			        {
      			          userid:ui
      			          
      			        },
      			        function(data,status){
      			        	//alert(data)
      			        	if(data!=null)
      			             $("#msgrid").html(data);
      			          });
      			
      });
  });
  
</script>
<body>
<%
HttpSession hs=request.getSession(false);
String userid=(String)hs.getAttribute("userkey"); %>
<ul style="list-style-type:square;display: block; margin-top: 20px; " >
<li style="color: white;margin-left: 20px;">
<a href="/dhsp/jsp/addemployee.jsp" style="color: white;font-size: 20px;font-family: Georgia;text-decoration: none;
margin-left: 40px" >Add Employee</a></li>
<li style="color: white;margin-left: 20px; margin-top: 15px;">
<a href="#mymodal" data-toggle="modal" data-target="#myModalNorm" style="color: white;font-size: 20px;
font-family: Georgia;text-decoration: none;margin-left: 40px" >Compose</a>


<!-- Modal -->
<div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title" style=" color: black;margin-top: 20px;font-size: 20px">Compose</h4>
            <button type="button" class="close" data-dismiss="modal" style="margin-top: 20px">&times;</button>
      
               
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form role="form" action="/dhsp/Compose" method="post">
                  <div class="form-group">
                    <label for="sid" style="color: black">Sender Address</label>
                   
                      <input type="email" class="form-control" value="<%=userid%>" readonly="readonly"
                      id="sid" name="sid"  />
                  </div>
                  <div class="form-group">
                    <label for="rid" style="color: black">Receiver Address</label>
                      <input type="text" class="form-control"  required="required" 
                      id="rid" name="rid" placeholder="Enter email address"/>
                      <br
                      >
                      <span id="msgrid" style="color: red;"></span>
                      </br>
                  </div>
                  <div class="form-group">
                    <label for="subject" style="color: black">Subject</label>
                      <input type="text" class="form-control" required="required"
                      id="subject" name="subject" placeholder="Enter subject"/>
                  </div>
                  <div class="form-group">
                    <label for="msg" style="color: black">Message</label>
                      <textarea rows="5" cols="10" class="form-control"
                      id="msg" name="msg" placeholder="Type message" required="required"></textarea>
                  </div>
                
                 
                  <button type="submit" class="btn btn-primary" style="font-size: 20px;margin-left: 200px;font-family: serif;">Submit</button>
                </form>
                
                
            </div>
            
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                            Close
                </button>
              
            </div>
        </div>
    </div>
</div></li>
<li style="color: white;margin-left: 20px;margin-top: 10px">
<a href="/dhsp/jsp/inbox.jsp" style="color: white;font-size: 20px;font-family: Georgia;text-decoration: none;
margin-left: 40px" >Inbox</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/sentitem.jsp" style="color: white;font-size: 20px;font-family: Georgia;text-decoration: none;margin-left: 40px" >Sent Item</a></li>

<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/viewemployee.jsp" style="color: white;font-size: 20px;font-family: Georgia;
text-decoration: none;margin-left: 40px" >View Employee</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/deleteemployee.jsp" style="color: white;font-size: 20px;font-family: Georgia;
text-decoration: none;margin-left: 40px" >Delete Employee</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/viewfeedback.jsp" style="color: white;font-size: 20px;font-family: Georgia;
text-decoration: none;margin-left: 40px" >View Feedback</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/job.jsp" style="color: white;font-size: 20px;font-family: Georgia;
text-decoration: none;margin-left: 40px" >Add Job</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/updateemployee.jsp" style="color: white;font-size: 20px;font-family: Georgia;
text-decoration: none;margin-left: 40px" >Update Employee</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/response.jsp" style="color: white;font-size: 20px;font-family: Georgia;
text-decoration: none;margin-left: 40px" >Service Response</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/showjob.jsp" style="color: white;font-size: 20px;font-family: Georgia;
text-decoration: none;margin-left: 40px" >Show Job</a></li>
</ul>
</body>
</html>