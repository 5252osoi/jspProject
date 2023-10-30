package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j1026/test13Ok")
public class Test13Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// Front에서 넘어온 값을 변수에 담는다.
		String name=request.getParameter("name")==null ? "" :request.getParameter("name");
		int age= (request.getParameter("age")==null||request.getParameter("age").equals("")) ? 0 :Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "남자" : request.getParameter("gender");
		String[] hobbys =request.getParameterValues("hobby");
		String job=request.getParameter("job");
				
		if(name.equals("")|| age<20 ) {
			//가입조건을 만족하지 못했을 때 다시 가입창으로 보내준다
			response.sendRedirect(request.getContextPath()+"/study/1026/test13.jsp?flag=no");
		} else {
			//가입조건을 만족했기때문에 DB에 저장시키고 메인창*(test10Res.jsp)로 이동시킬것
			System.out.println("name : "+name);
			System.out.println("age : "+age);
			System.out.println("gender : "+gender);
			String hobby=""; 
			for(String h:hobbys) {
				hobby+=h+"/";
			}
			hobby=hobby.substring(0,hobby.length()-1);
			System.out.println("hobby : "+hobby);			
			System.out.println("job : "+job);

			//VO에 담아서 가져가기 
			Test13VO vo = new Test13VO();
			vo.setName(name);
			vo.setAge(age);
			vo.setGender(gender);
			vo.setHobby(hobby);
			vo.setJob(job);

			//request 저장소에 전송하려고 하는 자료들을 모두 담아준다. : request("변수명", 전송값)
			request.setAttribute("vo", vo);
			
			//뷰페이지를 미리 작성해놓고 디스패처로 보내기
			String viewPage="/study/1026/test13Res.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
			
		
	}
}
