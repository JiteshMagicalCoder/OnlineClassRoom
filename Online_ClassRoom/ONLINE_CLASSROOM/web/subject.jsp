<%-- 
    Document   : addsubject
    Created on : Feb 11, 2016, 3:00:56 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD SUBJECT</title>
    </head>
    <body background="background.jpg">
        <br><br>
    <center>
        <table>
                <form action="Subject" method="post" >
                    Subject Name: &nbsp;&nbsp;<input type="text" name="subname" required=""> &nbsp;&nbsp;
                    <input type="submit" name="choose" value="ADD" >
                    <input type="submit" name="choose" value="Delete">

                </form>
        </table>
    </center>
       
        <%
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from subject");
                ResultSet rs = st.executeQuery();
                out.println("<br><br><br>");
                out.println("<center>");
                out.println("<table border=\"1\" bgcolor=\"cyan\" height=\"50\" width=\"400\">");
                out.println("<tr>");
                out.println("<th>");
                out.println("S NO");
                out.println("</th>");
                out.println("<th>");
                out.println("SUBJECT");
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
                    out.println(rs.getString("SubjectName"));
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
