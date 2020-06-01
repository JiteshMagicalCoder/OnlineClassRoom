<%-- 
    Document   : Registration
    Created on : Feb 10, 2016, 1:39:54 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body background="background.jpg">

       

    <center>
        <fieldset style="width: 300px; height: 300px; border-width:5px;border-radius: 20px;
                  border-color: yellow; color: blue; margin-top: 1%;
                  margin-left: 2%;"><legend> Registration </legend>
            <form action="Registration" method="post"/>
            <h1> Registration form </h1>
            <table> 
                <tr>
                    <th> Name: </th>
                    <td> <input type="text" name="name" required=""> </td>  
                    </th>
                </tr>
                
                 <tr>
                    <th> Email Id: </th>
                    <td> <input type="text" name="emailId" required="" placeholder="hint: jitesh@gmail.com"> </td>  
                    </th>
                </tr>

                <tr>
                    <th> Password: </th>
                    <td> <input type="password" name="pwd" required=""> </td>  
                    </th>
                </tr>

                <tr>
                    <th> Gender: </th>
                    <td> <input type="radio" name="gender" value="Male"> Male
                        <input type="radio" name="gender" value="Female"> Female
                    </td>  

                    </th>
                </tr>


                <tr>
                    <th> Mobile no: </th>
                    <td> <input type="text" name="phoneNo" maxlength="10" required="" placeholder=" Must be 10 digits"> </td>  
                    </th>
                </tr>

                <tr>
                    <th> Address: </th>
                    <td> <input type="text" name="address" required=""> </td>  
                    </th>
                </tr>

                <tr>
                    <td></td>
                    <td style="text-align: center;">
                        <input type="submit" value="Register" > 
                        <input type="reset" value="Reset"></td>  
                </tr>
            </table>

            </form>
        </fieldset>
    </center>
    <center>
    <footer>
        <hr>
        <a href="AdminHome.jsp"><Button >Back</Button> </a>
    </footer>   
    </center>
</body>
</html>

