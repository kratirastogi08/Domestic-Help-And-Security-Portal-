package dhsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dhsp.dbtasks.CrudOperation;

import java.sql.*;
/**
 * Servlet implementation class Composecheck
 */
@WebServlet("/Composecheck")
public class Composecheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
       
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Composecheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con=CrudOperation.createConnection();
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String id=request.getParameter("userid");
		//System.out.println(id);
		String strsql="select * from login_details where Id=?";
		try {
			ps=con.prepareStatement(strsql);
			ps.setString(1,id);
			rs=ps.executeQuery();
			if(!rs.next())
				pw.println("userid does not exist");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
