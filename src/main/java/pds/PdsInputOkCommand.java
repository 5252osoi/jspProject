package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장시킬 파일의 최대용량을 10MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());

		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		System.out.println("서버의 저장경로 : " + realPath);
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file) + "/";
				filesystemName += multipartRequest.getFilesystemName(file) + "/";
				
			}
		}
		originalFileName = originalFileName.substring(0,originalFileName.length()-1);
		filesystemName = filesystemName.substring(0,filesystemName.length()-1);
//			System.out.println("원본 파일명 : " + originalFileName);
//			System.out.println("서버에 저장된 파일명 : " + filesystemName);
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");

		//업로드 시킨 파일을 db에 저장시키기 위해서 전송된 폼의 내용들을 모두 변수에 받아준다.
		int fileSize = multipartRequest.getParameter("fileSize")==null?0:Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String title = multipartRequest.getParameter("title") ==null ? "" : multipartRequest.getParameter("title");
		String part = multipartRequest.getParameter("part") ==null ? "" : multipartRequest.getParameter("part");
		String pwd = multipartRequest.getParameter("pwd") ==null ? "" : multipartRequest.getParameter("pwd");
		String openSw = multipartRequest.getParameter("openSw") ==null ? "" : multipartRequest.getParameter("openSw");
		String content = multipartRequest.getParameter("content") ==null ? "" : multipartRequest.getParameter("content");
		String hostIp = multipartRequest.getParameter("hostIp") ==null ? "" : multipartRequest.getParameter("hostIp");
		
		//비밀번호 암호화(sha256)
		SecurityUtil security = new SecurityUtil();
		pwd=security.encryptSHA256(pwd);
		
		//가공처리된 자료들을 vo에 담아서 db에 넘겨준다.
		PdsVO vo = new PdsVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		vo.setfSize(fileSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setPwd(pwd);
		vo.setOpenSw(openSw);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		PdsDAO dao = new PdsDAO();
		int res=dao.setPdsInputOk(vo);
		if(res==1) {
			request.setAttribute("msg", "업로드가 완료되었습니다.");
			request.setAttribute("url", "pdsList.pds");
			
		} else {
			request.setAttribute("msg", "업로드에 실패했습니다.");
			request.setAttribute("url", "pdsInput.pds");
		}
		
		
	
	}

}
