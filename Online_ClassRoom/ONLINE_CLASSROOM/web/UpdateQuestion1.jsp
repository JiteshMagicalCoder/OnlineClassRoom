<%-- 
    Document   : SearchQuestion
    Created on : Feb 15, 2016, 1:46:10 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Topic</title>
    </head>
    <body background="background.jpg">
        <form action="UpdateQuestion" method="post">
            <%! String sub = "";%>
            <%
                sub = request.getParameter("subName");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
              
                PreparedStatement st1 = con1.prepareStatement("select * from questionbank where SubjectName=?");
                st1.setString(1,sub);
                ResultSet rs1 = st1.executeQuery();

                out.print("<table border='1' bgcolor='pink'>");
                out.print("<th>");
                out.print("S.No.");
                out.print("</th>");
                out.print("<th>");
                out.print("Question");
                out.print("</th>");
                out.print("<th>");
                out.print("Option A");
                out.print("</th>");
                out.print("<th>");
                out.print("Option B");
                out.print("</th>");
                out.print("<th>");
                out.print("Option C");
                out.print("</th>");
                out.print("<th>");
                out.print("Option D");
                out.print("</th>");
                out.print("<th>");
                out.print("Answer");
                out.print("</th>");

                while (rs1.next()) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(rs1.getString("QuestionNo"));
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rs1.getString("Question"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs1.getString("OptionA"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs1.getString("OptionB"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs1.getString("OptionC"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs1.getString("OptionD"));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs1.getString("Answer"));
                    out.print("</td>");
                    out.print("</tr>");
                }
                con1.close();
                st1.close();
                out.print("</table>");
               
            
            %>
            <center>
                <br><br>
                <input type="hidden" name="subject" value=<%=sub%>>
                Enter Question Number<input type="text" name="qno">
                <input type="submit" value="Update">
            </center>
        </form>
    </body>
</html>
