package study2.AjexTest1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import study.database.LoginDAO;
import study.database.LoginVO;

@WebServlet("/ajaxTest5")
public class AjaxTest5 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
	
	LoginDAO dao = new LoginDAO();
	
	LoginVO vo=dao.getLoginSearch(mid);

	//response.getWriter().write(vo.toString());
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("mid", vo.getMid());
	map.put("name", vo.getName());
	map.put("point", vo.getPoint()+"");
	map.put("todayCount", vo.getTodayCount()+"");
	
	System.out.println("map : "+map);
	//JSON형식으로 변경한다...;
	//https://code.google.com/archive/p/json-simple/downloads 으로 들어가서 다운받고 lib에 추가
	JSONObject jObj = new JSONObject(map);
	
	System.out.println("jObj : "+ jObj);
	
	//여러 vo객체를 보내기 위해 JSON배열로 담아서 처리
	JSONArray jArray= new JSONArray();
	jArray.add(jObj);
	
	/////////////////////////////////////////////////
	map = new HashMap<>();
	map.put("mid", "atom1234");
	map.put("name", "아톰");
	map.put("point", "1000");
	map.put("todayCount", "3");
	
	jObj = new JSONObject(map);
	jArray.add(jObj);
	System.out.println("map : "+map);
	System.out.println("jArray : "+ jArray);
	
	//JSON객체를 문자열로 변경처리...
	String str = jObj.toJSONString();
	System.out.println("str : " + str);
	
	
	response.getWriter().write(jArray.toString());
 	
	
//	response.getWriter().write(map);
	}
}
