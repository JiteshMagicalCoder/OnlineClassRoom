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
 * @author RAVI
 */
public class exam extends HttpServlet {

    int x = 0;
    String button = "", sub = "",error="";
    int duration = 0, question = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        sub = request.getParameter("subject");
        duration = Integer.parseInt(request.getParameter("duration"));
        question = Integer.parseInt(request.getParameter("question"));
        button = request.getParameter("topics");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            if (button.equalsIgnoreCase("ADD"))
            {
                PreparedStatement st1 = con.prepareStatement("select * from exams");
                int count = 0;
                ResultSet rs = st1.executeQuery();
                while (rs.next())
                {
                    if (rs.getString("ExamName").equalsIgnoreCase(sub)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Duplicate data');");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("exam.jsp");
                        rd.include(request, response);

                    } 
                    else {
                        count++;
                    }
                }
                PreparedStatement st = con.prepareStatement("insert into exams values(?,?,?,?)");
                st.setInt(1, count + 1);
                st.setString(2, sub);
                st.setInt(3, question);
                st.setInt(4, duration);
                int x = st.executeUpdate();

                if (x == 1) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Exam added successfully');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("exam.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('server error..');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("exam.jsp");
                    rd.include(request, response);
                }
            } 
            else
            {
                PreparedStatement st = con.prepareStatement("update exams set NumberOfQuestions=?, Duration=? where ExamName=? ");
                st.setInt(1,question );
                st.setInt(2,duration );
                st.setString(3,sub);
                x = st.executeUpdate();

                if (x == 1)
                {

                    out.println("<script type='text/javascript'>");
                    out.println("alert('Exam Updated SuccessFully');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("exam.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Oops!,some thing going wrong')");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("exam.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddTopic.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddTopic.class.getName()).log(Level.SEVERE, null, ex);
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
