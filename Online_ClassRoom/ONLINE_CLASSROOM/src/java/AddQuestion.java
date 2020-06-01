/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.jdt.internal.compiler.classfmt.ClassFileConstants;

/**
 *
 * @author user
 */
public class AddQuestion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String subName = request.getParameter("subName");
        String q = request.getParameter("q");
        String a = request.getParameter("a");
        String b = request.getParameter("b");
        String c = request.getParameter("c");
        String d = request.getParameter("d");
        String ans = request.getParameter("ans");
        if (subName.equalsIgnoreCase("select") || q.equalsIgnoreCase("") || a.equalsIgnoreCase("") || b.equalsIgnoreCase("") || c.equalsIgnoreCase("") || d.equalsIgnoreCase("") || ans.equalsIgnoreCase("")) {
            out.println("<script type='text/javascript'>");
            out.println("alert('All Fields are Required');");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("Addquestion.jsp");
            rd.include(request, response);
        } 
        else 
        {
              int eid=DBManager.getexamid(subName);
              int x = DBManager.addQuestion(subName,q, a, b, c, d, ans,eid);
               
                if (x == 1)
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Question added successfully');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("Addquestion.jsp");
                    rd.include(request, response);
                    
                } 
                else 
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Server Problem...');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("Addquestion.jsp");
                    rd.include(request, response);

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
