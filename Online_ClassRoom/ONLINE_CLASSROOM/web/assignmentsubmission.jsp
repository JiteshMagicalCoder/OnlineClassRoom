<%-- 
    Document   : assignmentsubmission
    Created on : Feb 29, 2016, 9:06:56 AM
    Author     : user
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>

    <body bgcolor="pink">
        <%
            String fname = request.getParameter("fname");
            String subject = request.getParameter("subname");
            String sid = request.getParameter("sid");
            String image1 = request.getParameter("notes");
            java.util.Date d = new java.util.Date();
            String date = d.toString();
            String file = image1;
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/virtualclassroom";//Here the "test" is the Database name
            FileInputStream fis = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, "root", "root");
                String path = "D://" + image1;
                File image = new File(path);
                pstmt = conn.prepareStatement("insert into assignmentsresponse(StudentId,StudentName,SubjectName,Response,submissionOn,FileName) values(?,?,?,?,?,?)");
                pstmt.setString(1,sid);
                pstmt.setString(2, fname);
                pstmt.setString(3, subject);
                pstmt.setString(5, date);
                pstmt.setString(6, file);
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(4, (InputStream) fis, (int) (image.length()));
                int count = pstmt.executeUpdate();
                if (count > 0) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('assignment submitted Successfully');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("submitassignment.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Notes Not ADDED');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("submitassignment.jsp");
                    rd.include(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (pstmt != null) {
                        pstmt.close();
                        pstmt = null;
                    }
                    if (conn != null) {
                        conn.close();
                        conn = null;
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

        %>
    </body>
</html>

