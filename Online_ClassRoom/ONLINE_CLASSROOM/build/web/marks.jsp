<%-- 
    Document   : marks
    Created on : Mar 3, 2016, 9:32:03 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id=request.getParameter("sid").toString();
            int marks =Integer.parseInt(request.getParameter("marks"));
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st1 = con1.prepareStatement("update assignmentsresponse set Marks =? where StudentId=?");
            st1.setInt(1, marks);
            st1.setString(2, id);
            int x =st1.executeUpdate();
            if(x==1)
            {
                out.println("marks given successfully");
            }
            
             
        %>
    </body>
</html>
