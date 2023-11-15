package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchCommand implements BoardInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao=new BoardDAO();
		String search = request.getParameter("search")==null?"":request.getParameter("search");
		String searchString = request.getParameter("searchString")==null?"":request.getParameter("searchString");
		String flag=request.getParameter("flag")==null?"":request.getParameter("flag");
		int pag = request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null?5:Integer.parseInt(request.getParameter("pageSize"));
		
		int totRecCnt = dao.getSearchCnt(search, searchString);
		int totPage = (totRecCnt % pageSize) ==0 ? (totRecCnt / pageSize) : (totRecCnt/pageSize)+1 ;
		int startIndexNo = (pag-1)*pageSize;
		int curScrStartNo = totRecCnt-startIndexNo; 
		//블록처리
		int blockSize =3;
		int curBlock=(pag-1)/blockSize;
		int lastBlock = (totPage-1)/blockSize;
		
		
		ArrayList<BoardVO> vos = dao.getBoardContentSearch(search,searchString,startIndexNo,pageSize);
		
		String searchTitle="";
		if (search.equals("title"))searchTitle="제목";
		else if (search.equals("nickName"))searchTitle="작성자";
		else searchTitle="내용";
		
		
		request.setAttribute("vos", vos);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("searchCount", vos.size());
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("flag", flag);
		
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}

}
