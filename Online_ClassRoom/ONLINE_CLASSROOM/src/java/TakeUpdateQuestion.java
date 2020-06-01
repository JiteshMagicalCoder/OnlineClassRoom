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
public class TakeUpdateQuestion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String QNo=request.getParameter("qno");
        String  sid=request.getParameter("sub");
        String Question = request.getParameter("question");
        String opA = request.getParameter("opA");
        String opB = request.getParameter("opB");
        String opC = request.getParameter("opC");
        String opD = request.getParameter("opD");
        String ans = request.getParameter("ans");

       int x = DBManager.updateQuestion(QNo,sid,Question, opA, opB, opC, opD, ans);
        if (x == 1) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Update Successfull');");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("Updatequestion.jsp");
            rd.include(request, response);
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('OOps! try again');");
            out.println("</script>");
            out.print("Question Update Unsuccessfull");
            RequestDispatcher rd = request.getRequestDispatcher("Updatequestion.jsp");
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
