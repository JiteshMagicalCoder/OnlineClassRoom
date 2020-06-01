<%-- 
    Document   : notesdownload
    Created on : Feb 29, 2016, 8:43:09 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int BUFFER_SIZE = 4096;	
            try 
            {
                   int id=Integer.parseInt(request.getParameter("nid"));
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom","root","root");
			//String sql = "SELECT * FROM  image WHERE id = ?";
			PreparedStatement statement = con.prepareStatement("select * from add_note where idadd_note=?");
			statement.setInt(1,id);
                        
			ResultSet result = statement.executeQuery();
                      
			if (result.next()) {
                                 String fileName = result.getString("NotesFile");
				Blob blob = result.getBlob("Notes");
				InputStream inputStream = blob.getBinaryStream();
				int fileLength = inputStream.available();
				
				System.out.println("fileLength = " + fileLength);

				ServletContext context = getServletContext();

				// sets MIME type for the file download
				String mimeType = context.getMimeType(fileName);
				if (mimeType == null) {			
					mimeType = "application/octet-stream";
				}				
				
				response.setContentLength(fileLength);
				response.setContentLength(fileLength);
				String headerKey = "Content-Disposition";
                                response.setContentType(mimeType);
				response.setContentLength(fileLength);
				String headerValue = String.format("attachment; filename=\"%s\"", fileName);
				response.setHeader(headerKey, headerValue);

				// writes the file to the client
				OutputStream outStream = response.getOutputStream();
				
				byte[] buffer = new byte[BUFFER_SIZE];
				int bytesRead = -1;
				
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
				
				inputStream.close();
				outStream.close();				
			} else {
				// no file found
				//response.getWriter().print("File not found for the id: " + uploadId);	
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			response.getWriter().print("SQL Error: " + ex.getMessage());
		} 
             
	
        %>
    </body>
</html>
