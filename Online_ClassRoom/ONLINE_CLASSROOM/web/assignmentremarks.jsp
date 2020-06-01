<%-- 
    Document   : assignmentremarks
    Created on : Feb 23, 2016, 10:25:14 AM
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
    <body>
     <%
                            String sname=session.getAttribute("username").toString();
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom","root","root");
                            PreparedStatement st=con.prepareStatement("select * from assignmentsresponse where StudentName=?");
                            st.setString(1,sname);
                            ResultSet rs =st.executeQuery();
                            out.println("<table border=\"1\" bgcolor='cyan' width='700'>");
                            out.print("<tr>");
                            out.print("<td>");
                            out.print("SNo");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Subject Name:");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Submitted file name");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Marks Obtain(out of 10)");
                            out.print("</td>");
                            int i=1;
                            while(rs.next()){
                            out.println("<tr>");
                            out.print("<td>");
                            out.print(i);
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("SubjectName"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("FileName"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("Marks"));
                            out.print("</td>");
                            out.print("</tr>");

                            i++;
                            
                            }
                            
                            con.close();
                            st.close();
                           out.println("</center>");
                        %>
    </body>
</html>
