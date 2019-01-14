package dhsp.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.sql.*;


/**
 * Servlet implementation class EmployeeDetails
 */
@WebServlet("/EmployeeDetails")
@MultipartConfig
public class EmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext sc=getServletContext();
		String path=sc.getRealPath("/");
		System.out.println(path);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
			
			
			
		 ServletContext sc=getServletContext();
		String path=sc.getRealPath("/");
		 
System.out.println(path);



	HttpSession hs=request.getSession(false);
	String u_id=(String)hs.getAttribute("userkey");
		
	String newpath=path+u_id;
	File f1=new File(newpath);
		if(!f1.exists())
		{
			
			f1.mkdir();
		}
		
		System.out.println("directorycreated");
		
		
	/*String description = request.getParameter("txtdesc");
		System.out.println(description);*/
		
  final Part filePart = request.getPart("fl");//filecontrol
	    	//final String fileName = getFileName(filePart);
	
	
	
	
	
	}

	
}
