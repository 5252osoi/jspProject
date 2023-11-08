package study2.ajax2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.us")
public class UserController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInterface command = null;
		String viewPage="/WEB-INF/study2/ajax2";
		
		String com = request.getRequestURI();
		com=com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		if(com.equals("/userList")) {
			command = new UserListCommand();
			command.execute(request, response);
			viewPage+="/userList.jsp";
		} else if(com.equals("/userInput")) {
			command = new UserInputCommand();
			command.execute(request, response);
			//AJax는 페이지로 돌아가지 않고 여기서 리턴한다 (종료)
			return;
		} else if(com.equals("/userSearch")) {
			command = new UserSearchCommand();
			command.execute(request, response);
			//AJax는 페이지로 돌아가지 않고 여기서 리턴한다 (종료)
			return;
		
		} else if(com.equals("/userUpdate")) {
			command = new UserUpdateCommand();
			command.execute(request, response);
			//AJax는 페이지로 돌아가지 않고 여기서 리턴한다 (종료)
			return;
		} else if(com.equals("/userDelete")) {
			command = new UserDeleteCommand();
			command.execute(request, response);
			//AJax는 페이지로 돌아가지 않고 여기서 리턴한다 (종료)
			return;
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
