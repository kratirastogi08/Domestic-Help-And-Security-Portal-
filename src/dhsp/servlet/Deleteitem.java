package dhsp.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import dhsp.dbtasks.CrudOperation;

/**
 * Servlet implementation class Deleteitem
 */
@WebServlet("/Deleteitem")
public class Deleteitem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deleteitem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eid=request.getParameter("empid");
		con=CrudOperation.createConnection();
		String str="delete from employee_details where EmpId=?";
		
		try {
			ps=con.prepareStatement(str);
			ps.setString(1, eid);
			System.out.println(ps);
			int rs=ps.executeUpdate();
			if(rs>0)
			{
				response.sendRedirect("/dhsp/jsp/deleteemployee.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
