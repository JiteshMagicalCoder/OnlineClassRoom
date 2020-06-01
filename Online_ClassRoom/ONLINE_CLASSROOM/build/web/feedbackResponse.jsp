<%-- 
    Document   : feedbackResponse
    Created on : Feb 16, 2016, 2:14:29 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String mail = request.getParameter("mail");
            String ans[] = new String[8];
            int i = 0;
            while (i < 8) {
                int p = i + 1;
                ans[i] = request.getParameter("radio" + p);
                i++;
            }
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st = con.prepareStatement("select * from questionbank where SubjectName=?");
            PreparedStatement st2 = con.prepareStatement("insert into feedbackresponse (name,email_id,q1,q2,q3,q4,q5,q6,q7,q8)values(?,?,?,?,?,?,?,?,?,?)");
            st2.setString(1, name);
            st2.setString(2, mail);
            st2.setString(3, ans[0]);
            st2.setString(4, ans[1]);
            st2.setString(5, ans[2]);
            st2.setString(6, ans[3]);
            st2.setString(7, ans[4]);
            st2.setString(8, ans[5]);
            st2.setString(9, ans[6]);
            st2.setString(10, ans[7]);
           int x = st2.executeUpdate();
           if(x==1)
           {
           out.println("<script type='text/javascript'>");
                out.println("alert('Thanks for your valuable feedback');");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("studenthome.jsp");
                rd.include(request, response);
    
           }

        %>
    <center>
        <br>
        <br>
        <a href="studenthome.jsp"><input type="button" name="button" value="Back"></a>
    </center>
</body>
</html>
