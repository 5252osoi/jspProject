package study.exm;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/exm/newRegCheck")
public class NewRegCheck extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String mid = request.getParameter("mid")==null ? "" :request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" :request.getParameter("pwd");
		String name = request.getParameter("name")==null ? ""  :request.getParameter("name");
		String nickName = request.getParameter("nickName")==null ? ""  :request.getParameter("nickName");
		String email = request.getParameter("email")==null ? ""  :request.getParameter("email");
		String content = request.getParameter("content");
		
		PrintWriter out = response.getWriter();
		
		if(mid.equals("")) {
			response.sendRedirect(request.getContextPath()+"/study/exm/newReg.jsp?flag=no");
			//백에서도 유효성검사 해줘야하는데 정규식 다시 확인해야되나? 
		} else {
			//DB에 저장 (지금은 콘솔에출력)
			System.out.println(mid);
			System.out.println(pwd);
			System.out.println(name);
			System.out.println(nickName);
			System.out.println(email);
			System.out.println(content);
		}
		name=URLEncoder.encode(name,"utf-8");
		nickName=URLEncoder.encode(nickName,"utf-8");
		content=URLEncoder.encode(content,"utf-8");
		response.sendRedirect(request.getContextPath()+"/study/exm/newRegRes.jsp?name="+name+"&mid="+mid+"&nickName="+nickName+"&email="+email+"&content="+content);
		//비밀번호는 보이면 안되는데?

		
		
		
	}
}
