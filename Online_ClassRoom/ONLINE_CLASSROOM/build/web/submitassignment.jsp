<%-- 
    Document   : submitassignment
    Created on : Feb 29, 2016, 9:06:11 AM
    Author     : user
--%><%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="pink">
        <br>
        <br>
        <br>
        <%! String fname = "";%>
        <%
            String fname = session.getAttribute("username").toString();
            String studentid=session.getAttribute("Student_Id").toString();
        %>
    <center>
        <form action="assignmentsubmission.jsp"  method="post">
            <table bgcolor="cyan" border="0">
                <caption>Assignment Submission Window</caption>
                <tr>
                    <td>Student Name:</td>
                    <td><input type="text" name="fname" value="<%=fname%>" readonly=""> </td>
                </tr>
                <tr>
                    <td>Student Id:</td>
                    <td><input type="text" name="sid" value="<%=studentid%>" readonly=""> </td>
                </tr>
                <%
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                    PreparedStatement st = con.prepareStatement("select * from enroll where StudentName=?");
                    st.setString(1, fname);
                    ResultSet rs = st.executeQuery();
                    out.print("<tr>");
                    out.print("<td>");
                    out.print("Subject Name:");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<select name='subname' >");
                    out.print("<option>Select</option>");
                    while (rs.next()) {
                        out.print("<option>");
                        out.print(rs.getString("SubjectName"));
                        out.print("</option>");
                    }
                    out.print("</select> ");
                    out.println("</td>");
                    out.println("</tr>");
                %>
                <tr>
                    <td>
                        Choose File:
                    </td>
                    <td><input type="file" name="notes" value="" >  </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="submit" value="submit">
                        <input type="reset"  name="reset" value="Reset">
                    </td>
                </tr>
            </table>

    </center>

</form>

<br>

<center> 
    <% Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
        PreparedStatement st1 = con1.prepareStatement("select * from assignmentsresponse where StudentName=?");
        st1.setString(1, fname);
        ResultSet rs1 = st1.executeQuery();
        out.print("<table border='1' bgcolor='cyan' width='800'>");
        out.print("<caption><font color='red'>List Of Submitted Assignment</font></caption>");
        out.print("<th>");
        out.print("S.No.");
        out.print("</th>");
        out.print("<th>");
        out.print("Subject Name");
        out.print("</th>");
        out.print("<th>");
        out.print("File Name");
        out.print("</th>");
        out.print("<th>");
        out.print("Submitted On");
        out.print("</th>");
         
      
        int i = 1;
        while (rs1.next()) {
            out.print("<tr>");
            out.print("<td>");
            out.print(i);
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("SubjectName"));
            out.print("</td>");
             out.print("<td>");
            out.print(rs1.getString("FileName"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("submissionOn"));
            out.print("</td>");
            
            i++;

            out.print("</tr>");
        }
        con1.close();
        st1.close();
        out.print("</table>");

    %></center>
<center>
    <footer>
        <hr>
        <a href="classwindow.jsp"><Button >Back</Button> </a>
    </footer>
</center>

</body>
</html>
