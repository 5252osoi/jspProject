package study.j1031;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1031/t2_vo")
public class T2_vo extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name=request.getParameter("name")==null?"":request.getParameter("name");
		String hakbun=request.getParameter("hakbun")==null?"":request.getParameter("hakbun");
		int kor=request.getParameter("kor")==null ? 0 :Integer.parseInt(request.getParameter("kor"));
		int eng=request.getParameter("eng")==null ? 0 : Integer.parseInt(request.getParameter("eng"));
		int math=request.getParameter("math")==null ? 0 : Integer.parseInt(request.getParameter("math"));
		int soc=request.getParameter("soc")==null ? 0 : Integer.parseInt(request.getParameter("soc"));
		int sci=request.getParameter("sci")==null ? 0 : Integer.parseInt(request.getParameter("sci"));
		
		int tot = kor+eng+math+soc+sci;
		double avg = tot/5.0;
		char grade=' ';
		
		switch((int)(avg/10)) {
		case 10:
		case 9:
			grade='A';
			break;
		case 8:
			grade='B';
			break;
		case 7:
			grade='C';
			break;
		case 6:
			grade='D';
			break;
		case 5:
			grade='F';
		}
		/*
		 * request.setAttribute("name", name); request.setAttribute("hakbun", hakbun);
		 * request.setAttribute("kor", kor); request.setAttribute("eng", eng);
		 * request.setAttribute("math", math); request.setAttribute("soc", soc);
		 * request.setAttribute("sci", sci); request.setAttribute("tot", tot);
		 * request.setAttribute("avg", avg); request.setAttribute("grade", grade);
		 */
		
		T2VO vo = new T2VO(name,hakbun,kor,eng,math,soc,sci,tot,avg,grade);

		request.setAttribute("vo", vo);
		
		String viewPage="/study/1031/t2_voRes.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
