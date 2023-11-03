package study.password;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

@WebServlet("/password/passOk1")
public class PassOk1 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null?"":request.getParameter("pwd").toUpperCase();
		int idx = request.getParameter("idx")==null ? 0: Integer.parseInt(request.getParameter("idx"));
		
		System.out.println("== 원본 자료 ==");
		System.out.println("mid : " +mid);
		System.out.println("pwd : " +pwd);
		System.out.println("idx : " +idx);
		
		//가장 많이쓰는 방법은 SHA256|512 (단방향), ARIA (양방향), 스프링시큐리티		
		
		
		if(idx==1) {
			//숫자만을 암호화하는경우
			//암호화를 위한 암호화키(0x1234ABCD)(16진수)
			int key=0x1234ABCD;
			int encPwd,decPwd;
			
			//암호화...(EOR(배타적OR) 암호화) => 이진수 EOR : ^
			encPwd=Integer.parseInt(pwd)^key;
			
			System.out.println("== 암호화 된 자료 ==");
			System.out.println("mid : " +mid);
			System.out.println("encPwd : " +encPwd);
			
			//복호화 . . .
			decPwd=encPwd^key;
			
			System.out.println("== 복호화 된 자료 ==");
			System.out.println("mid : " +mid);
			System.out.println("decPwd : " +decPwd);
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('원본 비번 : "+pwd+" \\n암호화된 비번 : "+encPwd+"')");
			out.println("</script>");
		} else if(idx==2){
			//숫자와 영문 대/소문자 혼합 (아스키코드 2자리로 변환 후 암호화 처리하도록 한다. : 영소문자로 입력시는 대문자로 변경해서 처리하도록 하겠음.)
			long intPwd;
			String strPwd="";
			System.out.println("1.원본 비밀번호(예:ABCD : "+pwd);
			for(int i=0; i<pwd.length(); i++) {
				intPwd = pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("2.ASCII코드 문자로 변환된 비밀번호(예:65666768 : "+strPwd);
			
			intPwd=Long.parseLong(strPwd);
			long encPwd, key = 0x1234ABCD;
			
			encPwd=intPwd^key;
			strPwd=String.valueOf(encPwd);
			System.out.println("3.암호화 된 비밀번호 encPwd : " +strPwd);
			//암호화된 비밀번호와 암호화키를 DB에 저장시켜놓는다.
			//복호화된 비밀번호는 숫자이기때문에 두개씩 분리시켜서 처리한다.
			long decPwd;
			intPwd=Long.parseLong(strPwd);
			decPwd=intPwd^key;
			System.out.println("복호화된 비번 : "+decPwd);
			
			strPwd=String.valueOf(decPwd);
			
			char ch;
			String result="";
			for(int i=0; i<strPwd.length(); i+=2) {
				ch=(char) Integer.parseInt(strPwd.substring(i,i+2));
				result+=ch;
			}
			System.out.println("4. 최종적으로 복호화된 비밀번호" + result);
		} else {
			SecurityUtil security = new SecurityUtil();
			String shaPwd = security.encryptSHA256(pwd);
			
			System.out.println("pwd : "+pwd);
			System.out.println("암호화 pwd : "+shaPwd);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('원본 비번 : "+pwd+" \\n암호화된 비번 : "+shaPwd+"')");
			out.println("</script>");
			
			
		}
		
		
	}

}
