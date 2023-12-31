package pds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.pds")
public class PdsController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PdsInterface command = null;
		String viewPage ="/WEB-INF/pds";
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") ==null?4:(int) session.getAttribute("sLevel");
		
		if(level>3) {
			request.getRequestDispatcher("/").forward(request, response);
			
		} else if(com.equals("/pdsList")){
			command = new PdsListCommand();
			command.excute(request, response);
			viewPage += "/pdsList.jsp";
			
		} else if(com.equals("/pdsInput")){
			command = new PdsInputCommand();
			command.excute(request, response);
			viewPage += "/pdsInput.jsp";
			
		} else if(com.equals("/pdsInputOk")){
			command = new PdsInputOkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
			
		} else if(com.equals("/pdsDeleteOk")){
			command = new pdsDeleteOkCommand();
			command.excute(request, response);
			return;
			
		} else if(com.equals("/pdsDownNumCheck")){
			command = new pdsDownNumCheckCommand();
			command.excute(request, response);
			return;
			
		} else if(com.equals("/pdsContent")){
			command = new PdsContentCommand();
			command.excute(request, response);
			viewPage += "/pdsContent.jsp";
			
		} else if(com.equals("/pdsTotalDown")){
			command = new PdsTotalDownCommand();
			command.excute(request, response);
			return;
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}
