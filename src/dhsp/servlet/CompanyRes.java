package dhsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.CrawlerSessionManagerValve;

import dhsp.dbtasks.CrudOperation;

/**
 * Servlet implementation class CompanyRes
 */
@WebServlet("/CompanyRes")
public class CompanyRes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps1,ps2;

	private ResultSet rs1,rs2;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyRes() {
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
		
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		String id=request.getParameter("comid");
		String pass=request.getParameter("compass");
		String comname=request.getParameter("comname");
		String resno=request.getParameter("txtresno");
		String area=request.getParameter("area");
		String num=request.getParameter("txtnum");
		String email=request.getParameter("txtemail");
		String name=request.getParameter("name");
		String add=request.getParameter("address");
		pw.println(add);
		
		con=CrudOperation.createConnection();
		String strlog="insert into login_details(Id,Userpass,Usertype,Status)values(?,?,?,?)";
		String strcom="insert into company_details(CompanyId,Compname,registrationno,Areaofwork,Contactno,Email,Ownername,Address)"
				+ "values(?,?,?,?,?,?,?,?)";
		try {
			con.setAutoCommit(false);
			ps1=con.prepareStatement(strlog);
			ps1.setString(1, id);
			ps1.setString(2, pass);
			ps1.setString(3, "Company");
			ps1.setString(4, "false");
			ps2=con.prepareStatement(strcom);
			ps2.setString(1, id);
			ps2.setString(2,comname);
			ps2.setString(3, resno);
			ps2.setString(4, area);
			ps2.setString(5, num);
			ps2.setString(6, email);
			ps2.setString(7, name);
			ps2.setString(8, add);
			int rs1=ps1.executeUpdate();
			int rs2=ps2.executeUpdate();
			if(rs1>0 && rs2>0)
			{
				con.commit();
				response.sendRedirect("/dhsp/jsp/login.jsp");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	    
	}

}
