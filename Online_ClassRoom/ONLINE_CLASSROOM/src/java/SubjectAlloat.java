/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
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
public class SubjectAlloat extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String  error="";
        int x=0;
        String  sub = request.getParameter("subname");
        String  id = request.getParameter("fid");
        String name=request.getParameter("fname");
        if(id.equalsIgnoreCase(""))
            error+="id not found\n";
        if(sub.equalsIgnoreCase("select"))
            error+="sub not found";
        if(name.equalsIgnoreCase(""))
            error+="name not found";
       
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost/virtualclassroom", "root", "root");
            if (!error.equalsIgnoreCase(""))
            {
                out.println("<script type='text/javascript'>");
                out.println("alert('All Fields are Required');");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("subjectalloatment.jsp");
                rd.include(request, response);
            }
            
             else 
             {
                    
                    try
                    {
                       PreparedStatement st = con.prepareStatement("insert into subjectteacher values(?,?,?)");
                       st.setString(1,id);
                       st.setString(2,name); 
                       st.setString(3,sub);
                       x=st.executeUpdate();
                    }
                    catch(Exception e)
                    {
                        
                    }
                    if (x==1) 
                    {
                       out.println("<script type='text/javascript'>");
                       out.println("alert('subject alloated successfully');");
                       out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("subjectalloatment.jsp");
                        rd.include(request, response);
                    } 
                    else 
                    {
                  
                        out.println("<script type='text/javascript'>");
                        out.println("alert('This Subject Allready alloted to this faculty..');");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("subjectalloatment.jsp");
                        rd.include(request, response);
                    }

              } 
          
          
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectAlloat.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectAlloat.class.getName()).log(Level.SEVERE, null, ex);
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
