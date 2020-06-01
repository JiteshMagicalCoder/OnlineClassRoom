<%-- 
    Document   : Deletestudent
    Created on : Feb 11, 2016, 3:02:42 PM
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
        <title>Delete Student Record</title>
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
         
            out.print("<form bgcolor  action='DeleteFaculty'method='post'>");

            out.print("<table border='1' bgcolor='pink' width=\"900\">");
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
               

                out.print("</tr>");
                i++;
            }
            con1.close();
            st1.close();
            
            out.print("</table>");
            out.println("<br><br><br>");
            out.print(" Enter Email Id :<input type='text' name='email' required=''>");
            out.println("<input type='submit' value='Delete'>");
            out.print("</form >");
            out.print("</center>");
        %>
    <center>
    <footer>
        <hr>
        <a href="AdminHome.jsp"><Button >Back</Button> </a>
    </footer>   
    </center>


    </body>
</html>
