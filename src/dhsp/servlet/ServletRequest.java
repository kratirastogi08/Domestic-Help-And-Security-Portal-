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
 * Servlet implementation class ServletRequest
 */
@WebServlet("/ServletRequest")
public class ServletRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private Connection cn;
     private PreparedStatement ps;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRequest() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("userkey");
		
		response.setContentType("text/html");
		System.out.println(userid);
		String subject=request.getParameter("sub");
		String req=request.getParameter("req");
		String compid=request.getParameter("cmbcompany");
		java.util.Date d=new java.util.Date();
		long l=d.getTime();
		java.sql.Date sd=new java.sql.Date(l);
		cn=CrudOperation.createConnection();	
		try {
			
			String strinsert="insert into service_request(UserId, CompId, Subject, Request, Dateofreq,Response ,Servicestatus)values(?,?,?,?,?,?,?)";
			ps=cn.prepareStatement(strinsert);
			ps.setString(1, userid);
			ps.setString(2, compid);
			ps.setString(3, subject);
			ps.setString(4, req);
			ps.setDate(5, sd);
			ps.setString(6, "Pending");
			
			ps.setString(7,"False");
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				
				System.out.println("data inserted successfully");
				response.sendRedirect("/dhsp/jsp/userhome.jsp");
			}
				
		}
		
		catch(SQLException se)
		{
			System.out.println(se);
		}
		}
	}


