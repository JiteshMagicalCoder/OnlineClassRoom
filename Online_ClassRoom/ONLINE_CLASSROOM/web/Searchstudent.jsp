<%-- 
    Document   : Searchstudent
    Created on : Feb 11, 2016, 3:02:56 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Student</title>
    </head>
    <body background="background.jpg">

    <center>
        <form action="SearchStudent" method="post">
            <table>
                <tr>
                    <td>
                        Enter Student Name:
                    </td>
                    <td>
                        <input type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Search">
                    </td>
                </tr>
            </table> 
        </form>

    </center>
</body>
</html>
