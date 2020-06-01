<%-- 
    Document   : uploadassignment
    Created on : Feb 23, 2016, 10:23:08 AM
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
        <br>
        <br>
        <br>
        <%! String fname = "";%>
        <%
            String fname = session.getAttribute("fname").toString();

        %>
    <center>
        <form action="uploadassign.jsp"  method="post">
            <table bgcolor="cyan" border="0">
                <caption>ADD Assigment</caption>
                <tr>
                    <td>Faculty Name:</td>
                    <td><input type="text" name="fname" value="<%=fname%>" readonly=""> </td>
                </tr>
                <%
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                    PreparedStatement st = con.prepareStatement("select * from subjectteacher where name=?");
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
                        out.print(rs.getString("subject"));
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
                    <td>Date of Submission:</td>
                    <td><input type="text" name="subdate" value=""> </td>
                </tr>
                <tr><td>
                        <input type="submit" name="submit" value="Add">
                        <input type="reset"  name="reset" value="Reset">
                    </td>
                </tr>
            </table>

    </center>

</form>

<br>
<center> 
    <% Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
        PreparedStatement st1 = con1.prepareStatement("select * from assignment where FacultyName=?");
        st1.setString(1, fname);
        ResultSet rs1 = st1.executeQuery();
        out.print("<table border='1' bgcolor='pink' width='800'>");
        out.print("<th>");
        out.print("S.No.");
        out.print("</th>");
        out.print("<th>");
        out.print("Id.");
        out.print("</th>");
        out.print("<th>");
        out.print("SujectName");
        out.print("</th>");
        out.print("<th>");
        out.print("Topic Name");
        out.print("</th>");
        out.print("<th>");
        out.print("Uploaded On");
        out.print("</th>");
        out.print("<th>");
        out.print("Submission Date");
        out.print("</th>");
      
        int i = 1;
        while (rs1.next()) {
            out.print("<tr>");
            out.print("<td>");
            out.print(i);
            out.print("</td>");
             out.print("<td>");
            out.print(rs1.getString("idassignment"));
            out.print("</td>");
             out.print("<td>");
            out.print(rs1.getString("SubjectName"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("FileName"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("UploadedOn"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("Date_Of_Exam"));
            out.print("</td>");
            
            i++;

            out.print("</tr>");
        }
        con1.close();
        st1.close();
        out.print("</table>");

    %></center>
    <br><br><br>
    <center>
        <form action="DeleteAssignment">
         Enter Assignement ID:<input type="text" name="note"value="" required="">
        <input type="submit" name="submit" value="Delete">
       </form>
    </center>
    <br><br>


</body>
</html>
