<%-- 
    Document   : FacultyHome
    Created on : Feb 22, 2016, 10:53:09 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Faculty Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
    </head>
     <body>
     <center>
            <!-------------------- display current date ---------------------------------------->
            <h2>
                <font color="#ff0080">
                <script type="text/javascript">
                    var m_names = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
                    var d = new Date();
                    var curr_date = d.getDate();
                    var curr_month = d.getMonth();
                    var curr_year = d.getFullYear();
                    document.write(curr_date + "-" + m_names[curr_month] + "-" + curr_year);
                </script>
                </FONT>
            </h2>
     </center>
        <%! String name = "", sub = "";%>
        <img src="image/vclass.PNG" height="200" width="1000">
        <%
            name = session.getAttribute("fname").toString();
            out.println("<h4>");
            out.println("<font color=\"Blue\">");
            out.println("Welcome " + name);
            out.println("</font>");
            String lastlogin = session.getAttribute("Last_Login").toString();
            out.println("<div style=\"float:right\">");
            out.println("<form action=\"admin_logout.jsp\" method=\"post\">");
            out.println("<font color=\"red\">");
            out.println("Last Login: " + lastlogin);
            out.println("<input type=\"submit\" name=\"submit\" value=\"Logout\" height=\"30\" width=\"50\">");
            out.println("</form>");
            out.println("</div>");
            out.println("</h4>");
        %>
        <br>       
 <div style="float:right">
    <a href="fchangepwd.jsp" target="iframe_a"><input type="button" name="cpwds" value="Change Password"></a>
</div>
<br>

        <hr>

        <div class="menu_nav">
            <ul>
               <li class="active"><a href="welcome1.jsp" target="iframe_a">Profile</a></li>

                <li class="active"><a href="notes.jsp" target="iframe_a">Add Notes</a></li>
                <li class="active"><a href="deletenotes.jsp"target="iframe_a">Delete Notes</a></li>
                <li class="active"><a href="Addquestion.jsp" target="iframe_a"> Add Question </a></li>
                <li class="active"><a href="Deletequestion.jsp"> View / Delete Questions</a></li>
                <li class="active"><a href="Addvideos.jsp" target="iframe_a"> Upload / Delete Videos</a></li>
                <li class="active"><a href="Updatequestion.jsp" target="iframe_a"> Update Question </a> </li>
                <li class="active"><a href="ask_to_admin.jsp" target="iframe_a"> Ask To Admin </a></li>
                <li class="active"><a href="uploadassignment.jsp" target="iframe_a">Upload Assignment</a></li>
                <li class="active"><a href="checkassignment.jsp" target="iframe_a"> Check Assignment</a></li>
                <li class="active"><a href="exam.jsp" target="iframe_a"> Conduct Exam</a></li>
                <li class="active"><a href="studentquery.jsp" target="iframe_a"> View Query</a></li>

            </ul>
            <div class="clr"></div>
        </div>
        <br> <br> <br>
        <iframe src="enrolledStudent.jsp" name="iframe_a" height="400" width="1000"></iframe>
        
</body>
</html>
