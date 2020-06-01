<%-- 
    Document   : logout
    Created on : Feb 17, 2016, 8:44:15 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function noback()
            {
                window.history.forward(1);
                
            }
        </script>
       
    </head >
    <body onload="noback()">
        <%
          request.getSession().invalidate();
          response.sendRedirect("homepage.jsp");
        %>
    </body>
</html>
