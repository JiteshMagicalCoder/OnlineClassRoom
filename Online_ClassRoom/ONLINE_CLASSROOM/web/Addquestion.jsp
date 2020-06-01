<%-- 
    Document   : Addquestion
    Created on : Feb 11, 2016, 3:01:37 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD QUESTION</title>
    </head>
    <body background="background.jpg"> <div style="margin-top: 10%;margin-left: 150px;"> 
            <center><form action="AddQuestion"   method="post"><table>

                      <%! String name="";%>  
                        <%
                            name=session.getAttribute("fname").toString();

                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom","root","root");
                            PreparedStatement st=con.prepareStatement("select * from subjectteacher where name=?");
                            st.setString(1,name);
                            ResultSet rs=st.executeQuery();
                            out.print("<tr>");
                            out.print("<td>");
                            out.print("Subject Name:");
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<select name='subName'>");
                            out.print("<option>Select</option>");
                            while(rs.next()){
                            out.print("<option>");
                            out.print(rs.getString("subject"));
                            out.print("</option>");
                            }
                           
                            
                            out.print("</td>");
                            out.print("</tr>");
                            con.close();
                            st.close();
                        %>
                        <tr>
                            <td>
                                Question:
                            </td>
                            <td>
                                <input type="textArea" style="width:400px; height:100px;" name="q">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Option(A):
                            </td>
                            <td>
                                <input type="text" name="a">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Option(B):
                            </td>
                            <td>
                                <input type="text" name="b">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Option(C):
                            </td>
                            <td>
                                <input type="text" name="c">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Option(D):
                            </td>
                            <td>
                                <input type="text" name="d">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Answer:
                            </td>
                            <td>
                                <input type="text" name="ans">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="hidden" name="fname" value=<%=name%>>
                                <input type="submit" value="ADD">
                                <input type="reset" value="Clear">
                            </td>

                        </tr>






                    </table>
                </form>  



            </center></div>

                        


    </body>
</html>
