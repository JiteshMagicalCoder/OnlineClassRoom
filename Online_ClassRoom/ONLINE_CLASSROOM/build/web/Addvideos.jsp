<%-- 
    Document   : Addvideos
    Created on : Feb 11, 2016, 3:01:50 PM
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
     <form action="upload.jsp"  method="post">
            
         <center> 
          <%! String fname="";%>
            <%
               String fname=session.getAttribute("fname").toString();
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
               PreparedStatement st=con.prepareStatement("select * from subjectteacher where name=?");
               st.setString(1,fname);
               ResultSet rs = st.executeQuery();
               out.print("<tr>");
               out.print("<td>");
               out.print("Subject Name:");
               out.print("</td>");
               out.print("<td>");
               out.print("<select name='subname'>");
               out.print("<option>Select</option>");
                while (rs.next()) {
                    out.print("<option>");
                    out.print(rs.getString("subject"));
                    out.print("</option>");
                }
                out.print("</select> ");
                out.print("</td>");
                out.print("</tr>");
                out.println("<tr>");
                out.println("<td>");
                out.println("Topic:");
                out.println("</td>");
                out.println("<td>");
                out.println("<input type='text' name='tname' value=''>");
                out.println("</td>");
                out.println("<td>");
                out.println("Topic URL:");
                out.println("</td>");
                out.println("<td>");
                out.println("<input type='text' name='turl' value=''>");
                out.println("<input type='submit' name='go' value='Add'>");
                out.println("<input type='submit' name='go' value='Delete'>");
                out.println("</td>");
                out.println("</tr>");

            %>
         </center>

        </form>
            
            <br>
            <br>
            <br>
             <center> <% Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st1 = con1.prepareStatement("select * from videos where UploadedBy=?");
            st1.setString(1,fname);
            ResultSet rs1 = st1.executeQuery();
            out.print("<table border='1' bgcolor='pink' width='600'>");
            out.print("<font color='red'");
            out.println("List Of Uploaded videos");
            out.println("</font>");
            out.print("<th>");
            out.print("S.No.");
            out.print("</th>");
            out.print("<th>");
            out.print("SujectName");
            out.print("<th>");
            out.print("Topic");
            out.print("</th>");
            out.print("<th>");
            out.print("Topic URL");
            out.print("</th>");
            int i=1;
            while (rs1.next()) {
                out.print("<tr>");
                out.print("<td>");
                out.print(i);
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("subject"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("topic"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("url"));
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
