package dhsp.servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dhsp.dbtasks.CrudOperation;

/**
 * Servlet implementation class UpdateEmployee
 */
@WebServlet("/UpdateEmployee")
@MultipartConfig
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/dhsp/jsp/company_home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("empname");
		String id=request.getParameter("empid");
		String num=request.getParameter("num");
		
		String add=request.getParameter("address");
		String exp=request.getParameter("exp");
		
		con=CrudOperation.createConnection();
		 response.setContentType("text/html;charset=UTF-8");
			
		 HttpSession hs=request.getSession(false);
			String compid=(String)hs.getAttribute("userkey");
			
			String fileName=null;
			if(request.getPart("photo")!=null){
		 ServletContext sc=getServletContext();
		String path=sc.getRealPath("/");
		 
    System.out.println(path);
	String newpath=path+compid;
	File f1=new File(newpath);
		if(!f1.exists())		
			f1.mkdir();		
	String description = request.getParameter("txtdesc");
  final Part filePart = request.getPart("photo");//filecontrol
	    	fileName = getFileName(filePart);
	    	System.out.println(fileName);
	        OutputStream out = null;
		    InputStream filecontent = null;
		    final PrintWriter writer = response.getWriter();
		    try {
		        out = new FileOutputStream(new File(newpath + File.separator
		                + fileName));
		        filecontent = filePart.getInputStream();
		        int read = 0;
		        final byte[] bytes = new byte[1024];
		        while ((read = filecontent.read(bytes)) != -1) {
		            out.write(bytes, 0, read);
		        }
		// writer.println("New file " + fileName + " created at " + newpath);
		    } catch (FileNotFoundException fne) {
		        writer.println("<br/> ERROR: " + fne.getMessage());		       
		    } finally {
		        if (out != null) {
		            out.close();
		        }
		        if (filecontent != null) {
		            filecontent.close();
		        }
		        /*if (writer != null) {
		            writer.close();
		        }*/
		    }
		}
			 
	    	String strsql="update employee_details set Address=?,Experience=?,Contactno=?,Photo=? where EmpId=?";
	    	try {
				ps=con.prepareStatement(strsql);
				ps.setString(1, add);
		ps.setInt(2, Integer.parseInt(exp));
				
				ps.setInt(3, Integer.parseInt(num));
				ps.setString(4, fileName);
				ps.setString(5, id);
				
				int rs=ps.executeUpdate();
				if(rs>0)
				{
					System.out.println("hello");
					/*response.setContentType("text/html");
				response.sendRedirect("/dhsp/jsp/company_home.jsp");*/
					/*RequestDispatcher rd=request.getRequestDispatcher("/dhsp/jsp/company_home.jsp");
					rd.forward(request, response);*/
					doGet(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	
	}
			
			
		
	
	private String getFileName(final Part part) {
		
		
		
		
	    final String partHeader = part.getHeader("content-disposition");
	   
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}
	
	}


