<%-- 
    Document   : discussionform
    Created on : Feb 21, 2016, 8:23:06 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discussion form</title>
    </head>
    <body>
         <center>
             <h2><font color="red">Student Queries </font></h2>
    </center>
        </center>
          <%
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from problems");
                ResultSet rs = st.executeQuery();
                out.println("<center>");
                out.println("<table border=\"1\" bgcolor=\"cyan\" height=\"50\" width=\"1000\">");
                out.println("<tr>");
                out.println("<th>");
                out.println("S NO");
                out.println("</th>");
                out.println("<th>");
                out.println("Student Name");
                out.println("</th>");
                 out.println("<th>");
                out.println("Email Id");
                out.println("</th>");
                 out.println("<th>");
                out.println("Query");
               
                int i=1;
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("<center>");
                    out.println(i);
                    out.println("</center>");
                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("name"));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("email_id"));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("question"));
                    out.println("</td>"); 
                 
                    i++;
                }
                
          } catch (Exception e) {
                System.out.println(e);
            }
      %>
  </table>
<footer>
    <hr>
 <a href="AdminHome.jsp"><Button >Back</Button> </a>
</footer>

    </body>
</html>
