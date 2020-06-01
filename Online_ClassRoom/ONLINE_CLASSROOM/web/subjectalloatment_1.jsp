<%-- 
    Document   : subjectalloatment
    Created on : Feb 23, 2016, 8:57:28 PM
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
        <h3> <font color="red">List Of Registered Faculty Member</font></h3>
        
        
    </center>

        <%

            
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st1 = con1.prepareStatement("select * from facultyregistration");
            ResultSet rs1 = st1.executeQuery();
            out.print("<center>");
         

            out.print("<table border='1' bgcolor='pink' width=\"1200\">");
             out.print("<th>");
            out.print("S.No:");
            out.print("</th>");
             out.print("<th>");
            out.print("Id");
            out.print("</th>");
            out.print("<th>");
            out.print("Name");
            out.print("</th>");
            out.print("<th>");
            out.print("Email Id");
            out.print("<th>");
            out.print("Password");
            out.print("</th>");
            out.print("<th>");
            out.print("Gender");
            out.print("</th>");
            out.print("<th>");
            out.print("Phone No");
            out.print("</th>");
            out.print("<th>");
            out.print("Address");
            out.print("</th>");
            out.print("<th>");
            out.print("LastLogin");
            out.print("</th>");
            int i=1;
            while (rs1.next()) {
                out.print("<tr>");
                 out.print("<td>");
                out.print(i);
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("Fid"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("Name"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("EmailId"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("Password"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("Gender"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("Phone"));
                out.print("</td>");
                
                out.print("<td>");
                out.print(rs1.getString("Address"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("LastLogin"));
                out.print("</td>");

                out.print("</tr>");
                i++;
            }
            con1.close();
            st1.close();
            
            out.print("</table>");
           
            out.print("</table>");
            out.print("</center>");
        %>
        <br><br><br><br>
        <center>
            <form action="SubjectAlloat" method="post">
            <table bgcolor="cyan"  width="400" height="50">
                <caption><font color="red">SUBJECT ALLOATMENT </font></caption>
                <tr>
                    <td>Enter Id:</td>
                    <td><input type="text" name="fid" value="" size="30"></td>
                </tr>
                 <tr>
                    <td>Faculty Name:</td>
                    <td><input type="text" name="fname" value="" size="30"></td>
                </tr>
                <tr>
                    <td>Select Subject:</td>
                    <td>
                    <%

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from subject");
                ResultSet rs = st.executeQuery();
                out.print("<select name='subname'>");
                out.print("<option>Select</option>");
                while (rs.next()) {
                    out.print("<option>");
                    out.print(rs.getString("SubjectName"));
                    out.print("</option>");
                }
                out.print("</select> ");
               %> 
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="submit"></td>
                    <td><input type="reset" name="submit" value="reset"></td>

                </tr>
            </table>
            </form>
        </center>
    <center>
    <footer>
        <hr>
        <a href="AdminHome.jsp"><Button >Back</Button> </a>
    </footer>   
    </center>


    </body>
</html>
