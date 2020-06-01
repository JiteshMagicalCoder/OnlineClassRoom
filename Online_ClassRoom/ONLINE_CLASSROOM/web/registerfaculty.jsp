<%-- 
    Document   : registerfaculty
    Created on : Feb 22, 2016, 10:43:29 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="background.jpg">
    <center>
        <fieldset style="width: 400px; height: 400px; border-width:5px;border-radius: 20px;
                  border-color: yellow; color: blue; margin-top: 1%;
                  margin-left: 2%;"><legend> Registration </legend>
            <form action="FacultyRegistration" method="post"/>
            <h1> Registration form </h1>
            <table> 
                <tr>
                    <th> Name: </th>
                    <td> <input type="text" name="name" required=""> </td>  
                    </th>
                </tr>
                          <tr>
                    <th>Father Name: </th>
                    <td> <input type="text" name="fathername" required=""> </td>  
                    </th>
                </tr>
                <tr>
                    <th> Email Id: </th>
                    <td> <input type="text" name="emailid" required="" placeholder="hint:jitesh@gmail.com"> </td>  
                    </th>
                </tr>

                <tr>
                    <th> Password: </th>
                    <td> <input type="password" name="password" required=""> </td>  
                    </th>
                </tr>

                <tr>
                    <th> Gender: </th>
                    <td> <input type="radio" name="gender" value="Male" required=""> Male
                        <input type="radio" name="gender" value="Female" required=""> Female
                    </td>  

                    </th>
                </tr>
                
                       <tr>
                    <th>Type: </th>
                    <td> <select type="combo" name="type" required=""> 
                            <option readonly >Select </option>
                            <option>Permanent</option>
                            <option>Temporary</option>
                    
                    </td>  
                    </th>
                       <tr>
                    <th>Qualification: </th>
                    <td> <input type="text" name="qualification" required=""> </td>  
                    </th>
                         <tr>
                    <th>Specialization: </th>
                    <td> <input type="text" name="special" required=""> </td>  
                    </th>

                <tr>
                    <th> Phone no: </th>
                    <td> <input type="text" name="phoneno" maxlength="10" required=""> </td>  
                    </th>
                </tr>
                 <tr>
                    <th> Address: </th>
                    <td> <textArea name="address" required=""> </textArea> </td>  
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
