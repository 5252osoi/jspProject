package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdminMemberInforCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt( request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt( request.getParameter("pageSize"));
		String mid = request.getParameter("mid") == null ? "" :request.getParameter("mid");
		//int lv = request.getParameter("lv") == null ? 4 : Integer.parseInt( request.getParameter("lv"));
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		System.out.println(vo.getMid());
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		//request.setAttribute("lv", lv);
		
	}

}
