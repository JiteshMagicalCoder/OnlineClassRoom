<%-- 
    Document   : insertimage
    Created on : Feb 25, 2016, 9:49:56 PM
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

    <body>
        <%
            String fname = request.getParameter("fname");
            String tname = request.getParameter("tname");
            String subject = request.getParameter("subname");
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
                pstmt = conn.prepareStatement("insert into add_note(FacultyName,SubjectName,TOpicName,NotesFile,Notes,UpdatedOn) values(?,?,?,?,?,?)");
                pstmt.setString(1, fname);
                pstmt.setString(2, subject);
                pstmt.setString(3, tname);
                pstmt.setString(4, file);
                pstmt.setString(6, date);
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(5, (InputStream) fis, (int) (image.length()));
                int count = pstmt.executeUpdate();
                if (count > 0) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Notes Added Successfully');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("notes.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Notes Not ADDED');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("notes.jsp");
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

