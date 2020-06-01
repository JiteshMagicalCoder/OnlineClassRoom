<%-- 
    Document   : Disscussionfourm
    Created on : Feb 11, 2016, 3:04:17 PM
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
    <body >
        <%! String name = "";
            String mail = "";%>
        <%String name = session.getAttribute("username").toString();
          String mail = session.getAttribute("emailid").toString();
         
        
        %>
    <marquee> <img src="feed.jpg" height="100" width="400"></marquee>
    <hr>
    <p>    <h3>

        <font color="blue" >
        Thank you for using our e-learning materials. By filling out the following form you will be aiding us in improving our services to you,our customer. There are no required fields on this form but we would appreciate it ifyou would indicate the course title and give us your comments. If you wish to remain anonymous,you can. We may also use this information in future promotional literature.   
        </font>
        <h3>

            </p>
            <center>
                <form method="post" action="feedbackResponse.jsp">
                  Name:<input type='text' name='name' value='<%=name%>' size='50' readonly><BR>
                  Email:<input type='text' name='mail' value='<%=mail%>' size='50' readonly><BR>
                    <table bgcolor="cyan" border="1" width="1000">
                        <%
                          

                            Class.forName("com.mysql.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                            PreparedStatement st = con.prepareStatement("select * from feedbackquestion");
                            ResultSet rs = st.executeQuery();
                            int i = 1;
                            int count = 0;
                            out.println("<tr>");
                            out.println("<th>");
                            out.println("Qno:");
                            out.println("</th>");
                            out.println("<th>");
                            out.println("Question:");
                            out.println("</th>");
                            out.println("<th>");
                            out.println("NA");
                            out.println("</th>");
                            out.println("<th>");
                            out.println("1");
                            out.println("</th>");
                            out.println("<th>");
                            out.println("2");
                            out.println("</th>");
                            out.println("<th>");
                            out.println("3");
                            out.println("</th>");
                            out.println("<th>");
                            out.println("4");
                            out.println("</th>");
                            out.println("</tr>");
                            while (rs.next()) {
                                count++;
                        %>

                        <tr>
                            <td>
                                <%=rs.getString("Qno")%>
                            </td>
                            <td>
                                <%=rs.getString("Question")%>
                            </td>
                            <td>
                                <input type="radio" value="NA" name="radio<%=rs.getString("Qno")%>"/>
                            </td>
                            <td>
                                <input type="radio" value="1" name="radio<%=rs.getString("Qno")%>"/>
                            </td>
                            <td>
                                <input type="radio" value="2" name="radio<%=rs.getString("Qno")%>"/>
                            </td>
                            <td>
                                <input type="radio" value="3" name="radio<%=rs.getString("Qno")%>"/>
                            </td>
                            <td>
                                <input type="radio" value="4" name="radio<%=rs.getString("Qno")%>"/>
                            </td>

                        </tr>

                        <%

                            }
                        %>

                        <tr>
                    </table>
                    <center>
                        <input type="submit" value="submit">
                        <input type="reset" value="reset">
                    </center>

                </form>
            </center>
            </body>
            </html>
