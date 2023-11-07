package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//직렬화(서비스객체에서 처리해서 값을 넘기고싶어서 인터페이스를 만든 후 작업시키려고)
public interface TestReInterface {
	public void execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException;
}
