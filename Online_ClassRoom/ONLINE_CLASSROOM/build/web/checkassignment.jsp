<%-- 
    Document   : checkassignment
    Created on : Feb 29, 2016, 1:08:41 PM
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
       
    </head>
    <body background="background.jpg">
    <center>
        <%! String fname = "", name = "", sub = "";%>
         <%!   int eid = 0;%>
        <%
               fname = session.getAttribute("fname").toString();
                    try {
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                              PreparedStatement st = con.prepareStatement("select * from subjectteacher where name=?");
                              st.setString(1,fname);
                              ResultSet rs = st.executeQuery();
                              int i = 1;
                              if(rs.next()) {
                                 sub=rs.getString("subject");
                              }

                          } catch (Exception e) {
                              System.out.println(e);
                          }
                  

        %>
        <%
               Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
               PreparedStatement st2 = con1.prepareStatement("select * from assignmentsresponse where SubjectName=?");
                st2.setString(1,sub);
                ResultSet rs2 = st2.executeQuery();
                out.print("<table border='1' bgcolor='cyan' width='1000'>");
                out.print("<th>");
                out.print("S.No.");
                out.print("</th>");
                out.println("<th>");
                out.print("Student Id");
                out.print("</th>");
                out.print("<th>");
                out.print("Subject Name");
                out.print("</th>");
                out.print("<th>");
                out.print("Student Name");
                out.print("</th>");
                out.print("<th>");
                out.print("File Name");
                out.print("</th>");
                out.print("<th>");
                out.print("Submission On");
                out.print("</th>");
                int i=1;
                while (rs2.next()) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(i);
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("StudentId"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("SubjectName"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("StudentName"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("FileName"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs2.getString("submissionOn"));
                    out.print("</td>");
                    i++;
                }
                out.println("</table>");

    %>       
</center>
<br><br><br><br><br>

<form action="checkassign.jsp" method="post">
    <center>

        <table bgcolor="cyan">
            <caption><font color="red"> DownLoad Assignment Response</font></caption>
            <tr>
                <td>
                    Enter serial Id:  
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

<center>
    <footer>
        <hr>
        <a href="marks_on_assignment.jsp"><Button >Give Assignment Marks</Button> </a>
    </footer>   
</center>
</body>
</html>

       