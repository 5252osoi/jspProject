package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/loginOk")
public class LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid= request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd= request.getParameter("pwd")==null?"":request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginCheck(mid,pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName()!=null) {
			//회원인증에 성공했을때(null이 아니니까)
			/* 1. 자주사용하는 변수(객체) 세션에 저장,
			 * 2. 쿠키에 아이디저장 또는 제거
			 * 3. DB에 처리할 내용들(최종방문일갱신/포인트누적/방문일수누적)
*/
			//방문포인트 처리하기 (최종접속일/방문카운트도 함께 업데이트 처리)
			//하루 방문포인트는 10포인트씩 증가. 단, 최대 50포인트까지만 인정한다.  (1일치 카운트가 5까지 올라가고, 5가되면 포인트가 증가하지않는식)
			
			
			//세션 처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount());
			
			//2.쿠키에 저장 (숙)
			
			//3.DB작업
			//회원인증 성공 후 모든 처리가 끝나면 => 정상처리됨 메세지 출력 후 memberMain.jsp로 보낸다.
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인 되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/memberMain.jsp';");
			out.println("</script>");
			
		} else {
			//회원인증에 실패했을 때 => 다시 로그인 창으로 보낸다
			out.println("<script>");
			out.println("alert('로그인에 실패했습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.println("</script>");
		}
		
		
	}
}
