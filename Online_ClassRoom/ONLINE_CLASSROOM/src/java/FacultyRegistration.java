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
public class FacultyRegistration extends HttpServlet {

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
        String name=request.getParameter("name");
        String fname=request.getParameter("fathername");
        String email=request.getParameter("emailid");
        String pwd=request.getParameter("password");
        String gen=request.getParameter("gender");
        String ftype=request.getParameter("type");
        String quali=request.getParameter("qualification");
        String fspecial=request.getParameter("special");
        String phone=request.getParameter("phoneno");
        String add=request.getParameter("address");
        
        
        int x=DBManager.registrationfaculty(name, fname, email, pwd, gen, ftype, quali, fspecial, phone, add);
        
        if(x==1)
        {
            out.print("<center>Registration Successfull</center>");
            RequestDispatcher rd=request.getRequestDispatcher("registerfaculty.jsp");
            rd.include(request, response);
        }
        else
        {
            out.print("<center>Faculty Already Registered</center>");
            RequestDispatcher rd=request.getRequestDispatcher("registerfaculty.jsp");
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
