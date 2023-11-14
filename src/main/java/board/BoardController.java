package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.bo")
public class BoardController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;
		String viewPage ="/WEB-INF/board";
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") ==null?4:(int) session.getAttribute("sLevel");
		if(level>3) {
			request.getRequestDispatcher("/").forward(request, response);
			
		} else if(com.equals("/boardList")){
			command = new BoardListCommand();
			command.excute(request, response);
			viewPage += "/boardList.jsp";

		} else if(com.equals("/boardInput")){
			viewPage += "/boardInput.jsp";
			
		} else if(com.equals("/boardInputOk")){
			command = new boardInputOkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
			
		} else if(com.equals("/boardContent")){
			command = new BoardContentCommand();
			command.excute(request, response);
			viewPage += "/boardContent.jsp";
			
		} else if(com.equals("/boardGoodCheck")){
			command = new BoardGoodCheckCommand();
			command.excute(request, response);
			return;
			
		} else if(com.equals("/boardGoodCheckPlus")){
			command = new BoardGoodCheckPlusCommand();
			command.excute(request, response);
			return;
			
		} else if(com.equals("/boardGoodCheckMinus")){
			command = new BoardGoodCheckMinusCommand();
			command.excute(request, response);
			return;
			
		} else if(com.equals("/boardUpdate")){
			command = new BoardUpdateCommand();
			command.excute(request, response);
			viewPage += "/boardUpdate.jsp";
			
		} else if(com.equals("/boardUpdateOk")){
			command = new BoardUpdateOkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
			
		} else if(com.equals("/boardDelete")){
			command = new BoardDeleteCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}
