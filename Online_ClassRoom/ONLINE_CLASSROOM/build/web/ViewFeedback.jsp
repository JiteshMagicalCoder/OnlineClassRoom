<%-- 
    Document   : ViewFeedback
    Created on : Feb 21, 2016, 8:05:39 PM
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
    <body >
    <center>
        <h2><font color="red"> FEEDBACK QUESTION </font></h2>
    </center>
          <%
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from feedbackquestion");
                ResultSet rs = st.executeQuery();
           
                out.println("<center>");
                out.println("<table border=\"1\" bgcolor=\"pink\" height=\"50\" width=\"600\">");
                out.println("<tr>");
                out.println("<th>");
                out.println("S NO");
                out.println("</th>");
                out.println("<th>");
                out.println("Question");
                out.println("</th>");
                out.println("</tr>");
                int i=1;
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("<center>");
                    out.println(i);
                    out.println("</center>");
                    out.println("</td>");
                     out.println("<td>");
                    out.println(rs.getString("Question"));
                    out.println("</td>");
                    i++;
                }
                
          } catch (Exception e) {
                System.out.println(e);
            }
      %>
</table>
<hr>
   <h2><font color="blue">STUDENT FEEDBACK </font></h2>
    </center>
          <%
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from feedbackresponse");
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
                out.println("Response1");
                out.println("</th>");
                out.println("<th>");
                out.println("Response2");
                out.println("</th>");
                 out.println("<th>");
                out.println("Response3");
                out.println("</th>");
                out.println("<th>");
                out.println("Response4");
                out.println("</th>");
                 out.println("<th>");
                out.println("Response5");
                out.println("</th>");
                out.println("<th>");
                out.println("Response6");
                out.println("</th>");
                 out.println("<th>");
                out.println("Response7");
                out.println("</th>");
                out.println("<th>");
                out.println("Response8");
                out.println("</th>");
                out.println("</tr>");
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
                    out.println(rs.getString("q1"));
                    out.println("</td>"); 
                    out.println("<td>");
                    out.println(rs.getString("q2"));
                    out.println("</td>"); 
                    out.println("<td>");
                    out.println(rs.getString("q3"));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("q4"));
                    out.println("</td>"); 
                    out.println("<td>");
                    out.println(rs.getString("q5"));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("q6"));
                    out.println("</td>"); 
                    out.println("<td>");
                    out.println(rs.getString("q7"));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("q8"));
                    out.println("</td>");
                    i++;
                }
                
          } catch (Exception e) {
                System.out.println(e);
            }
      %>
  </table>
<footer>
 <a href="AdminHome.jsp"><Button >Back</Button> </a>
</footer>

    </body>
</html>
