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
         <% String name = "", sub = "",sub1="";int duration=0,question=0;%>
        <%
                    String fname = session.getAttribute("fname").toString();
                    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                    PreparedStatement stmt = conn.prepareStatement("select * from subjectteacher where name=?");
                    stmt.setString(1,fname);
                    ResultSet rst = stmt.executeQuery();
                    while(rst.next())
                        sub1=rst.getString("subject");
                    
                    
                  
        %>
        
    <center>
       
        <%
                  
                    Connection con= DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                    PreparedStatement st = con.prepareStatement("select * from exams where ExamName=?");
                    st.setString(1,sub1);
                    ResultSet rs1 = st.executeQuery();
                    out.print("<table border='1' bgcolor='pink' width='600'>");
                    out.print("<th>");
                    out.print("S.No.");
                    out.print("</th>");
                    out.print("<th>");
                    out.print("Exam Name");
                    out.print("<th>");
                    out.print("TOTAL QUESTION");
                    out.print("</th>");
                    out.print("<th>");
                    out.print("TIME DURATION");
                    out.print("</th>");
                    int i=1;
                    while(rs1.next())
                    {
                        duration=rs1.getInt("Duration");
                        question=rs1.getInt("NumberOfQuestions");
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(i);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rs1.getString("ExamName"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rs1.getInt("NumberOfQuestions"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rs1.getInt("Duration"));
                        out.print("</td>");
                      i++;
                    }
                    out.println("</table>");
                     
        
        %>
        <br><br><br>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st1 = con1.prepareStatement("select * from exams where ExamName=?");
            st1.setString(1,sub1);
            ResultSet rs = st1.executeQuery();
            out.println("<center>");
            out.println("<form action='exam.jsp' method='post'>");
            out.println("Select Exam Here:");
            out.print("<select name='subject' id='subject_topic'>");
            out.print("<option>");
            out.println("select");
            out.print("</option>");
            while (rs.next()) {

        %>       
        <option value=<%=rs.getString("ExamName")%>>
            <%=rs.getString("ExamName")%>
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
            else 
            {
                if (name.equalsIgnoreCase("select")) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('choose valid subject...');");
                    out.println("</script>");
                     
                    

                } 
                else {
                    sub = name;
                    Connection con2= DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                    PreparedStatement st2= con2.prepareStatement("select * from exams where ExamName=?");
                    st2.setString(1, sub);
                    ResultSet rs2 = st2.executeQuery();
                  
                     i=1;
                    if (rs2.next())
                    {
                        duration=rs2.getInt("Duration");
                        question=rs2.getInt("NumberOfQuestions");
                      
                      
                   }
                    out.println("</table>");
                    


        %>

    </center>
        <br><br><br><br><br>
    <table>    
    <form action="exam" method="post">
        <center>
          
                <caption>Enter Detail</caption>
                <tr>
                    <td>
                        Subject Name:  
                    </td>
                    <td>
                        <input type="text" name="subject" value=<%=sub%>>   
                    </td>
                </tr>
                <tr>
                    <td>
                        Time Duration(Min):
                    </td>
                    <td>
                        <input type="text" name="duration" value=<%=duration%>>   
                    </td>
                </tr>
                <tr>
                    <td>
                        Number Of Question:
                    </td>
                    <td>
                       <input type="text" name="question" value=<%=question%>>
                    </td>
                </tr>
                 <tr>
                     <td>
                      <input type="submit" name="topics" value="Add"> 
                      <input type="submit" name="topics" value="Update"> 

                     </td>
                </tr>
        </center>
    </form>
        </table>
    <%
            }
        }
    %>
   
 

</body>

</html>
