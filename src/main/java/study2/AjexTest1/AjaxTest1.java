package study2.AjexTest1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

@WebServlet("/ajaxTest1")
public class AjaxTest1 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
	
	LoginDAO dao = new LoginDAO();
	LoginVO vo=dao.getLoginSearch(mid);
	PrintWriter out = response.getWriter();
	//out.println(vo.getName());
	
	String name = "";
	if(vo.getName()==null) {
		name = "찾는 자료가 없습니다.";
	} else {
		name=vo.getName();
	}
	//out.write(vo.getName());
	response.getWriter().write(name);
	
	
	

	}
}
