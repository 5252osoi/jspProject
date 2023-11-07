package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

public class JoinOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null?"":request.getParameter("pwd");
		String name = request.getParameter("name")==null?"":request.getParameter("name");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = new LoginVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		int res = dao.setJoinOk(vo);
		
		if(res!=0) {
			request.setAttribute("msg", "회원 가입 성공");
			request.setAttribute("url", request.getContextPath()+"/login.lo");

		} else {
			request.setAttribute("msg", "회원 가입 실패");
			request.setAttribute("url", request.getContextPath()+"/login.lo");
		}

	}

}
