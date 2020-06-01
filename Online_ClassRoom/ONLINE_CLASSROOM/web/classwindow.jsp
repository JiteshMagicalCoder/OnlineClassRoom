<%-- 
    Document   : classwindow
    Created on : Feb 29, 2016, 8:13:54 AM
    Author     : user
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="cyan">
        <div align="center">
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
        </div>
    
        <center>
            <a href="downloadnotes.jsp"><Button style="width: 200px;height: 50px">Download  Notes</Button> </a><br><br><br>
            <a href="downloadassignment.jsp"><Button style="width: 200px;height: 50px">Download Assignment</Button> </a><br><br><br>
            <a href="submitassignment.jsp"><Button style="width:200px;height: 50px">Submit Assignment</Button> </a><br><br><br>
            <a href="assignmentremarks.jsp"><button style="width: 200px;height: 50px"> View Assignment Remarks </button></a><br><br>
          

        </center>
    </center>



</body>
</html>
