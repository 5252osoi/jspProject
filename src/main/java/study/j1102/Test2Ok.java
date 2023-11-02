package study.j1102;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
	ServletContextListener : 인터페이스
	contextInitialized: 웹 어플리케이션 감시자로 서블릿 실행 전 메소드 중에서는 가장 먼저 1번만 수행.
	contextDestroyed : 웹 어플리케이션 감시자로 서블릿 실행 전 멧드중에서는 가장 마지막에 1번만 수행.
 	
 	web.xml에 listener로 등록을 해줘야함
 */
@WebServlet("/j1102/test2Ok")
public class Test2Ok extends HttpServlet implements ServletContextListener{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("2. service()메소드입니다.");		
		doPost(request, response);
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("1. init()메소드입니다.");		
	}
	@Override
	public void destroy() {
		System.out.println("5 .destroy()메소드입니다.");		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("4 . 이곳은 doGet()메소드입니다.");
		
		
		

		//request.setCharacterEncoding("utf-8");
		
		String content=request.getParameter("content")==null?"":request.getParameter("content");
		String introduce=request.getParameter("introduce")==null?"":request.getParameter("introduce");
		
		
		System.out.println("================test2.Ok start=================");
		System.out.println("content : " +content);
		System.out.println("introduce : " +introduce);
		System.out.println("================test2.Ok end=================");
		
		
		PrintWriter out = response.getWriter();
		out.println("이곳은 Test2Ok 컨트롤러입니다.");
		
		request.setAttribute("msg", "test2Ok.java에서 보낸 메세지입니다.");
		
		String viewPage="/study/1102_web_xml/test2Res.jsp";
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	@PostConstruct
	private void initPostConstruct() {
		System.out.println("0 . 이곳은 @PostConstruct()메소드입니다.");
	}
	
	@PreDestroy
	private void destroyPreDestroy() {
		System.out.println("6 . 이곳은 @PreDestroy()메소드입니다.");
	}
	
	@Override 
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("00 . 이곳은 contextInitialized()메소드입니다.");
	}
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("100 . 이곳은 contextDestroyed()메소드입니다.");
	}
	

}
