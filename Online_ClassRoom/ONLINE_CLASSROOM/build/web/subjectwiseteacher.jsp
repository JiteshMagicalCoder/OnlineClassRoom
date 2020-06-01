<%-- 
    Document   : subjectwiseteacher
    Created on : Feb 23, 2016, 9:49:54 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
          
        </script>

    <body background="background.jpg">
    <center>
        <%! String name = "", sub = "", fname = "";%>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st = con.prepareStatement("select * from subject");
            ResultSet rs = st.executeQuery();
            out.println("<center>");
            out.println("<form action='Teacher' method='post'>");
            out.println("Select Subject:");
            out.print("<select name='subject'>");
            out.print("<option>");
            out.println("select");
            out.print("</option>");
            while (rs.next())
            {
            String sub=rs.getString("SubjectName");
         %>       
         <option>
            <%=sub%>
        </option>
        <%
            }
            out.println("</select>");
            out.println("<input type=\"submit\" name='bt' value=\"Go\">");
            out.println("</form>");
        %>
        <h5>OR</h5>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            PreparedStatement st2 = con.prepareStatement("select * from facultyregistration");
            ResultSet rs2 = st2.executeQuery();
            out.println("<center>");
            out.println("<form action='Teacher' method='post'>");
            out.println("Faculty Name:");
            out.print("<select name='teacher'>");
            out.print("<option>");
            out.println("select");
            out.print("</option>");
            while (rs2.next()) {
        %>       
        <option>
            <%=rs2.getString("Name")%>
            <%
                }
                out.println("<input type=\"submit\"  name='bt' value=\"go\">");
                out.println("</form>");
            %>   




        <center>
            <footer>
                <a href="AdminHome.jsp"><Button >Back</Button> </a>
            </footer>   
        </center>







    </body>
</html>
