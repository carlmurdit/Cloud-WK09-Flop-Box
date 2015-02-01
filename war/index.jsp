<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>


<%BlobstoreService blobstoreService =
BlobstoreServiceFactory.getBlobstoreService(); %>
<html>
	<head>
		<title>Upload Test</title>
	</head>
	<body>
	
	<%
	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
	
	String url = userService.createLoginURL(request.getRequestURI());
	String urlLinktext = "Login";
	
	            
	if (user != null){
	    url = userService.createLogoutURL(request.getRequestURI());
	    urlLinktext = "Logout";
	    
	}	    
	%>
	
	<div style="float: right;"><a href="<%=url%>"><%=urlLinktext%></a> <%=(user==null? "" : user.getNickname())%></div>
	
	
		<br>
	
		<% request.setAttribute("empid", "1234"); %>
		<!--jsp:include page="/servlet/WK09_FlopboxServlet?user=Smith" flush="true"/-->
		
		<form action="<%= blobstoreService.createUploadUrl("/Upload") %>"
			method="post" enctype="multipart/form-data">
			<input type="text" name="foo">
			<input type="file" name="myFile">
			<input type="submit" value="Submit">
		</form>
	</body>
</html>