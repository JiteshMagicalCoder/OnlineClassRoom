<%-- 
    Document   : view_report
    Created on : Feb 15, 2016, 10:46:21 PM
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
    <body background="background.jpg">
    <center>
        <h1><font color="Red">YOUR REPORTS</font></h1>
    </center>
    <%
            String mail = session.getAttribute("emailid").toString();
            String username=session.getAttribute("username").toString();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from reports where UserName=?");
               st.setString(1, username);
                ResultSet rs = st.executeQuery();
                out.println("<br><br><br>");
                out.println("<center>");
                out.println("<table border=\"1\" bgcolor=\"cyan\" height=\"50\" width=\"1000\">");
                out.println("<tr>");
                out.println("<th>");
                out.println("S NO");
                out.println("</th>");
                out.println("<th>");
                out.println("SUBJECT");
                out.println("</th>");
                out.println("<th>");
                out.println("Total Question");
                out.println("</th>");
                out.println("<th>");
                out.println("Correct");
                out.println("</th>");
                out.println("<th>");
                out.println("Score");
                out.println("</th>");
                out.println("<th>");
                out.println("Date of Exam");
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
                    out.println(rs.getString("ExamName"));
                    out.println("</td>");

                    out.println("<td>");
                    out.println("<center>");
                    out.println(rs.getString("TotalQuestions"));
                    out.println("</center>");

                    out.println("</td>");
                    out.println("<td>");
                    out.println("<center>");

                    out.println(rs.getString("CorrectAnswers"));
                    out.println("</center>");

                    out.println("</td>");
                    out.println("<td>");
                    out.println("<center>");

                    out.println(rs.getString("Score"));
                    out.println("</td>");
                    out.println("</center>");

                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("ExamDate"));
                    out.println("</td>");

                    out.println("</tr>");
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
</body>
</html>
