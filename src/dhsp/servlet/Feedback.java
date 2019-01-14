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
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection cn;
       private PreparedStatement ps;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("userkey");
		response.setContentType("text/html");
		System.out.println(userid);
		String subject=request.getParameter("subject");
		String message=request.getParameter("msg");
		String compid=request.getParameter("compid");
		java.util.Date d=new java.util.Date();
		long l=d.getTime();
		java.sql.Date sd=new java.sql.Date(l);
		cn=CrudOperation.createConnection();
		
		try {
			
			String strinsert="insert into feedback(Userid, Subject, Message, Date, Companyid)values(?,?,?,?,?)";
			ps=cn.prepareStatement(strinsert);
			ps.setString(1, userid);
			ps.setString(2, subject);
			ps.setString(3, message);
			ps.setDate(4, sd);
			ps.setString(5, compid);
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


