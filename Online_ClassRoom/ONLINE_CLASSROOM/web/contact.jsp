<%-- 
    Document   : contact
    Created on : Feb 28, 2016, 3:24:31 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Virtual ClassRoom</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
    </head>
    <body>
        <div class="main">
            <div class="header">
                <div class="logo">
                    <h1><a href="index.html"><span><img src="images/logo.PNG" height="50" width="200"></img></span><small><b><font color="red">Excellence with V</font></b></small></a></h1>
                </div>
                <div class="menu_nav">
                    <ul>
                        <li class="active"><a href="homepage.jsp">Home</a></li>
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="contact.jsp">Contact Us</a></li>
                    </ul>
                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
                <div class="hbg"><img src="images/image4.PNG" width="653" height="271" alt="" />
                    <div class="text">
                        <h3>Creating Futures</h3>
                    </div>
                </div>
 </div>
   <form action="#" method="post" id="leavereply">
            <ol>
              <li>
                <label for="name">Name (required)</label>
                <input id="name" name="name" class="text" required=""/>
              </li>
              <li>
                <label for="email">Email Address (required)</label>
                <input id="email" name="email" class="text" required=""/>
              </li>
              <li>
                <label for="message">Your Message</label>
                <textarea id="message" name="message" rows="8" cols="50" required=""></textarea>
              </li>
              <li>
                <input type="image" name="imageField" id="imageField" src="images/submit.gif" class="send" />
                <div class="clr"></div>
              </li>
            </ol>
          </form>
    </body>
</html>