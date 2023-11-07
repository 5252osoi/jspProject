package study2.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

public class MemberListCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		//현재 내가 있는 페이지 (null이면 1)
		int pg = request.getParameter("pg")==null ? 1 : Integer.parseInt(request.getParameter("pg"));
		//한 페이지 분량 (지금은 5)
		int pageSize = 3;
		//총 레코드 건수 (DB에 있는 아이디 수)
		int totRecCnt = dao.getTotRecCnt();
		int totPage=(totRecCnt % pageSize)==0? (totRecCnt/pageSize) : (totRecCnt/pageSize)+1;
		int startIndexNo = (pg-1)*pageSize;
		int curScrStartNo = totRecCnt-startIndexNo;
		//1블록당 페이지 수 (지금 3)
		int blockSize=3;
		//  1,2,3은 0번블록(기본블록) 4,5,6은 1블록
		int curBlock=(pg-1)/blockSize;
		//마지막블록구하기
		int lastBlock = (totPage-1)/blockSize;
		//지정된 페이지의 자료를 요청한 한페이지의 분량만큼 가져온다.
		ArrayList<LoginVO> vos = dao.getLoginList(startIndexNo,pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pg", pg);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
	}

}
