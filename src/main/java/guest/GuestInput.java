package guest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/GuestInput")
public class GuestInput extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null?"":request.getParameter("name");
		String email = request.getParameter("email")==null?"":request.getParameter("email");
		String homePage = request.getParameter("homePage")==null?"":request.getParameter("homePage");
		String content = request.getParameter("content")==null?"":request.getParameter("content");
		String hostIp = request.getRemoteAddr();
		
		name=name.replace("<", "&lt;");
		name=name.replace(">", "&gt;");
		
		GuestDAO dao = new GuestDAO();
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		int res = dao.setGuestInput(vo);
		
		PrintWriter out = response.getWriter();
		if(res !=0 ) {
			out.println("<script>");
			out.println("alert('방명록을 작성했습니다.');");
			out.println("location.href='"+request.getContextPath()+"/GuestList'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('방명록 작성에 실패했습니다.');");
			out.println("location.href='"+request.getContextPath()+"/guest/guestInput.jsp'");
			out.println("</script>");
		}
	}

}
