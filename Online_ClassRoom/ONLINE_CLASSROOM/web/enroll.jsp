<%-- 
    Document   : enroll
    Created on : Feb 28, 2016, 11:40:12 PM
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
    <body bgcolor="cyan">  
    <marquee><font color="blue"> <U>Now You Can Enroll For The Course As Your Choice.</U></font></marquee>
    <center>
        <fieldset style="width: 400px; height: 300px; border-width:5px;border-radius: 20px;
                  border-color: yellow; color: blue; margin-top: 1%;
                  margin-left: 2%;"><legend> Login here! </legend>
            <%! String email = "", name = "",Id="";%>
            <%
                email = session.getAttribute("emailid").toString();
                name = session.getAttribute("username").toString();
                Id = session.getAttribute("Student_Id").toString();
            %>
            <form action="Enroll" method="post"/>
            <table> 
                <caption> ENROLLMENT FORM</caption>

                <tr>
                    <th> Email ID: </th>
                    <td> <input type="text" name="id" value =<%=email%> size="50" readonly=""> </td>  
                    </th>
                </tr>
                <tr>
                    <th> Student Name: </th>
                    <td> <input type="text" name="name" value ="<%=name%>" size="50" readonly=""> </td>  
                    </th>
                </tr>
                 <tr>
                    <th> Student ID: </th>
                    <td> <input type="text" name="sid" value ="<%=Id%>" size="50" readonly=""> </td>  
                    </th>
                </tr>
                <tr>
                    <th> Subject Name: </th>

                    <td>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                            PreparedStatement st = con.prepareStatement("select * from subject");
                            ResultSet rs = st.executeQuery();
                            out.print("<select name=\"choose\" id=\"ch\">");
                            out.print("<option>");
                            out.println("select");
                            out.print("</option>");
                            while (rs.next()) {
                                out.println("<option>");
                                out.println(rs.getString("SubjectName"));
                                out.println("</option>");
                            }
                            out.println("</select>");


                        %> 
                    </td>    
                </tr>
                <tr>


                    <td style="text-align: center;" colspan="1">
                        <input type="submit" value="submit"></td> 
                    <td><input type="reset" value="Reset"> </td>

                </tr>
            </table>

            </form>
        </fieldset>
    </center>
</body>
</html>
