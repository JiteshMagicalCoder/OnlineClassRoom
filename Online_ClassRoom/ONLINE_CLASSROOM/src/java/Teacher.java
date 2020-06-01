/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class Teacher extends HttpServlet {

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
            throws ServletException, IOException, SQLException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name="";
        String fname="";
        String button=request.getParameter("bt");
        fname=request.getParameter("teacher");
        name=request.getParameter("subject");
        out.println("<center>");
        if(button.equals("Go"))
        {
           
            
            if (name == null) {

            } 
            else
            {
                if (name.equalsIgnoreCase("select")) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('choose valid subject...');");
                    out.println("</script>");
                      RequestDispatcher rd = request.getRequestDispatcher("subjectalloatment.jsp");
                      rd.include(request, response);

             } else 
                {
                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                    PreparedStatement st1 = con1.prepareStatement("select * from subjectteacher where subject=?");
                    st1.setString(1,name);
                    ResultSet rs1 = st1.executeQuery();
                    out.print("<table border='1' bgcolor='pink' width='600'>");
                    out.print("<th>");
                    out.print("S.No.");
                    out.print("</th>");
                    out.print("<th>");
                    out.print("Teacher Id");
                    out.print("</th>");
                    out.print("<th>");
                    out.print("Teacher Name");
                    out.print("</th>");
                    int i = 1;
                    while (rs1.next()) {
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(i);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rs1.getString("id"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rs1.getString("name"));
                        out.print("</td>");

                        i++;
                    }
                    out.println("</table>");
                }
            }
        }
        else
        {
            
            if (fname == null) {

            } 
            else
            {
                if (fname.equalsIgnoreCase("select")) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('choose valid name...');");
                    out.println("</script>");
                      RequestDispatcher rd = request.getRequestDispatcher("subjectalloatment.jsp");
                      rd.include(request, response);

             } else 
                {
                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
                    PreparedStatement st1 = con1.prepareStatement("select * from subjectteacher where Name=?");
                    st1.setString(1,fname);
                    ResultSet rs1 = st1.executeQuery();
                    out.print("<table border='1' bgcolor='pink' width='600'>");
                    out.print("<th>");
                    out.print("S.No.");
                    out.print("</th>");
                    out.print("<th>");
                    out.print("SUBJECT");
                    out.print("</th>");
                    int i = 1;
                    while (rs1.next()) {
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(i);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(rs1.getString("subject"));
                        out.print("</td>");

                        i++;
                    }
                    out.println("</table>");
                }
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Teacher.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Teacher.class.getName()).log(Level.SEVERE, null, ex);
        }
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
