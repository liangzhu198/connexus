<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="connexus.Stream" %>
<%@ page import="connexus.OfyService" %>
<%@ page import="connexus.ConnexusImage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Connexus</title>
  </head>

  <body>
    <h2>Connexus</h2>
      <tr>
        <td><a href="Manage.jsp">Manage</a></td> <td>  |  </td>
        <td><a href="Create.jsp">Create</a></td></td> <td>  |  </td>
        <td><a href="View.jsp">View</a></td></td> <td>  |  </td>
        <td><a href="Search.jsp">Search</a></td></td> <td>  |  </td>
        <td><a href="Trending.jsp">Trending</a></td></td> <td>  |  </td>
        <td><a href="Social.jsp">Social</a></td></td>
      </tr>
      <br>
      <p style="font-weight:bold;font-size:16;">View..</p>
      
<%
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		Long streamId = new Long(request.getParameter("streamId"));
		String streamName = request.getParameter("streamName");
		out.println(streamName);
%>
        <br>
<%
		List<ConnexusImage> images = OfyService.ofy().load().type(ConnexusImage.class).list();
		Collections.sort(images);
		for ( ConnexusImage img : images ) {
		    if ( img.streamId.equals(streamId) ) {
     		  out.println("<img src=\"" + img.bkUrl + "\">"); // better to not use println for html output, use templating instead
     		}
     	 }
%>

<!-- APT: note how we are adding additional parameters when we create the uploadurl - this way blobstore service
     can pass them on to the upload servlet, so upload knows which stream the image blob corresponds to -->

	<form action="<%= blobstoreService.createUploadUrl("/upload?streamId=" 
			+ streamId + "&streamName=" + streamName) %>" 
			method = "post" enctype="multipart/form-data">
	     <input type="file" name="myFile"><br> <input type="submit" value="Submit">
   </form>
   <h4>Upload your images</h4>
  </body>
</html>
