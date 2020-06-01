<%-- 
    Document   : testpage
    Created on : Feb 12, 2016, 12:46:52 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Page</title>
    </head>
    <body>
     <!---------------------------get subject------------------------------------------------>
    
    <center>
    <h1>
       
        <font color="Red">Test Window</font>
    </h1>
    </center>
    <h3>   <marquee><font color="blue">Now you can choose subject and take test to check what you learn</font></marquee></h3>

     <hr>
    
         <%
          java.io.File path =new  java.io.File("D:/VIRTUAL_CLASSROOM/Exam");
          Runtime.getRuntime().exec("java -jar D:/VIRTUAL_CLASSROOM/Exam/OnlineExam.jar ");
        %>
  </center>
  <center>
      
      <img src="good_luck.jpg" height="300" width="600"><br><br>
      Click Here to Student Home Page:<a href="studenthome.jsp">click here</a>

  </center>
    </body>
</html>
