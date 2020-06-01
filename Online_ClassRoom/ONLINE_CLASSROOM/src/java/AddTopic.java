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
public class AddTopic extends HttpServlet {

    int x = 0;
    String button="", sub="", topic="", turl="",error="";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        sub = request.getParameter("subject");
        topic = request.getParameter("topic");
        turl = request.getParameter("topicurl");
        button = request.getParameter("topics");
     
        if(sub.equalsIgnoreCase(""))
            error+="Enter Subject Name\n";
        if(topic.equalsIgnoreCase(""))
            error+="Enter Topic Name\n";
        if(turl.equalsIgnoreCase(""))
            error+="Enter Topic Url\n";

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclass", "root", "root");
        if (!error.equalsIgnoreCase("")) 
        {
            out.println("<script type='text/javascript'>");
            out.println("alert('All Fields are Required');");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("Addtopic.jsp");
            rd.include(request, response);
        }
        else 
        {
            if (button.equalsIgnoreCase("ADD")) 
            {
                PreparedStatement st1 = con.prepareStatement("select * from subjecttopics");
                int count = 0;
                ResultSet rs = st1.executeQuery();
                while (rs.next()) 
                {
                    if(rs.getString("TopicName").equalsIgnoreCase(topic)&&rs.getString("SubjectName").equalsIgnoreCase(sub))
                    {
                     out.println("<script type='text/javascript'>");
                     out.println("alert('Duplicate data');");
                     out.println("</script>");
                     RequestDispatcher rd = request.getRequestDispatcher("Addtopic.jsp");
                     rd.include(request, response);
                     
                    }
                    else
                    {
                      count++;
                    }
                }
                PreparedStatement st = con.prepareStatement("insert into subjecttopics values(?,?,?,?)");
                st.setInt(1, count + 1);
                st.setString(2, sub);
                st.setString(3, topic);
                st.setString(4, turl);
                int x = st.executeUpdate();

                if (x == 1)
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('topic added successfully');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("Addtopic.jsp");
                    rd.include(request, response);
                } 
                else
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('server error..');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("Addtopic.jsp");
                    rd.include(request, response);
                }
            }
            else 
            {
                PreparedStatement st = con.prepareStatement("delete from subjecttopics where SubjectName=? and TopicName=? and TopicUrl=?");
                st.setString(1, sub);
                st.setString(2, topic);
                st.setString(3, turl);
                x = st.executeUpdate();

                if (x == 1)
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('topic deleted successfully');");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("Addtopic.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Oops!,Select valid data')");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("Addtopic.jsp");
                    rd.include(request, response);
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
