<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="connexus.Stream" %>
<%@ page import="connexus.ConnexusImage" %>
<%@ page import="connexus.OfyService" %>
<%@ page import="java.util.Collections" %>

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Connexus</title>
  </head>

  <body>
    <h2>Connexus</h2>
      <tr>
        <td style="font-size: 14pt; color: blue"><a href="Manage.jsp">Manage</a></td> <td>  |  </td>
        <td><a href="Create.jsp">Create</a></td></td> <td>  |  </td>
        <td><a href="View.jsp">View</a></td></td> <td>  |  </td>
        <td><a href="Search.jsp">Search</a></td></td> <td>  |  </td>
        <td><a href="Trending.jsp">Trending</a></td></td> <td>  |  </td>
        <td><a href="Social.jsp">Social</a></td></td>
                 <td>*******</td>
        <%
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        if (user != null) {
        pageContext.setAttribute("user", user);
        %>
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a></td>
<%
    } else {
%>
<td>
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a></td>
<%
    }
%>
      </tr>
       <br>
      
      <p style="font-weight:bold;font-size:16;">Manage..</p>
      
      <p style="font-size:20;">Streams I own (<%= user.getNickname() %>)</p>
      <form action="manage" method="get" enctype="multipart/formdata">
      <table border="1">
      <tr>
      <th>Name</th><th>Last New</th><th>Number of Picture</th><th>Delete</th>      
      </tr>
      
<%
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		for (Stream s : th ) {
		if (s.useremail.equals(user.getNickname())){
		  System.out.println("s = " + s);
		  Long streamId = s.id;
		  int i = 0;
		  Long a = null; String b = "0";
		  ConnexusImage da = new ConnexusImage(a, b, b, b);
		  da.createDate = s.createDate;
		  List<ConnexusImage> images = OfyService.ofy().load().type(ConnexusImage.class).list();
		Collections.sort(images);
		for ( ConnexusImage img : images ) {
		    if ( img.streamId.equals(streamId) ) {
		    i = i + 1;
		    if (da.compareTo(img)<1)
		    da.createDate = img.createDate;
		    }
		    }
		  %>
		  <tr>
          <td><%= s.name %></td><td><%= da.createDate %></td><td><%= i %></td><td><input type="checkbox" name="check" value=<%= s.name %>></td>
		  <tr>
<% 
}
}
%>

      </table>
      <input type="submit" value="Delete Checked">
      <p style="display:none;"><input type="checkbox" name="check" value="bugFix" checked><p>
      </form>
      

  </body>
</html>
