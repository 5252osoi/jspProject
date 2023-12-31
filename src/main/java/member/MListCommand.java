package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;

public class MListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		//페이징처리
		int pag = request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null?2:Integer.parseInt(request.getParameter("pageSize"));
		int totRecCnt = dao.getTotRecCnt();
		int totPage = (totRecCnt % pageSize) ==0 ? (totRecCnt / pageSize) : (totRecCnt/pageSize)+1 ;
		int startIndexNo = (pag-1)*pageSize;
		int curScrStartNo = totRecCnt-startIndexNo; 
		//블록처리
		int blockSize =3;
		int curBlock=(pag-1)/blockSize;
		int lastBlock = (totPage-1)/blockSize;
		
		ArrayList<MemberVO> vos = dao.getMemberList(startIndexNo,pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pageSize", pageSize); //입력받아서 가져올때에는 넣어줘야함
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}

}
