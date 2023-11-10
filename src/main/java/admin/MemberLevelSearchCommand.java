package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberLevelSearchCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null?99:Integer.parseInt(request.getParameter("level"));
		System.out.println(level);
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberVO> vos = dao.getMemberLevelSearchList(level);
		
		request.setAttribute("vos", vos);	
		request.setAttribute("lv", level);

		
	}

}
