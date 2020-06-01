<%-- 
    Document   : downloadassignment
    Created on : Feb 29, 2016, 8:19:29 AM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Question</title>
        <script type="text/javascript">
            function getdata()
            {
                var name = document.getElementById('subject_topic').value;
                window.location.replace("Addtopic.jsp?subject" + name);


            }
        </script>
    </head>
    <body bgcolor="pink">
    <center>
        <%! String sname = "",name="", sub = "";
         int eid = 0;%>
        
        <%
            sname = session.getAttribute("username").toString();

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st = con.prepareStatement("select * from enroll where StudentName=?");
            st.setString(1,sname);
            ResultSet rs = st.executeQuery();
            out.println("<center>");
            out.println("<form action='downloadassignment.jsp' method='post'>");
            out.println("Select Subject:");
            out.print("<select name='subject' id='subject_topic'>");
            out.print("<option>");
            out.println("select");
            out.print("</option>");
            while (rs.next()) {

        %>       
        <option value=<%=rs.getString("SubjectName")%>>
            <%=rs.getString("SubjectName")%>
        </option>
        <%
            }
            out.println("<input type=\"submit\" value=\"go\">");
            out.println("</form>");
        %>
    </center>

    <%
        out.println("<br><br>");
        name = request.getParameter("subject");
        if (name == null) {

        } else {
            if (name.equalsIgnoreCase("select")) {
                out.println("<script type='text/javascript'>");
                out.println("alert('choose valid subject...');");
                out.println("</script>");

            } else {
                sub = name;

                PreparedStatement st2 = con.prepareStatement("select * from assignment where SubjectName=?");
                st2.setString(1, name);
                ResultSet rs2 = st2.executeQuery();
                out.print("<table border='1' bgcolor='cyan' width='1000'>");
                out.print("<th>");
                out.print("S.No.");
                out.print("</th>");
                out.println("<th>");
                out.print("Faculty Name");
                out.print("</th>");
                out.print("<th>");
                out.print("Subject Name");
                out.print("</th>");
                out.print("<th>");
                out.print("Notes Url");
                out.print("</th>");
                out.print("<th>");
                out.print("Assignment ID");
                out.print("</th>");
                int i=1;
                while (rs2.next()) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(i);
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("FacultyName"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("SubjectName"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("FileName"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("idassignment"));
                    out.print("</td>");
                    i++;
                }
                out.println("</table>");

    %>       
</center>
<br><br><br><br><br>

<form action="assignmentdownload.jsp" method="post">
    <center>

        <table bgcolor="cyan">
            <caption><font color="red">Here You Can DownLoad Assignment</font></caption>
            <tr>
                <td>
                    Enter Assignment Id:  
                </td>
                <td>
                    <input type="text" name="aid" value="">   
                </td>
            </tr>
             <td>
                    <input type="submit" name="dwd" value="download">
                </td>
            </tr>
        </table>
    </center>
</form>
<%
        }
    }
%>

<center>
    <footer>
        <hr>
        <a href="classwindow.jsp"><Button >Back</Button> </a>
    </footer>   
</center>
</body>
</html>