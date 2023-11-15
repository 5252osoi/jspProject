package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx=request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag=request.getParameter("pag")==null? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize=request.getParameter("pageSize")==null? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String search = request.getParameter("search")==null?"":request.getParameter("search");
		String searchString = request.getParameter("searchString")==null?"":request.getParameter("searchString");

		String flag=request.getParameter("flag")==null?"":request.getParameter("flag");
		BoardDAO dao = new BoardDAO();
		
		
		//게시글 조회수 1 증가(한 세션에서는 한번만)
		HttpSession session = request.getSession();
		ArrayList<String> boardContentIdx =(ArrayList) session.getAttribute("sBoardContentIdx");
		if(boardContentIdx==null) {
			boardContentIdx=new ArrayList<String>();
		}
		String imsiContentIdx="board"+idx;
		if(!boardContentIdx.contains(imsiContentIdx)) {
			dao.setBoardReadNumPlus(idx);
			boardContentIdx.add(imsiContentIdx);
		}
		
		session.setAttribute("sBoardContentIdx", boardContentIdx);
		
		BoardVO vo = dao.getBoardContent(idx);
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		request.setAttribute("flag", flag);
		
		//이전글,다음글 처리
		BoardVO preVo=dao.getPreNexSearch(idx,"preVo");
		BoardVO nextVo=dao.getPreNexSearch(idx,"nextVo");
		
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
	}

}
