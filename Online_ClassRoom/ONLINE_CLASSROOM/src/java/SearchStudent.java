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
public class SearchStudent extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
        String name=request.getParameter("name");
         try{
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/virtualclass", "root", "root");
            PreparedStatement st1 = con1.prepareStatement("select * from registration where Name=?");
            st1.setString(1, name);
            ResultSet rs1 = st1.executeQuery();
            out.print("<center>");

            out.print("<form bgcolor='pink'  action='Searchstudent.jsp'>");

            out.print("<table border='1'>");
            out.print("<th>");
            out.print("Name");
            out.print("</th>");
            out.print("<th>");
            out.print("Email Id");
            out.print("<th>");
            out.print("Password");
            out.print("</th>");
            out.print("<th>");
            out.print("Gender");
            out.print("</th>");
            out.print("<th>");
            out.print("Phone No");
            out.print("</th>");
            out.print("<th>");
            out.print("Address");
            out.print("</th>");

            while (rs1.next()) {
                out.print("<tr>");
                out.print("<td>");
                out.print(rs1.getString("Name"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("EmailId"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("Password"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("Gender"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("PhoneNo"));
                out.print("</td>");
                out.print("<td>");
                out.print(rs1.getString("Address"));
                out.print("</td>");

                out.print("</tr>");
            }
            con1.close();
            st1.close();
            out.print("</table>");
            out.println("<input type='submit' value='Back'>");
            out.print("</form >");
            out.print("</center>");
         }
         catch(Exception ex){}
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
