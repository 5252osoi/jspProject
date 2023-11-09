package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberFoundPwdCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email")==null?"":request.getParameter("email");
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		
		MemberDAO dao= new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		//mid로 찾아온 vo에서 email이 같으면 pwd 수정하고 값 알려주기
		
		if(email.equals(vo.getEmail())){
			
			UUID uid = UUID.randomUUID();
			String pwd = uid.toString();
			
			pwd=pwd.substring(0,6);
			//6글자까지만 잘라낼것
			String viewPwd=pwd;
			
			SecurityUtil security = new SecurityUtil();
			pwd=security.encryptSHA256(pwd);
			
			int res=dao.setMemberImsiPwd(pwd,mid);
			
			if(res==1) {
				request.setAttribute("res", 1);
				request.setAttribute("viewPwd", viewPwd);
				request.setAttribute("mid", mid);
				request.setAttribute("email", email);
			} else {
				request.setAttribute("res", 0);
				request.setAttribute("msg", "해당하는 아이디와 이메일을 찾을 수 없습니다.");
				request.setAttribute("url", "memberFoundPwd.mem");
			}
			
		} else {
			request.setAttribute("res", 0);
			request.setAttribute("msg", "해당하는 아이디와 이메일을 찾을 수 없습니다.");
			request.setAttribute("url", "memberFoundPwd.mem");
		}
	}

}
