/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class Fchange extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("sid");
        String pwd = request.getParameter("pwd");
        String opwd = request.getParameter("opwd");
        String npwd = request.getParameter("npwd");
        String ncpwd = request.getParameter("ncpwd");
        if (pwd.equals(opwd)) {
            if (npwd.equals(ncpwd)) {
                int x = DBManager.fchangepwd(id, npwd);
                if (x == 1) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert(\"Password changed successfully\");");
                    out.println("</script>");
 
                    RequestDispatcher rd = request.getRequestDispatcher("fchangepwd.jsp");
                    rd.include(request, response);
                } 
                else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('server error');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("fchangepwd.jsp");
                    rd.include(request, response);
                }
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('confirm password not matched');");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("fchangepwd.jsp");
                rd.include(request, response);
            }
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Old Password not matched');");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("fchangepwd.jsp");
            rd.include(request, response);
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
