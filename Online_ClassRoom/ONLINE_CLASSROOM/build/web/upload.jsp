<%-- 
    Document   : upload
    Created on : Feb 17, 2016, 3:01:37 PM
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
    <body>
        <%! int x = 0;
            String button, sub, topic, turl, subName,fname="";%>
        <%
            fname=session.getAttribute("fname").toString();
            sub = request.getParameter("subname");
            topic = request.getParameter("tname");
            turl = request.getParameter("turl");
           button = request.getParameter("go");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            subName = request.getParameter("subName");
            if (sub.equalsIgnoreCase("select") || topic.equalsIgnoreCase("") || turl.equalsIgnoreCase("")) {
                out.println("<script type='text/javascript'>");
                out.println("alert('All Fields are Required');");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("Addvideos.jsp");
                rd.include(request, response);
            }
            else 
            {
                if (button.equalsIgnoreCase("ADD")) {
                    PreparedStatement st = con.prepareStatement("insert into videos(subject,topic,url,uploadedby) values(?,?,?,?)");
                    st.setString(1, sub);
                    st.setString(2, topic);
                    st.setString(3, turl);
                    st.setString(4, fname);
                    int x = st.executeUpdate();
                    if (x == 1) 
                    {
                       out.println("<script type='text/javascript'>");
                       out.println("alert('video uploaded successfully');");
                       out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("Addvideos.jsp");
                        rd.include(request, response);
                    } 
                    else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('server error..');");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("Addvideos.jsp");
                        rd.include(request, response);
                    }

                } 
                else {
                    PreparedStatement st = con.prepareStatement("delete from videos where subject=? and topic=? and url=? and uploadedby=?");
                    st.setString(1,sub);
                    st.setString(2,topic);
                    st.setString(3,turl);
                    st.setString(4,fname);
                    x=st.executeUpdate();
                                        
                    if (x == 1) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('video deleted successfully');");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("Addvideos.jsp");
                        rd.include(request, response);
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Oops!,Select valid data')");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("Addvideos.jsp");
                        rd.include(request, response);
                    }

                }
            }


        %>
    </body>
</html>
