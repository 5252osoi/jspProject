package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/GuestList")
public class GuestList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		//게시글 수에 따른 페이지 만들기
		//1. 현재 페이지 번호를 구한다
		int pag = request.getParameter("pag")==null?1:Integer.parseInt(request.getParameter("pag"));
		//2. 한 페이지의 분량을 결정한다.
		int pageSize = request.getParameter("pageSize")==null?2:Integer.parseInt(request.getParameter("pageSize"));
		//3. 총 레코드 건수를 구한다.(sql명령어 중 count 함수사용)
		int totRecCnt = dao.getTotRecCnt();
		//4. 총 페이지 건수를 구한다.
		int totPage = (totRecCnt % pageSize) ==0 ? (totRecCnt / pageSize) : (totRecCnt/pageSize)+1 ;
		//5. 현재 페이지에 출력할 '시작 인덱스 번호'를 구한다.
		int startIndexNo = (pag-1)*pageSize;
		//6. 현재 화면에 표시될 시작번호를 구한다.
		int curScrStartNo = totRecCnt-startIndexNo; 
		
		//블록페이징 처리 . . .(시작블록의 번호를 0번으로 처리)
		//1. 블록의 크기결정 ( 여기선 3으로 결정)
		int blockSize =3;
		//2. 현재페이지가 속한 블록번호를 구한다 . (예 : 1/2/3페이지는 0블록,, 4/5/6페이지는 1블록. . . . 7/8페이지는 2블록.. . . .
		int curBlock=(pag-1)/blockSize;
		//3.마지막블록을 구한다
		int lastBlock = (totPage-1)/blockSize;
		//지정된 페이지의 자료를 요청한 한페이지의 분량만큼 가져온다.
		
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo,pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pageSize", pageSize); //입력받아서 가져올때에는 넣어줘야함
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		String viewPage="/guest/guestList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
