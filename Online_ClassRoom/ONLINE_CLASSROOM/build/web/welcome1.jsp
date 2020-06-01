<%-- 
    Document   : fecultywelcome
    Created on : Mar 2, 2016, 2:01:47 PM
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
    <body bgcolor="cyan">
         
            <%
                String fname = session.getAttribute("fname").toString();
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st1 = con1.prepareStatement("select * from facultyregistration where Name=?");
                st1.setString(1, fname);
                ResultSet rs1 = st1.executeQuery();
                out.println("<center>");
                out.print("<table border='0' width='400'>");
                out.println("<font color='blue'>");
                out.print("<caption>PROFILE</caption>");
                out.println("</font>");
                 while(rs1.next()) {
                    out.println("<tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.print("<tr>");
                    out.print("<td width='500'>");
                    out.print("FACULTY ID:");
                    out.print("</td>");
                    out.print("<td width='300'>");
                    out.print(rs1.getString("Fid"));
                    out.print("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.print("<tr>");
                    out.print("<td width='300'>");
                    out.print("Name:");
                    out.print("</td>");
                    out.print("<td width='300'>");
                    out.print(rs1.getString("Name"));
                    out.print("</td>");
                    out.println("</tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.print("<tr>");
                    out.print("<td width='300'>");
                    out.print("Email:");
                    out.print("</td>");
                    out.print("<td width='300'>");
                    out.print(rs1.getString("EmailId"));
                    out.print("</td>");
                    out.println("</tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.print("<tr>");
                    out.print("<td width='300'>");
                    out.print("Contact No:");
                    out.print("</td>");
                    out.print("<td width='300'>");
                    out.print(rs1.getString("Phone"));
                    out.print("</td>");
                    out.println("</tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.print("<tr>");
                    out.print("<td width='300'>");
                    out.print("Faculty Type");
                    out.print("</td>");
                    out.print("<td width='300'>");
                    out.print(rs1.getString("ftype"));
                    out.print("</td>");
                    out.println("</tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.print("<tr>");
                    out.print("<td width='300'>");
                    out.print("Qualifcation:");
                    out.print("</td>");
                    out.print("<td width='300'>");
                    out.print(rs1.getString("qualification"));
                    out.print("</td>");
                    out.println("</tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("</tr>");
                    out.print("<tr>");
                    out.print("<td width='300'>");
                    out.print("Specialization");
                    out.print("</td>");
                    out.print("<td width='300'>");
                    out.print(rs1.getString("fspecial"));
                    out.print("</td>");
                    out.println("</tr>");
                    
                   
                }
                con1.close();
                st1.close();
                out.print("</table>");
                out.println("</center>");
            %>



    </td>
</tr>
<br><br>
</center>
<%--
<table border="1" bgcolor="#00FFFF">
    <caption> <font color="#000000">Remider</u></font></caption>
    <tr>
        <td width="200" height="200">


                    </td>
                </tr>
            </table>
--%>
</body>
</html>
