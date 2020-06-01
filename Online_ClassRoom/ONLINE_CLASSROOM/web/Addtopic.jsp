<%-- 
    Document   : Addtopic
    Created on : Feb 11, 2016, 3:05:11 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Topic</title>
    </head>
    <script type="text/javascript">
        function getdata()
        {
            var name = document.getElementById('subject_topic').value;
            window.location.replace("Addtopic.jsp?subject" + name);


        }
    </script>

    <body background="background.jpg">
    <center>
        <% String name = "", sub = "";%>
       
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st = con.prepareStatement("select * from subject");
            ResultSet rs = st.executeQuery();
            out.println("<center>");
            out.println("<form action='Addtopic.jsp' method='post'>");
            out.println("Select Subject:");
            out.print("<select name='subject' id='subject_topic'>");
            out.print("<option>");
            out.println("select");
            out.print("</option>");
            while (rs.next()) {

        %>       
        <option value=<%=rs.getString("SubjectName")%>>
            <%=rs.getString("SubjectName")%>
        </option>
        <%
              }
            out.println("<input type=\"submit\" value=\"go\">");
            out.println("</form>");
        %>

        
        <%
            out.println("<br><br>");
            name = request.getParameter("subject");

            if (name == null) {

            } 
            else {
                if (name.equalsIgnoreCase("select")) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('choose valid subject...');");
                    out.println("</script>");

                } else {
                    sub = name;
                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclass", "root", "root");
                    PreparedStatement st1 = con1.prepareStatement("select * from subjecttopics where SubjectName=?");
                    st1.setString(1, sub);
                    ResultSet rs1 = st1.executeQuery();
                    out.print("<table border='1' bgcolor='pink' width='600'>");
                    out.print("<th>");
                    out.print("S.No.");
                    out.print("</th>");
                    out.print("<th>");
                    out.print("SujectName");
                    out.print("<th>");
                    out.print("Topic Name");
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
                        out.print(rs1.getString("SubjectName"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rs1.getString("TopicName"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rs1.getString("TopicUrl"));
                        out.print("</td>");
                      i++;
                    }
                    out.println("</table>");
                    


        %>

    </center>
        <br><br><br><br><br>
        
    <form action="AddTopic" method="post">
        <center>
           
            <table>
                <caption>Select Your Choice</caption>
                <tr>
                    <td>
                        Subject Name:  
                    </td>
                    <td>
                        <input type="text" name="subject" value='<%=sub%>' readonly>   
                    </td>
                </tr>
                <tr>
                    <td>
                        Enter Topic Name:
                    </td>
                    <td>
                        <input type="text" name="topic">   
                    </td>
                </tr>
                <tr>
                    <td>
                        Enter Topic URL:
                    </td>
                    <td>
                       <input type="text" name="topicurl">
                    </td>
                </tr>
                 <tr>
                     <td>
                      <input type="submit" name="topics" value="Add"> 
                      <input type="submit" name="topics" value="Delete">
                     </td>
                </tr>
            </table>
        </center>
    </form>
    <%
            }
        }
    %>
    <center>
    <footer>
        <hr>
        <a href="AdminHome.jsp"><Button >Back</Button> </a>
    </footer>   
    </center>

</body>

</html>
