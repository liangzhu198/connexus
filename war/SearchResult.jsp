<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="connexus.Stream" %>
<%@ page import="connexus.OfyService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
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
      </tr>
      <br>

      <p style="font-weight:bold;font-size:16;">Search Results..</p>
      
          <%! int i = 0; %>
        <form name="search" action="search"
		method="get">
		<p>keyWords: <input type="text" name="keyWords"></p>
		<input type="submit" value="Search">
	</form>
      
<%
       String a = new String(request.getParameter("kw"));
        List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		for (Stream s : th ) {
		if (s.name.indexOf(a)>-1 || a.indexOf(s.name)>-1)
		{		
		System.out.println(s.name);
		i++;
%>
		 <tr><td> <img width="100" height="100" src="<%= s.coverImageUrl %>"> </td> 
		 <td><a href="ViewStream.jsp?streamId=<%= s.id %>&streamName=<%= s.name %>"> <%= i %>. <%= s.name %></a></td><tr>
<%
		  }
		}
		i = 0;
%>
  </body>
</html>
