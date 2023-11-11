package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberNewCrewCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		int level=1;
		
		ArrayList<MemberVO> vos = dao.getMemberLevelSearchList(level);
		
		int newCrew = vos.size();
		
		System.out.println("newCrew : "+newCrew);
		
		
		request.setAttribute("newCrew", newCrew);
		
	}

}
