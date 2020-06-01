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
 * @author RAVI
 */
public class SearchQuestion extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String subject = request.getParameter("sub");
        String Question = request.getParameter("question");

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclass", "root", "root");
            PreparedStatement st = con.prepareStatement("Select * from questionbank where Question=? and SubjectName=?");
            st.setString(1, Question);
            st.setString(2, subject);
            ResultSet rs = st.executeQuery();

            out.print("<br><br><br>");
            out.print("<body bgcolor='pink'>");
           
            out.print("<center>");
            out.print("<form action='SearchQuestion.jsp'>"); 
            out.print("<table>");
            while (rs.next()) {
                out.print("<tr>");
                out.print("<td>");
                out.print("Question");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type='textArea' style='width: 400px; height: 100px;' name='question' value='" + rs.getString("Question") + "'>");
                out.print("</td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td>");
                out.print("Option A");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type='text' name='opA' value='" + rs.getString("OptionA") + "'>");
                out.print("</td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td>");
                out.print("Option B");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type='text' name='opB' value='" + rs.getString("OptionB") + "'>");
                out.print("</td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td>");
                out.print("Option C");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type='text' name='opC' value='" + rs.getString("OptionC") + "'>");
                out.print("</td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td>");
                out.print("Option D");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type='text' name='opD' value='" + rs.getString("OptionD") + "'>");
                out.print("</td>");
                out.print("</tr>");
                out.print("<tr>");
                out.print("<td>");
                out.print("Answer");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type='text' name='ans' value='" + rs.getString("Answer") + "'>");
                out.print("</td>");
                out.print("</tr>");
            }
            out.print("<tr>");
            out.print("<td></td>");
            out.print("<td>");
            
            out.print("</td>");
            out.print("</tr>");
            out.print("</table>");
            out.print("<input type='submit' value='Back'>");
            out.print("</form>");
            out.print("<center>");
           
            
           
        } catch (Exception ex) {
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
