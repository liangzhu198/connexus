<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
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
      <tr>
      <p style="font-weight:bold;font-size:16;">Create..</p>
      </tr>
      <br>
      <br>
        <form name="create" action="create"
		method="get">
		<p>streamName:<input type="text" name="streamName"></p>
		<p>streamTag: <input type="text" name="tags"></p>
		<p>streamUrl: <input type="text" name="url"></p>
	    <p>useremail: <input type="text" name="useremail" value="<%= user.getNickname() %>"></p>
		<input type="submit" value="Create Stream">
	</form>
  </body>
</html>
