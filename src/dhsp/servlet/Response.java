package dhsp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dhsp.dbtasks.CrudOperation;
import javafx.beans.binding.IntegerExpression;

import java.sql.*;
/**
 * Servlet implementation class Response
 */
@WebServlet("/Response")
public class Response extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
       private PreparedStatement ps;
       private ResultSet rs;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Response() {
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
		 String[]itemarr=request.getParameterValues("chk");
         try {java.util.Date d=new java.util.Date();
         java.sql.Date sd=new java.sql.Date(d.getTime());
         
			cn=CrudOperation.createConnection();
			cn.setAutoCommit(false);
			String strdel="update service_request set Response=?,Dateofresp=?,Servicestatus=? where ReqId=?";
			ps=cn.prepareStatement(strdel);
			for(int i=0;i<itemarr.length;i++)
			{
				ps.setString(1, "Accepted");
				ps.setDate(2, sd);
				ps.setString(3,"true");
				ps.setInt(4, Integer.parseInt(itemarr[i]));
				
				
				ps.addBatch();
			}
			int row[]=ps.executeBatch();
			int flag=0;
			for(int i=0;i<row.length;i++)
			{
				if(row[i]<0)
				{
					flag=1;
					break;
					
				}
			}
			if(flag==0)
			{
				cn.commit();
				response.sendRedirect("/dhsp/jsp/company_home.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
