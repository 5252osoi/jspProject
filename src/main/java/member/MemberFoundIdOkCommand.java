package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFoundIdOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email")==null?"":request.getParameter("email");
		
		MemberDAO dao= new MemberDAO();
		MemberVO vo = dao.getMemberEmailCheck(email);
		
		String mid ="";
		if(vo.getMid()!=null) {
			String[] mids= vo.getMid().split("");
			//처음 2글자 + 마지막 1글자만 보여줌
			for(int i=0; i<mids.length; i++) {
				if(i<2 || i==mids.length-1 ) {
					mid+=mids[i];
				}else mid +="*";
			}
		}
		if(email.equals(vo.getEmail())){
			//이메일이 일치할때
			request.setAttribute("res", 1);
			request.setAttribute("email", email);
			request.setAttribute("mid", mid);
			
		} else {
			//이메일이 일치하지 않을때
			request.setAttribute("res", 0);
			request.setAttribute("msg", "해당 이메일 주소로 가입한 아이디가 없습니다.");
			request.setAttribute("url", "memberFoundId.mem");
			
		}
		
	}

}
