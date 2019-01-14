package dhsp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dhsp.dbtasks.CrudOperation;
import java.sql.*;

/**
 * Servlet implementation class Postnews
 */
@WebServlet("/Postnews")
public class Postnews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Postnews() {
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
		String title=request.getParameter("subject");
		String content=request.getParameter("news");
		java.util.Date d=new java.util.Date();
		long l=d.getTime();
		java.sql.Date sd=new java.sql.Date(l);
		cn=CrudOperation.createConnection();
		String strsql="insert into news(Subject,Date,Contents)values(?,?,?)";
		try {
			ps=cn.prepareStatement(strsql);
			ps.setString(1, title);
			
			ps.setDate(2, sd);
			ps.setString(3, content);
			//ps.setString(4, "null");
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				System.out.println("data inserted");
				response.sendRedirect("/dhsp/jsp/admin_home.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}


