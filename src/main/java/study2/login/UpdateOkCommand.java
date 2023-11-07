package study2.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.database.LoginDAO;
import study.database.LoginVO;

public class UpdateOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null?"":request.getParameter("pwd");
		String name = request.getParameter("name")==null?"":request.getParameter("name");
		
		
		LoginDAO dao = new LoginDAO();
		
		//비밀번호 체크하기..
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		PrintWriter out = response.getWriter();
		if(vo.getMid()==null) {
			out.println("<script>");
			out.println("alert('비밀번호를 확인하세요.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/memberMain.jsp'");
			out.println("</script>");
			return;
		}

		vo = new LoginVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		int res= dao.setUpdateOk(vo);
		
		if(res!=0) {
			HttpSession session =request.getSession();
			session.setAttribute("sName", name);
			request.setAttribute("msg", mid+"님 정보가 수정되되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/memberMain.lo");
		} else {
			request.setAttribute("msg", "정보 수정 실패");
			request.setAttribute("url", request.getContextPath()+"/update.lo");
		}
	}

}
