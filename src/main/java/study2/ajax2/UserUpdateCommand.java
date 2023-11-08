package study2.ajax2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserUpdateCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = request.getParameter("age") == null ? 0 : Integer.parseInt( request.getParameter("age"));
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");
		
		UserVO vo = new UserVO();
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setAddress(address);
		
		UserDAO dao = new UserDAO();
		
		String res = dao.getUserUpdate(vo);
		
		if(res.equals("0")) {
			response.getWriter().write("정보 수정 실패");
		}else {
			response.getWriter().write(res);
		}

	}

}
