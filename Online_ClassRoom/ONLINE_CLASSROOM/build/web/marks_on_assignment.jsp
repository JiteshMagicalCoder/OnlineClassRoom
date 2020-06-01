<%-- 
    Document   : marks_on_assignment
    Created on : Mar 3, 2016, 9:36:59 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="marks.jsp" method="post">
    <center>

        <table bgcolor="cyan">
            <caption><font color="red">Give Marks</font></caption>
            <tr>
                <td>
                    Enter Student Id:  
                </td>
                <td>
                    <input type="text" name="sid" value="">   
                </td>
            </tr>
            <tr>
                <td>
                    Enter Marks:  
                </td>
                <td>
                    <input type="text" name="marks" value="">   
                </td>
            </tr>
             <td>
                    <input type="submit" name="submit" value="submit">
                </td>
            </tr>
        </table>
    </center>
</form>
    </body>
</html>
