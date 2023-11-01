package study.exm;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/exm/imgSave")
public class ImgSave extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		//가져온 이미지번호를 세션에 배열로 저장할것임
		/* ArrayList<String> imgList= new ArrayList<String>(); */
		/*이렇게 만들면 누를때마다 새로운 어레이리스트가 되기때문에 누적이안됨..*/
		/*생성할때부터 어레이리스트를 세션에 올려야한다*/
		ArrayList<String> imgList = (ArrayList)session.getAttribute("img");
		/*근데 이러면 여기 올때마다 새로 만드는거 아님?*/
		/*다른데다 만들어놓고 와야되는거 아님?*/
		
		String imgNum = request.getParameter("select")==null?"":request.getParameter("select");
		//이미지번호를 arraylist에 추가
		
	
		imgList=new ArrayList<String>();
		if(!imgNum.equals("")) {
			imgList.add(imgNum);
		}
		//arraylist를 세션에 올림 
		session.setAttribute("imgList", imgList);
		
		
		String viewPage="/study/1101_JSTL/ex4_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
		
	}
}
