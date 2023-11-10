package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;
import study2.ajax3.LoginDAO;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);

		if(!vo.getMid().equals(mid)) {
			request.setAttribute("msg", "아이디를 확인하세요");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "비밀번호를 확인하세요");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		//로그인 성공시 처리할 내용 (1.세션저장 2.쿠키저장 3.총방문횟수 4.오늘방문횟수 5.최종접속일 6.포인트적립 등)
		// 날짜 비교
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		// System.out.println("strToday : " + strToday);
		
		if(strToday.equals(vo.getLastDate().substring(0,10))) {
			// 오늘 다시 방문한 경우
			vo.setTodayCnt(vo.getTodayCnt()+1);
			if(vo.getTodayCnt() <= 5) vo.setPoint(vo.getPoint()+10);
		}
		else {
			// 오늘 처음 방문한 경우는 방문카운트를 1로 초기화하고 10포인트 증정
			vo.setTodayCnt(1);
			vo.setPoint(vo.getPoint()+10);
		}
		
		// 3.DB작업(변경된 내용들을 DB에 저장(갱신))
		dao.setLoginUpdate(vo);		
		//!회원등급을 숫자말고 정회원 준회원 이런식으로 바꾸기
		String strLevel="";
		if(vo.getLevel()==0)strLevel="관리자";
		else if(vo.getLevel()==1)strLevel="준회원";
		else if(vo.getLevel()==2)strLevel="정회원";
		else if(vo.getLevel()==3)strLevel="우수회원";
		
		//1. 세션저장
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("strLevel", strLevel);
//		session.setAttribute("sPoint", vo.getPoint());
//		session.setAttribute("sLastDate", vo.getLastDate());
//		session.setAttribute("sTodayCnt", vo.getTodayCnt());
		//(더 저장할거 있으면 더 해야함)
		
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
		//처리완료 -> 메세지 출력 -> 회원메인창으로 보낸다
		
		request.setAttribute("msg", mid+"님 로그인 되었습니다.");
		request.setAttribute("url", "memberMain.mem");
	}

}
