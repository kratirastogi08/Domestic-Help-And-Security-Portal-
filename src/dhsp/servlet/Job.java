package dhsp.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dhsp.dbtasks.CrudOperation;

/**
 * Servlet implementation class Job
 */
@WebServlet("/Job")
public class Job extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Job() {
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
		HttpSession hs=request.getSession(false);
		String compid=(String)hs.getAttribute("userkey");
		String jobid=request.getParameter("jobid");
		String name=request.getParameter("jobname");
		
		con=CrudOperation.createConnection();
		String str="insert into job(JobId,JobName,CompId)values(?,?,?)";
		try {
			ps=con.prepareStatement(str);
			ps.setString(1, jobid);
			ps.setString(2, name);
			ps.setString(3, compid);
			int rs=ps.executeUpdate();
			if(rs>0)
			{
				
				response.sendRedirect("/dhsp/jsp/company_home.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
