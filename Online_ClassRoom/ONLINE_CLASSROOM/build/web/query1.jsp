<%-- 
    Document   : query1
    Created on : Mar 2, 2016, 10:22:05 PM
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
    <body>
        <%! int x=0,fid=0;String subject=" "; String user;String id;String queries;%>
        <%
            user = session.getAttribute("fname").toString();
            id = session.getAttribute("femail").toString();
            queries = request.getParameter("a");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            PreparedStatement st1=con.prepareStatement("select * from facultyregistration where EmailId=?");
            st1.setString(1,id);
            ResultSet rs =st1.executeQuery();
            int count =0;
            if(rs.next())
            {
              fid=rs.getInt("Fid");
            }
            
            PreparedStatement st=con.prepareStatement("insert into askadmin(Fid,Fname,EmailId,Query) values(?,?,?,?)");
            st.setInt(1,fid);
            st.setString(2,user);
            st.setString(3,id);
            st.setString(4,queries);
            x=st.executeUpdate();
            if(x==1)
            {
                out.println("Query submitted");
            }
            else
            {
                out.println("somethig going worong");
            }
        %>
        
   
</body>
</html>
