<%-- 
    Document   : studentquery
    Created on : Mar 3, 2016, 10:00:57 PM
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
                            String fname=session.getAttribute("fname").toString();
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom","root","root");
                            PreparedStatement st=con.prepareStatement("select * from subjectteacher where name=?");
                            st.setString(1,fname);
                            ResultSet rs1 =st.executeQuery();
                            while(rs1.next())
                            {
                                Sub=rs1.getString("subject");
                               
                            }
                            out.println("<center>");
                            Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom","root","root");
                            PreparedStatement st1=con1.prepareStatement("select * from problems where SubjectName=?");
                            st1.setString(1,Sub);
                            ResultSet rs=st1.executeQuery();
                            out.println("<table border=\"1\" bgcolor='cyan' width='700'>");
                            out.print("<tr>");
                            out.print("<td>");
                            out.print("SNo");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Student Name:");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Email Id:");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("Question");
                            out.print("</td>");
                            int i=1;
                            while(rs.next()){
                            out.println("<tr>");
                            out.print("<td>");
                            out.print(i);
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("name"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("email_id"));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString("question"));
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
