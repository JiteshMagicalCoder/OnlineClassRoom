<%-- 
    Document   : studenthome1
    Created on : Mar 2, 2016, 6:35:00 AM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"    content="text/html; charset=UTF-8">
        <title>STUDENT HOME</title>
    </head>
<body background="background.jpg">  
   
    <img src="image/vclass.PNG" height="200" width="1350">

<%
 String name=session.getAttribute("username").toString();
  String lastlogin=session.getAttribute("Last_Login").toString();
  out.println("<h4>");
  out.println("<font color=\"Blue\">");
  out.println("Welcome "+name);
  out.println("</font>");
 
  out.println("<div style=\"float:right\">");
  out.println("<form action=\"logout.jsp\" method=\"post\">");
  out.println("<font color=\"red\">");
  out.println("Last Login: "+lastlogin);
  out.println("</font>");
  out.println("<input type=\"submit\" name=\"submit\" value=\"Logout\" height=\"30\" width=\"50\">");
  out.println("</div>");
  
  out.println("</form>");
  out.println("</h4>");
   
%>
<div style="float:right">
    <a href="schangepwd.jsp" target="iframe_a"><input type="button" name="cpwds" value="Change Password"></a>
</div>
<br>

    <hr>
<!----------------------------------------------------Latest News and Images---------------->
<div style="float:left">
<table border="1" bgcolor="#00FFFF">
<caption> <font color="#000000"><u>Latest News </u></font></caption>
<tr>
<td width="180" height="100">
<marquee direction="up">
latest news.
</marquee>
</td>
</tr>
</table>
<table border="0">
<tr>
<td height="50" width="180">
<a href="enroll.jsp" target="iframe_a"><img src="image/enroll.PNG" height="40" width="200"><br></a>
</td>
</tr>
<tr>
<td height="50" width="180">
<a href="classwindow.jsp" target="iframe_a"><img src="image/class.PNG" height="40" width="200"><br></a>

</td>
</tr>
<tr>
<td height="50" width="180">
    <a href="submit_queries.jsp"><input type="image" src="image/askexpert.PNG" alt="submit" width="200" height="30"></a>
</td>
</tr>
<tr>
<td height="50" width="180">
    <a href="watch_vedio.jsp"><input type="image" src="image/watchvedio.PNG" alt="submit" width="200" height="30"></a>
</td>
</tr>

</table>
</div>
<!-------------------------------------our services------------------->
<div style="float:right">
 <table border="1" bgcolor="#00FFFF" height="200" width="200">
<caption> <font color="#000000"><u>YOU ARE ENROLLED FOR </u> </font></caption>
<tr>
<td >

 <%! int idhitcount;int visiters = 0;%>

          <%
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from enroll where StudentName=?");
                st.setString(1,session.getAttribute("username").toString());
                ResultSet rs = st.executeQuery(); 
                out.println("<B>");
                int i=1;
                while(rs.next()) {
                 
                  out.println(i+":"+rs.getString("SubjectName")); 
                  out.println("<br>");
                  i++;
                }
                out.println("</B>");
               

            %>
</td>
</tr>
</table>
<table border="0">
<tr>
<td height="50" width="180">
    <a href="testpage.jsp"><input type="image" src="image/taketest.PNG" alt="submit" width="200" height="30"></a>
</td>
</tr>
<tr>
<td height="50" width="180">
    <a href="view_report.jsp"><input type="image" src="image/viewreport.PNG" alt="submit" width="200" height="30"></a>

</td>
</tr>
<tr>
<td height="50" width="180">
    <a href="feedback.jsp"><input type="image" src="image/feedback.PNG" alt="submit" width="200" height="30"></a>

</td>
</tr>
<tr>
<td height="50" width="180">

</td>
</tr>

</table>
</div>
<!-----------------------------------------detail---------------------------->

<iframe src="welcome.jsp" name="iframe_a" height="400" width="550"></iframe>


</body>
</html>