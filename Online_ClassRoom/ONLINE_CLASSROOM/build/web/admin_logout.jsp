<%-- 
    Document   : admin_logout
    Created on : Feb 21, 2016, 10:40:02 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          session.invalidate();
          response.sendRedirect("homepage.jsp");
        %>
    </body>
</html>
