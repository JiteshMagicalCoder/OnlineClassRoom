<%-- 
    Document   : SearchQuestion
    Created on : Feb 16, 2016, 7:05:36 PM
    Author     : RAVI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Question</title>
    </head>
    <body background="background.jpg">
        <form action="SearchQuestion" method="post">
            <%
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclass", "root", "root");
                PreparedStatement st = con.prepareStatement("Select * from subject");
                ResultSet rs = st.executeQuery();
                out.print("<body bgcolor='pink'>");
                out.print("<br><br>");
                out.print("<center>");
                out.print("<h1>Search Question </h1>");
                out.print("<table>");
                out.print("<tr>");
                out.print("<td>");
                out.print("Choose Subject");
                out.print("</td>");
                out.print("<td>");
                out.print("<select name='sub'>");
                out.print("<option>");
                out.print("Select");
                out.print("</option>");
                while (rs.next()) {
                    out.print("<option>");
                    out.print(rs.getString("SubjectName"));
                    out.print("</option>");
                }
                out.print("</td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td>");
                out.print("</select>");
                out.print("Enter Question");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type='textArea' style='height: 50px; width: 400px'; name='question'");
                out.print("</td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td></td>");
                out.print("<td>");
                out.print("<input type='submit' value='Search'>");
                out.print("</td>");
                out.print("</tr>");
                out.print("</center>");
                out.print("</body>");
            %>
        </form>
    </body>
</html>
