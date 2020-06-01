<%-- 
    Document   : watch_vedio
    Created on : Feb 16, 2016, 11:01:01 PM
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
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from videos");
                ResultSet rs = st.executeQuery();
                out.println("<br><br><br>");
                out.println("<center>");
                out.println("<table border=\"1\" bgcolor=\"cyan\" height=\"50\" width=\"600\">");
                out.println("<tr>");
                out.println("<th>");
                out.println("S NO");
                out.println("</th>");
                out.println("<th>");
                out.println("SUBJECT");
                out.println("</th>");
                out.println("<th>");
                out.println("TOPIC");
                out.println("</th>");
                out.println("<th>");
                out.println("VIDEO URL");
                out.println("</th>");
                out.println("</tr>");
                int i = 1;
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("<center>");
                    out.println(i);
                    out.println("</center>");
                    out.println("</td>");
                    out.println("<td>");
                    out.println("<center>");
                    out.println(rs.getString("subject"));
                    out.println("</center>");
                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("topic"));
                    out.println("</td>");
                    out.println("<td>");
                    String url = rs.getString("url");
                    out.println(url);
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<script>");
                    out.println("</script>");
                    i++;
                }
                out.println("</table>");
                out.println("<br><br><br>");
                out.println("Click Here to Student Home Page:<a href=\"studenthome.jsp\">click here</a>");

                out.println("</center>");

            } catch (Exception e) {
                System.out.println(e);
            }


        %>
        <hr>
    <center>
        <video width="400" height="400" controls>
            <source src="vedios/motivational.mp4" type="video/mp4" alt="videos">
            Your browser does not support the video tag.
        </video> 
    </center>

    </body>
</html>
