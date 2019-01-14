package dhsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dhsp.dbtasks.CrudOperation;

/**
 * Servlet implementation class Deleteupdateemployee
 */
@WebServlet("/Deleteupdateemployee")
public class Deleteupdateemployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection con;
       private PreparedStatement ps;
       private ResultSet rs; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deleteupdateemployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con=CrudOperation.createConnection();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
    String eid=request.getParameter("did");
    System.out.println(eid);
     String str="select * from employee_details where EmpId=?"; 
        try {
			ps=con.prepareStatement(str);
			ps.setString(1, eid);
		    rs=ps.executeQuery();
			while(rs.next())
			{
			
			String name=rs.getString("Empname");
			String add=rs.getString("Address");
			int exp=rs.getInt("Experience");
			int num=rs.getInt("Contactno");
			String photo=rs.getString("Photo");
			String data=name+"#"+add+"#"+exp+"#"+num+"#"+photo;
			System.out.println(data);
			out.println(data);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
         

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
