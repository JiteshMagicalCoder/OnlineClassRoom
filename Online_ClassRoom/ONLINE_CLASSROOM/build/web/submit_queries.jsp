<%-- 
    Document   : submit_queries
    Created on : Feb 15, 2016, 10:46:03 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query page</title>
    </head>
    <body bgcolor="cyan">
        <marquee><font color="red">Submit your queries here. We will try to solve your problem within reasonable time</font></marquee> 

        <br>
        <br>
        <br>
        <%! String name = "";String fname="";
             String mail = "";%>
             <%String name = session.getAttribute("username").toString();
            String mail = session.getAttribute("emailid").toString();

      
        %>
        <form action="query.jsp" method="post">
            <table>
            <%
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
               PreparedStatement st=con.prepareStatement("select * from enroll where StudentName=?");
               st.setString(1,name);
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
                    out.print(rs.getString("SubjectName"));
                    out.print("</option>");
                }
                out.print("</select> ");
                out.print("</td>");
                out.print("</tr>");

            %>
          <tr>
                <td>
                    Question:</td>
           <td>
          <textarea rows="10" cols="150" name="a" ></textarea><br>
            <input type="submit" value="POST"  name="submit">
              <input type="reset" value="Reset"  name="reset">
              </td>
        </form>
</body>
</html>
