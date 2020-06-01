<%-- 
    Document   : result
    Created on : Feb 13, 2016, 7:37:47 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>result</title>
    </head>
    <body>
        <%

            String name = session.getAttribute("username").toString();
            String mail = session.getAttribute("emailid").toString();
            String sub = (String) session.getAttribute("subject");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclass", "root", "root");
            PreparedStatement st = con.prepareStatement("select * from questionbank where SubjectName=?");
            st.setString(1, sub);
            ResultSet rs = st.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
            }
            String id[] = new String[count];
            for (int j = 0; j < count; j++) {
                int p = j + 1;
                id[j] = request.getParameter("radio" + p);
            }
            /* fetching answer*/
            String str[] = new String[count];
            int c = 0;
            PreparedStatement st1 = con.prepareStatement("select * from questionbank where SubjectName=?");
            st1.setString(1, sub);
            ResultSet rs1 = st1.executeQuery();
            while (rs1.next()) {
                str[c] = rs1.getString("Answer").toString();
                c++;
            }

            int correct = 0;
            int not_attempt = 0;
            int wrong = 0;
            out.println("<br>");
            for (int k = 0; k < count; k++) {
                String ans = id[k];
                String correctans = str[k];
                if (correctans.equals(ans)) {
                    correct++;
                } else {
                    if (ans == null) {
                        not_attempt++;
                    } else {
                        wrong++;
                    }
                }
            }
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");

            out.println("<center>");
            out.println("<table border=1 height=\"100\" width=\"400\" bgcolor=\"cyan\">");
            out.println("<caption>");
            out.println("<h1>");
            out.println("<font color=\"red\">");
            out.println("Your Result");
            out.println("</font>");
            out.println("</h1>");
            out.println("</caption>");

            out.println("<tr>");
            out.println("<td>");
            out.println("Name");
            out.println("</td>");
            out.println("<td>");
            out.println(name);
            out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>");
            out.println("Correct Answers");
            out.println("</td>");
            out.println("<td>");
            out.println(correct);
            out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>");
            out.println("Wrong Answers");
            out.println("</td>");
            out.println("<td>");
            out.println(wrong);
            out.println("</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>");
            out.println("Not  Attempt");
            out.println("</td>");
            out.println("<td>");
            out.println(not_attempt);
            out.println("</td>");
            out.println("</tr>");
            out.println("</table>");
            
            java.util.Date d =new java.util.Date();
            String t=d.toString();
            PreparedStatement st2 = con.prepareStatement("insert into reports (emailid,name,subject,TotalQuestion,Correct,Wrong,Not_Attempt,date) values(?,?,?,?,?,?,?,?)");
            st2.setString(1, mail);
            st2.setString(2, name);
            st2.setString(3, sub);
            st2.setString(4,Integer.toString(count));
            st2.setString(5,Integer.toString(correct));
            st2.setString(6,Integer.toString(wrong));
            st2.setString(7,Integer.toString(not_attempt));
            st2.setString(8,t);
            int x=st2.executeUpdate();

        %>
    <center>
        <br>
        <br>
        <a href="studenthome.jsp"><input type="button" name="button" value="Back"></a>
    </center>
</body>
</html>
