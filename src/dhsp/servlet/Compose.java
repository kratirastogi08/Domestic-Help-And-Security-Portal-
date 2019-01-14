package dhsp.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dhsp.dbtasks.CrudOperation;
import java.sql.*;

/**
 * Servlet implementation class Compose
 */
@WebServlet("/Compose")
public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement ps,ps1;
	private Connection cn;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compose() {
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
		String senderid=request.getParameter("sid");
		String receiverid=request.getParameter("rid");
		String subject=request.getParameter("subject");
		String message=request.getParameter("msg");
		java.util.Date d=new java.util.Date();
		long l=d.getTime();
		java.sql.Date sd=new java.sql.Date(l);
		cn=CrudOperation.createConnection();
		
		try {
			cn.setAutoCommit(false);
			String strinsert="insert into inbox(SenderId,ReceiverId,Subject,Message,Date)values(?,?,?,?,?)";
			ps=cn.prepareStatement(strinsert);
			ps.setString(1, senderid);
			ps.setString(2, receiverid);
			ps.setString(3, subject);
			ps.setString(4, message);
			ps.setDate(5, sd);
			int rw=ps.executeUpdate();
			 
			String strin="insert into sentitem(SenderId,ReceiverId,Subject,Message,Date)values(?,?,?,?,?)";
			ps1=cn.prepareStatement(strin);
			ps1.setString(1, senderid);
			ps1.setString(2, receiverid);
			ps1.setString(3, subject);
			ps1.setString(4, message);
			ps1.setDate(5, sd);
			int rw1=ps1.executeUpdate();
			if(rw>0&&rw1>0)
			{
				cn.commit();
				System.out.println("data inserted successfully");
				HttpSession hs=request.getSession(false);
				String usertype=(String)hs.getAttribute("utype");
				
				
				if(usertype.equals("Company"))
				{    
					response.sendRedirect("/dhsp/jsp/company_home.jsp");
				}
				if(usertype.equals("Client"))
				{
					response.sendRedirect("/dhsp/jsp/userhome.jsp");
				}
				if(usertype.equals("Admin"))
				{
					response.sendRedirect("/dhsp/jsp/admin_home.jsp");
				}
				
			}
			
		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
		}
		
	}
	}


