<%-- 
    Document   : enrolled
    Created on : Mar 3, 2016, 2:36:59 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body background="background.jpg">

    <center>
        <h3> <font color="red">List Of Enrolled Candidate</font></h3>


    </center>
    <%! String fname = "",subject="";%>
    <% fname = session.getAttribute("fname").toString();
        Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
        PreparedStatement st2 = con2.prepareStatement("select * from subjectteacher where name=? ");
        st2.setString(1,fname);
        ResultSet rs =st2.executeQuery();
        while(rs.next())
        {
          subject=rs.getString("subject");
        }

    %>

    <%        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
              PreparedStatement st1 = con1.prepareStatement("select * from enroll where SubjectName=? ");
              st1.setString(1,subject);
        ResultSet rs1 = st1.executeQuery();
        out.print("<center>");

 

        out.print("<table border='1' bgcolor='pink' width='800'>");
        out.println("<caption>");
        out.println("List Of Enrolled Students");
        out.println("</caption>");
        out.print("<th>");
        out.print("S No:");
        out.print("</th>");
        out.print("<th>");
        out.print("Name");
        out.print("</th>");
        out.print("<th>");
        out.print("Student Id");
        out.println("</th>");
        out.print("<th>");
        out.print("Email Id");
        out.print("</th>");
      
        
        int i = 1;
        while (rs1.next()) {
            out.print("<tr>");
            out.print("<td>");
            out.print(i);
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("StudentName"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("StudentId"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("EmailId"));
            out.print("</td>");
           

            out.print("</tr>");
            i++;
        }
        con1.close();
        st1.close();

        out.print("</table>");
        out.println("<br><br><br>");
        
        out.print("</center>");
    %>
    


</body>
</html>
