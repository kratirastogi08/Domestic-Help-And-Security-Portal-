package dhsp.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dhsp.dbtasks.CrudOperation;
import java.sql.*;

/**
 * Servlet implementation class Updatecompany
 */
@WebServlet("/Updatecompany")
public class Updatecompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatecompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		cn=CrudOperation.createConnection();
		HttpSession hs=request.getSession(false);
		String id=request.getParameter("compid");
		
		try {
			String strupdate="update login_details set Status=? where Id=?";
			ps=cn.prepareStatement(strupdate);
			ps.setString(1, "true");
			ps.setString(2, id);
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				System.out.println("data updated");
				response.sendRedirect("/dhsp/jsp/companyverification.jsp");
			}
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
	}
	}


