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
 * Servlet implementation class Inbox
 */
@WebServlet("/Inbox")
public class Inbox extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inbox() {
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
		
		String[]chk=request.getParameterValues("chk");
		con=CrudOperation.createConnection();
		
		String strdelete="delete from inbox where MsgId=?";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(strdelete);
			for(int i=0;i<chk.length;i++)
			{
				ps.setString(1, chk[i]);
				ps.addBatch();
				
			}
			int []rows=ps.executeBatch();
			int flag=0;
			for(int i=0;i<rows.length;i++)
			{
				if(rows[i]<0)
					{flag=1;
				break;}
			}
			
			
			if(flag==0)
			{
				con.commit();
				HttpSession hs=request.getSession(false);
				String id=(String)hs.getAttribute("userkey");
				String type=(String)hs.getAttribute("utype");
				if(type.equalsIgnoreCase("Admin"))
				{
				response.sendRedirect("/dhsp/jsp/admin_home.jsp");
				}
				if(type.equalsIgnoreCase("Company"))
				{
				response.sendRedirect("/dhsp/jsp/company_home.jsp");
				}
				if(type.equalsIgnoreCase("Client"))
				{
				response.sendRedirect("/dhsp/jsp/userhome.jsp");
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
