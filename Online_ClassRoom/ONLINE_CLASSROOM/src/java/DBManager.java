/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author user
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBManager {

    private static final String DBdriver = "com.mysql.jdbc.Driver";
    private static final String DBurl = "jdbc:mysql://localhost/virtualclassroom";
    private static final String DBuser = "root";
    private static final String DBpassword = "root";
   static int count=1000;

    static {
        try {
            Class.forName(DBdriver);
        } catch (Exception ex) {
        }
    }
   public static int fchangepwd(String id, String npwd) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("update facultyregistration set Password=? where Fid=?");
            st.setString(1,npwd);
            st.setString(2,id);
            x = st.executeUpdate();
        } catch (Exception ex) {
        }
        return x;
    }
    public static int schangepwd(String id, String npwd) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("update registration set Password=? where StudentId=?");
            st.setString(1,npwd);
            st.setString(2,id);
            x = st.executeUpdate();
        } catch (Exception ex) {
        }
        return x;
    }
     public static int enroll(String id, String name, String subject,String Id) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("insert into enroll values(?,?,?,?)");
            st.setString(1,name);
            st.setString(2,subject);
            st.setString(3,id);
            st.setString(4, Id);
            x = st.executeUpdate();
        } catch (Exception ex) {
        }
        return x;
    }


    public static int adminLogin(String name, String pwd) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("select * from login where Id=? and Password=?");
            st.setString(1, name);
            st.setString(2, pwd);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = 1;

            }
            con.close();
            st.close();
        } catch (Exception ex) {
        }
        return x;
    }

    public static int registration(String name, String email, String pwd, String gender, String phoneNo, String address) {
        int x = 0;
        count=count+1;
        String id="S2016";
        id=id+count;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?)");
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, pwd);
            st.setString(4, gender);
            st.setString(5, phoneNo);
            st.setString(6, address);
            st.setString(7,"First Time Login");
            st.setString(8,id);
            x = st.executeUpdate();
        } catch (Exception ex) {
        }
        return x;
    }
    
     public static int registrationfaculty(String name,String fname, String email, String pwd, String gender,String ftype,String quali,String fspecial,String phone, String address) {
        int x = 0,y=0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("insert into facultyregistration (Name, EmailId, Password, Gender, Phone, Address, LastLogin, fathername, ftype, qualification, fspecial) values(?,?,?,?,?,?,?,?,?,?,?)");
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, pwd);
            st.setString(4, gender);
            st.setString(5, phone);
            st.setString(6, address);
            st.setString(7, "First Time Login");
            st.setString(8, fname);
            st.setString(9, ftype);
            st.setString(10, quali);
            st.setString(11, fspecial);
            PreparedStatement st1=con.prepareStatement("select * from facultyregistration where EmailId=?");
            st1.setString(1,email);
            ResultSet rs=st1.executeQuery();
            if(rs.next())
            {
               System.out.println(rs.getString("Name"));
               return 0;

            }
            else
            {
            x = st.executeUpdate();
            }
            
        } catch (Exception ex) {
        }
        return x;
    }
 /*   public static void main(String args[])
     {
     int x=DBManager.registrationfaculty("sandeep", "abc#", "123", "male", "12345", "dehradu","dkjsfldsd","jkdfjk","ldfklk","hjfd");
     System.out.println(x);
        
     }*/
     public static int getexamid(String sub) {
        int eid =0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("select * from exams where ExamName=?");
            st.setString(1,sub);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
               eid=rs.getInt("ExamId");
            }
           
        } catch (Exception ex) {
        }
        return eid;
    }


    public static String studentLogin(String id, String pwd) {
        String data = "";
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("select * from registration where EmailId=? and Password=?");
            st.setString(1, id);
            st.setString(2, pwd);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                data = rs.getString("Name");
                data = data + "/" + rs.getString("Lastlogin");
                data=data+"/"+rs.getString("StudentId");
                data=data+"/"+rs.getString("Password");
            }
            java.util.Date d = new java.util.Date();
            String date = d.toString();
            PreparedStatement st1 = con.prepareStatement("update registration set Lastlogin=? where EmailId=?");
            st1.setString(1, date);
            st1.setString(2, id);
            int x = st1.executeUpdate();
        } catch (Exception ex) {
        }
        return data;
    }
      public static String facultyLogin(String id, String pwd) {
        String data = "";
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("select * from facultyregistration where EmailId=? and Password=?");
            st.setString(1, id);
            st.setString(2, pwd);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                data = rs.getString("Name");
                data = data + "/" + rs.getString("LastLogin");
                data=data+"/"+rs.getString("Fid");
                data=data+"/"+rs.getString("Password");
            }
            java.util.Date d = new java.util.Date();
            String date = d.toString();
            PreparedStatement st1 = con.prepareStatement("update facultyregistration set Lastlogin=? where EmailId=?");
            st1.setString(1, date);
            st1.setString(2, id);
            int x = st1.executeUpdate();
        } catch (Exception ex) {
        }
        return data;
    }


    public static int addSubject(String subname) {
        int x =0;
        int id=0;
        try {

            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("insert into subject(SubjectName) values(?)");
            st.setString(1, subname);
            x = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }

    public static int deleteSubject(String subname) {
        int x=0;
        int sid=0;
        try {

            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("delete from subject where SubjectName=?");
            st.setString(1, subname);
            x = st.executeUpdate();
          
            
          

        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }

    public static int addQuestion(String SubName,String q, String a, String b, String c, String d, String ans,int eid) {
        int x = 0;
        int count = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st1 = con.prepareStatement("select * from questionbank where SubjectName=?");
            st1.setString(1,SubName);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                count++;

            }
            PreparedStatement st = con.prepareStatement("insert into questionbank values(?,?,?,?,?,?,?,?,?)");
            st.setInt(1, count + 1);
            st.setString(2, q);
            st.setString(3, a);
            st.setString(4, b);
            st.setString(5, c);
            st.setString(6, d);
            st.setString(7, ans);
            st.setString(8,SubName);
            st.setInt(9,eid);

            x = st.executeUpdate();
        } catch (Exception ex) {
        }
        return x;
    }
   
    public static int updateQuestion(String qno, String eid, String question, String optA, String opB, String opC, String opD, String ans) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("update questionbank set Question=?, OptionA=?, OptionB=?, OptionC=?, OptionD=?, Answer=? where QuestionNo=? and SubjectName=?");
            st.setString(1, question);
            st.setString(2, optA);
            st.setString(3, opB);
            st.setString(4, opC);
            st.setString(5, opD);
            st.setString(6, ans);
            st.setString(7, qno);
            st.setString(8,eid);
            x = st.executeUpdate();
            con.close();
            st.close();
        } catch (Exception ex) {
        }
        return x;
    }

    public static int deletestudent(String email) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("Delete  from registration where EmailId=?");
            st.setString(1, email);
            x = st.executeUpdate();
        } catch (Exception ex) {

        }
        return x;
    }
    public static int deletefaculty(String email) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("Delete  from facultyregistration where EmailId=?");
            st.setString(1, email);
            x = st.executeUpdate();
        } catch (Exception ex) {

        }
        return x;
    }
     public static int deletenotes(int note) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("Delete  from add_note where idadd_note=?");
            st.setInt(1,note);
            x = st.executeUpdate();
        } catch (Exception ex) {

        }
        return x;
     }
      public static int deleteassign(int note) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("Delete  from assignment where idassignment=?");
            st.setInt(1,note);
            x = st.executeUpdate();
        } catch (Exception ex) {

        }
        return x;
     }
    

    public static int deleteQuestion(String qno) {
        int x = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("Delete from questionbank where QuestionNo=?");
            st.setString(1, qno);
            x = st.executeUpdate();
        } catch (Exception ex) {
        }
        return x;
    }

    public static int chooseid(String sub) {
        int x = 0, id = 0;
        try {
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement st = con.prepareStatement("select * from exams where ExamName=?");
            st.setString(1, sub);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("ExamId");

            }
        } catch (Exception ex) {
        }
        return id;
    }

}
