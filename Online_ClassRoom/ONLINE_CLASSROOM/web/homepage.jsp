<%-- 
    Document   : homepage
    Created on : Feb 28, 2016, 2:50:24 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
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
            <center>
                <!---------------------------------------------display current date-------------------------------->
                <h3>
                    <font color="red">
                        <script type="text/javascript">
                            var m_names = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
                            var d = new Date();
                            var curr_date = d.getDate();
                            var curr_month = d.getMonth();
                            var curr_year = d.getFullYear();
                            document.write(curr_date + "-" + m_names[curr_month] + "-" + curr_year);
                        </script>
                    </FONT>
                </h3>
            </center>   

            <div class="content">
                <div class="content_bg">
                    <div class="mainbar">
                        <table border="0">
                            <tr>
                                <td>
                                    <img src="image1/image1.PNG"  width="650" height="250" id="rotator1">
                                        <script type="text/javascript">
                                            (function () {
                                                var rotator = document.getElementById('rotator1');
                                                var imageDir = 'image1/';
                                                var delayInSeconds = 4;
                                                var images = ['image2.PNG', 'image3.PNG', 'image3.PNG', 'image4.PNG', 'image5.PNG', 'image6.PNG', 'image1.PNG'];
                                                var num = 0;
                                                var changeImage = function () {
                                                    var len = images.length;
                                                    rotator.src = imageDir + images[num++];
                                                    if (num == len) {
                                                        num = 0;
                                                    }
                                                };
                                                setInterval(changeImage, delayInSeconds * 1000);
                                            })();
                                        </script>
                                </td>
                            </tr>
                        </table>


                    </div>

                    <div class="article">
                        <table border="1" bgcolor="#00FFFF" height="200" width="220">
                            <caption> <font color="#000000"><u>Thought Of The Day </u></font></caption>
                            <tr>
                                <td>
                                    <h4>
                                        <font color="blue">
                                            A mind once stretched by a new idea never returns to its original dimensions.<br> 
                                        </font>
                                    </h4>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <br><br></br>
            <font color="blue">
                <b>
            We provides easy and point to point learning of Technical as well as Aptitude Topics. In this classroom you will get class by well qualified faculty members.
            During the Course you will get Intractive classroom session with the faculty members who have rich experience regarding the subject.In each course we also provide
            online test facility for student to check what They Learn.<br>
                </b>
            </font>
                <font color="bule">For More Detail:</font><a href="detail.jsp"><font color="red">click here</font></a>
                <br><br>
          <%! int idhitcount;int visiters = 0;%>

          <%
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from hitcount");
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    int idhitcount = rs.getInt("idhitcount");
                    visiters = idhitcount + 1;
                    PreparedStatement st1 = con.prepareStatement("update hitcount set idhitcount=?");
                    st1.setInt(1, visiters);
                    int x = st1.executeUpdate();

                }


            %>


    <center>
        
        <h6><font color="black"> All right reserved &COPY; JRS Group</font> </h6>
        <h4><font color="blue"> TOTAL VISITERS:<%=visiters%> </font></h4>
      
    </center>       
                
        </div>
        

    </body>

</html>