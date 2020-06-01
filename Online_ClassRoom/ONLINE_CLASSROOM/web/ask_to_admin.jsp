<%-- 
    Document   : ask_to_admin
    Created on : Mar 2, 2016, 10:16:01 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query page</title>
    </head>
    <body bgcolor="cyan">
        <marquee><font color="red">Submit your queries here. We will try to solve your problem within reasonable time we will mail you once your query resolve so keep checking your mail</font></marquee> 

        <br>
        <br>
        <br>
        <%! String name = "";String fname="";
             String mail = "";%>
             <%String name = session.getAttribute("fname").toString();
            String mail = session.getAttribute("femail").toString();

      
        %>
        <form action="query1.jsp" method="post">
            <table>
            <tr>
                <td>
                    Question:</td>
           <td>
          <textarea rows="10" cols="100" name="a" ></textarea><br>
            <input type="submit" value="POST"  name="submit">
              <input type="reset" value="Reset"  name="reset">
              </td>
        </form>
</body>
</html>

