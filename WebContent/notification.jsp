<%@page import="com.Notification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/css/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/notification.js"></script>
<title>Notification Management</title>
<style>
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h2 style="text-align:center">Notification Management</h2>
				<br>
				<form id="formNotification" name="formNotification" method="post" action="notification.jsp">
				  	Notification ID:
				  	<input id="notificationId" name="notificationId" type="text" 
				 	         class="form-control form-control-sm">
				  	<br> Account ID:
				  	<input id="accountId" name="accountId" type="text"
				         	 class="form-control form-control-sm">
				   	<br> Bill ID:
				   	<input id="billid" name="billid" type="text"
				           		class="form-control form-control-sm">
				   	<br> Amount to be paid :
				   	<input id="amountToBePaid" name="amountToBePaid" type="text"
				           	  class="form-control form-control-sm">
				    <br> Email:
				   	<input id="email" name="email" type="text"
				           		class="form-control form-control-sm">
				     <br>  Mobile Number:
				   	<input id="mobileNumber" name="mobileNumber" type="text"
				           		class="form-control form-control-sm">
				           		
				     <br>  Subject:
				   	<input id="subject" name="subject" type="text"
				           		class="form-control form-control-sm"> 
				     <br>  Message:
				   	<input id="massage" name="massage" type="text"
				           		class="form-control form-control-sm">      		
				    <br>  Date Notify:
				   	<input id="dateNotify" name="dateNotify" type="text"
				           		class="form-control form-control-sm">	
				    <br>  First Name:
				   	<input id="firstName" name="firstName" type="text"
				           		class="form-control form-control-sm">	       		
				       				       
				    <br>  NIC:
				   	<input id="nic" name="nic" type="text"
				           		class="form-control form-control-sm">       			
					
				   <br> 
				    <input id="btnSave" name="btnSave" type="button" value="Save"
				          class="btn btn-primary">
				    <input type="hidden" id="hidAppIDSave" name="hidAppIDSave" value="">
				  </form>
				  
				  <div id="alertSuccess" class="alert alert-success"></div>
				  <div id="alertError" class="alert alert-danger"></div>
				  
				  <br>
				  <div id = "divAppGrid">
				  <%
				  	Notification appObj = new Notification();
				    out.print(appObj.readNotification());
				  %>
				  </div>
			  </div>
		  </div>
	  </div>
</body>
</html>