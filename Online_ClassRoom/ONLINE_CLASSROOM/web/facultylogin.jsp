<%-- 
    Document   : facultylogin
    Created on : Feb 22, 2016, 10:23:59 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Login</title>
    </head>
   <body background="background.jpg">
            <br><br><br><br>
         


        <center>
            <fieldset style="width: 400px; height: 300px; border-width:5px;border-radius: 20px;
                      border-color: yellow; color: blue; margin-top: 1%;
                      margin-left: 2%;"><legend> Login here! </legend>
                <form action="FacultyLogin" method="post"/>
                <img src="image/facultyzone.PNG" height="150" width="400">
                <table> 
                    <tr>
                        <th> User Id: </th>
                        <td> <input type="text" name="id" required=""> </td>  
                        </th>
                    </tr>

                    <tr>
                        <th> Password: </th>
                        <td> <input type="password" name="pwd" required=""> </td>  
                        </th>
                    </tr>

                    <tr>

                        <td style="text-align: center;" colspan="1">
                            <input type="submit" value="Login"></td> 
                        <td><input type="reset" value="Reset"> </td>

                    </tr>
                </table>

                </form>
            </fieldset>
        </center>
        </body>
</html>
