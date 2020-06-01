<%-- 
    Document   : fchangepwd
    Created on : Mar 4, 2016, 1:53:59 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="background.jpg">
    <center>
        <%! String id = "",pwd="";%>
        <% id = session.getAttribute("fid").toString();
           pwd=session.getAttribute("fpwd").toString();
        %>
        <form action="Fchange" method="post">
            <table>
                <caption>Change Password</caption>
                <tr>
                    <td>
                        Old Password:
                    </td>
                    <td>
                        <input type="text" name="opwd" value="" required="">
                    </td> 
                </tr>
                <tr>
                    <td>
                        New Password:
                    </td>
                    <td>
                        <input type="text" name="npwd" value="" required="">
                    </td> 
                </tr>
                <tr>
                    <td>
                        Confirm Password:
                    </td>
                    <td>
                        <input type="text" name="ncpwd" value="" required="">
                    </td> 
                </tr>
                <tr>
                    <td colspan="0">

                    </td>
                <center>
                    <td>
                        <input type="hidden" name="sid" value=<%=id%>>
                         <input type="hidden" name="pwd" value=<%=pwd%>>
                        <input type="submit" namep="submit" value="submit">
                        <input type="reset" name="reset" value="reset">
                    </td>
                </center>

                </tr>
            </table>
        </form>
    </center>
</body>
</html>
