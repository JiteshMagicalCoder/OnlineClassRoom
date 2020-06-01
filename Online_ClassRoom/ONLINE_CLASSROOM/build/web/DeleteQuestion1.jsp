<%-- 
    Document   : DeleteQuestion1
    Created on : Feb 16, 2016, 8:48:19 PM
    Author     : RAVI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Question</title>
    </head>
    <body background="background.jpg">
        <form action="DeleteQuestion" method="post">
            <%! int qno=0;String sub="";%>
            <%
                    try
                    {
                     sub = request.getParameter("subject");

                     String q = request.getParameter("question").toString();
                     qno=Integer.parseInt(q);
                    }
                    catch(Exception e)
                    {
    
                    }
                    if (qno==0)
                    {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('All Fields are Required');");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("Deletequestion.jsp");
                        rd.include(request, response);
                    }
                    else 
                    {
                        
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                        PreparedStatement st = con.prepareStatement("delete from questionbank where QuestionNO=? and SubjectName=?");
                        st.setInt(1,qno);
                        st.setString(2,sub);

                        int x = st.executeUpdate();

                        if (x == 1)
                        {
                           PreparedStatement st1 = con.prepareStatement("update questionbank set QuestionNo=QuestionNo-1 where QuestionNo>? and SubjectName=?");
                           st1.setInt(1,qno);
                           st1.setString(2,sub);
                           x=st1.executeUpdate();
                           out.println("<script type='text/javascript'>");
                           out.println("alert('Question deleted successfully');");
                           out.println("</script>");
                           RequestDispatcher rd = request.getRequestDispatcher("Deletequestion.jsp");
                           rd.include(request, response);
                        }
                        else 
                        {
                            out.println("<script type='text/javascript'>");
                            out.println("alert('Oops!,Select valid data')");
                            out.println("</script>");
                            RequestDispatcher rd = request.getRequestDispatcher("Deletequestion.jsp");
                            rd.include(request, response);
                        }
                    }
                

            %>

        </form>
    </body>
</html>
