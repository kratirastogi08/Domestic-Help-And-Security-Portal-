<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*,dhsp.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <!-- <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
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
  <style>
.dropbtn {
    background-color:darkblue;
    color: white;
     padding: 16px; 
    font-size: 20px;
    font-family:Georgia;
    border:none;
    margin-left: 25px;
    margin-top: 10px;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: black;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

/* .dropdown:hover .dropbtn {} */
</style>
</head>
<body>
<%
HttpSession hs=request.getSession(false);
String userid=(String)hs.getAttribute("userkey"); %>
<ul style="list-style-type:square;display: block " >
<li style="color: white;margin-left: 20px">
<div class="dropdown" >
  <button class="dropbtn">View Account</button>
  <div class="dropdown-content">
    <a href="/dhsp/jsp/viewcompanydetails.jsp">Company Details</a>
    <a href="/dhsp/jsp/viewclientdetails.jsp">Client Details</a>
    
  </div>
</div></li>
<li style="color: white;margin-left: 20px">
<a href="#mymodal" data-toggle="modal" data-target="#myModalNorm" style="color: white;font-size: 20px;font-family: Georgia;text-decoration: none;margin-left: 40px" >Compose</a>


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
                      id="sid" name="sid" />
                      
                     
                  </div>
                  <div class="form-group">
                    <label for="rid" style="color: black">Receiver Address</label>
                      <input type="email" class="form-control" required="required"
                      id="rid" name="rid" placeholder="Enter email address"/>
                      <span id="msgrid" style="color: red;"></span>
                  </div>
                  <div class="form-group">
                    <label for="subject" style="color: black">Subject</label>
                      <input type="text" class="form-control" required="required"
                      id="subject" name="subject" placeholder="Enter subject"/>
                  </div>
                  <div class="form-group">
                    <label for="msg" style="color: black">Message</label>
                      <textarea rows="5" cols="10" class="form-control" required="required"
                      id="msg" name="msg" placeholder="Type message"></textarea>
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
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/inboxadmin.jsp" style="color: white;font-size: 20px;font-family: Georgia;text-decoration: none;margin-left: 40px" >Inbox</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/sentitemadmin.jsp" style="color: white;font-size: 20px;font-family: Georgia;text-decoration: none;margin-left: 40px" >Sent Item</a></li>
<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="#mymodal1" data-toggle="modal" data-target="#myModalNorm1" style="color: white;font-size: 20px;font-family: Georgia;
text-decoration: none;margin-left: 40px" >Post News</a>


<!-- Modal -->
<div class="modal fade" id="myModalNorm1" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title" style=" color: black;margin-top: 20px;font-size: 20px">Post News</h4>
            <button type="button" class="close" data-dismiss="modal" style="margin-top: 20px">&times;</button>
      
               
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form role="form" action="/dhsp/Postnews" method="post">
                  
                  <div class="form-group">
                    <label for="subject" style="color: black">Subject</label>
                      <input type="text" class="form-control"
                      id="subject" name="subject" placeholder="Enter subject"/>
                  </div>
                  <div class="form-group">
                    <label for="news" style="color: black">Contents</label>
                      <textarea rows="5" cols="10" class="form-control"
                      id="news" name="news" placeholder="Type news"></textarea>
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

<li style="color: white;margin-left: 20px;margin-top: 15px">
<a href="/dhsp/jsp/companyverification.jsp" style="color: white;font-size: 20px;
font-family: Georgia;text-decoration: none;margin-left: 40px" >Company Verification</a></li>
</ul>
</body>
</html>