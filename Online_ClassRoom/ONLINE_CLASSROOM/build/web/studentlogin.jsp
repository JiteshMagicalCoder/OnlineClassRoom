<%-- 
    Document   : StudentLogin
    Created on : Feb 10, 2016, 1:30:28 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h<tml>
        <head>
            <title>Student Login</title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
        <body background="background.jpg">
            <br><br><br><br>
         


        <center>
            <fieldset style="width: 400px; height: 300px; border-width:5px;border-radius: 20px;
                      border-color: yellow; color: blue; margin-top: 1%;
                      margin-left: 2%;"><legend> Login here! </legend>
                <form action="StudentLogin" method="post"/>
                <img src="image/studentzone.PNG" height="150" width="400">
                <table> 
                    <tr>
                        <th> User Id: </th>
                        <td> <input type="text" name="id"> </td>  
                        </th>
                    </tr>

                    <tr>
                        <th> Password: </th>
                        <td> <input type="password" name="pwd"> </td>  
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

