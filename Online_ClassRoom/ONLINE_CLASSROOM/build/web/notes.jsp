<%-- 
    Document   : notes
    Created on : Feb 23, 2016, 10:12:26 AM
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
        <form action="addnotes.jsp"  method="post">
            <table bgcolor="cyan" border="0">
                <caption>ADD NOTES</caption>
                <tr>
                    <td>Faculty Name:</td>
                    <td><input type="text" name="fname" value="<%=fname%>" readonly=""> </td>
                </tr>
                  <tr>
                    <td>Enter Topic Name:</td>
                    <td><input type="text" name="tname" value=""> </td>
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
                    <td><input type="file" name="notes" value="" >  </td></tr>
                <tr><td>
                        <input type="submit" name="submit" value="Add Notes">
                        <input type="reset"  name="reset" value="Reset">
                    </td>
                </tr>
            </table>

    </center>

</form>

<br>
<center> 
    <% Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
        PreparedStatement st1 = con1.prepareStatement("select * from add_note where FacultyName=?");
        st1.setString(1, fname);
        ResultSet rs1 = st1.executeQuery();
        out.print("<table border='1' bgcolor='pink' width='800'>");
        out.print("<th>");
        out.print("S.No.");
        out.print("</th>");
        out.print("<th>");
        out.print("Notes ID");
        out.print("</th>");
        out.print("<th>");
        out.print("SujectName");
        out.print("</th>");
        out.print("<th>");
        out.print("Topic Name");
        out.print("</th>");
        out.print("<th>");
        out.print("TOPIC Notes");
        out.print("</th>");
         out.print("<th>");
        out.print("Uploaded On");
        out.print("</th>");
      
        int i = 1;
        while (rs1.next()) {
            out.print("<tr>");
            out.print("<td>");
            out.print(i);
            out.print("</td>");
             out.print("<td>");
            out.print(rs1.getString("idadd_note"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("SubjectName"));
            out.print("</td>");
             out.print("<td>");
            out.print(rs1.getString("TopicName"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("NotesFile"));
            out.print("</td>");
            out.print("<td>");
            out.print(rs1.getString("UpdatedOn"));
            out.print("</td>");
            
            i++;

            out.print("</tr>");
        }
        con1.close();
        st1.close();
        out.print("</table>");

    %></center>


</body>
</html>
