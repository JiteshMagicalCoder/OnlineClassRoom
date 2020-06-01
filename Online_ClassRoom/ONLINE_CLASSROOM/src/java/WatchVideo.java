/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class WatchVideo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                PreparedStatement st = con.prepareStatement("select * from videos");
                ResultSet rs = st.executeQuery();
                out.println("<br><br><br>");
                out.println("<center>");
                out.println("<table border=\"1\" bgcolor=\"cyan\" height=\"50\" width=\"600\">");
                out.println("<tr>");
                out.println("<th>");
                out.println("S NO");
                out.println("</th>");
                 out.println("<th>");
                out.println("SUBJECT");
                out.println("</th>");
                out.println("<th>");
                out.println("TOPIC");
                out.println("</th>");
                out.println("<th>");
                out.println("VIDEO URL");
                out.println("</th>");
                out.println("</tr>");
                int i=1;
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("<center>");
                    out.println(i);
                    out.println("</center>");
                    out.println("</td>");
                    out.println("<td>");
                    out.println("<center>");
                    out.println(rs.getString("subject"));
                    out.println("</center>");
                    out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("topic"));
                    out.println("</td>");
                    out.println("<td>");
                    String url=rs.getString("url");
                    out.println(url);
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<script>");
                    out.println("</script>");
                  i++;
                }
                out.println("</table>");
                out.println("<br><br><br>");
                out.println("Click Here to Student Home Page:<a href=\"studenthome.jsp\">click here</a>");

                out.println("</center>");
               
                

            } catch (Exception e) {
                System.out.println(e);
            }

        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
