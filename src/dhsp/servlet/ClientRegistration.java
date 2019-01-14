package dhsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dhsp.dbtasks.CrudOperation;

/**
 * Servlet implementation class ClientRegistration
 */
@WebServlet("/ClientRegistration")
public class ClientRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection cn;
       private PreparedStatement pslogin;
       private PreparedStatement psuser;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientRegistration() {
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
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
			String userid=request.getParameter("txtid");
			
			String userpass=request.getParameter("txtpass");
			String username=request.getParameter("txtname");
			String address=request.getParameter("address");
			String email=request.getParameter("txtemail");
			String phone=request.getParameter("txtnum");
			
			String usergender=request.getParameter("gender");
			
			try
			{
			cn=CrudOperation.createConnection();
			cn.setAutoCommit(false);
			String strinsert="insert into login_details(Id, Userpass, Usertype, Status)values(?,?,?,?)";
			String struser="insert into user_details(UserId, Name, Gender, Address, contactno, EmailId)values(?,?,?,?,?,?)";
			
				pslogin=cn.prepareStatement(strinsert);
				psuser=cn.prepareStatement(struser);
				pslogin.setString(1,userid);
				pslogin.setString(2,userpass);
				pslogin.setString(3,"Client");
				pslogin.setString(4, "true");
				psuser.setString(1,userid);
				psuser.setString(2,username);
				psuser.setString(3,usergender);
				psuser.setString(4,address);
			
				psuser.setString(5,phone);
				psuser.setString(6, email);
				int r=pslogin.executeUpdate();
				int r1=psuser.executeUpdate();
				cn.setAutoCommit(false);
				if(r>0&&r1>0)
				{
					cn.commit();
					response.sendRedirect("/dhsp/jsp/login.jsp");
				}
				
			}
			catch(SQLException se)
			{
				System.out.println(se);
			}
	}

		
	}


