package dhsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dhsp.dbtasks.CrudOperation;

import java.sql.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection con;
       private PreparedStatement pslogin;
       private ResultSet rslogin;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		response.setContentType("text/html");
		//PrintWriter pw =response.getWriter();
			String userid=request.getParameter("userid").trim();
			
			String userpass=request.getParameter("userpass");
			
			con=CrudOperation.createConnection();
			String strsql="select * from login_details where Id=? and Userpass=? and Status='true'";
			try {
				pslogin=con.prepareStatement(strsql);
				pslogin.setString(1, userid);
				pslogin.setString(2, userpass);
				rslogin=pslogin.executeQuery();
				if(rslogin.next())
				{
					String utype=rslogin.getString("usertype");
					HttpSession hs=request.getSession();//create a new session
					hs.setAttribute("userkey", userid);
					hs.setAttribute("utype", utype);
					
					
					if(utype.equalsIgnoreCase("Admin"))
					{
					response.sendRedirect("/dhsp/jsp/admin_home.jsp");
					}
					if(utype.equalsIgnoreCase("Company"))
					{
					response.sendRedirect("/dhsp/jsp/company_home.jsp");
					}
					if(utype.equalsIgnoreCase("Client"))
					{
					response.sendRedirect("/dhsp/jsp/userhome.jsp");
					}
										
					}
				else
				{
					request.setAttribute("msg","Invalid userid or password");
					RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
					rd.forward(request, response);
					
				}
		
			}
			catch(SQLException se)
			{
				System.out.println(se);
			}
			
			
	}

}
