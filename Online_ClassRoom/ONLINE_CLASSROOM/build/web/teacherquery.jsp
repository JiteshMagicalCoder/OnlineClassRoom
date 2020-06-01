<%-- 
    Document   : teacherquery
    Created on : Mar 3, 2016, 11:11:11 PM
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
      <%! String Sub="";%>
     <%
                            
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom","root","root");
                            PreparedStatement st=con.prepareStatement("select * from askadmin");
                            ResultSet rs =st.executeQuery();
                            out.println("<center>");
                            out.println("<table border=\"1\" bgcolor='cyan' width='1000'>");
                            out.print("<tr>");
                            out.print("<td>");
                            out.print("S NO:");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Faculty Id");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Faculty Name:");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Email Id:");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Question");
                            out.print("</td>");
                            out.println("</tr>");
                            int i=1;
                            while(rs.next()){
                            out.println("<tr>");
                            out.print("<td>");
                            out.print(i);
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("Fid"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("Fname"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("EmailId"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("Query"));
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
