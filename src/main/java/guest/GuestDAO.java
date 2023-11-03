package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	String sql="";
	GuestVO vo=null;
	
	public GuestDAO() {
		String url="jdbc:mysql://localhost:3306/javaProject";
		String user="root";
		String password="1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색실패. 드라이버의 경로를 확인해주세요." +e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB연동에 실패했습니다. SQL의 url,아이디와 비밀번호를 확인해주세요." +e.getMessage());
//			e.printStackTrace();
		}
	}
	//사용된객체반납
	public void connClose(){
		if(conn !=null) {
			try {
				conn.close();
			} catch (Exception e) {}
		}
	}
	
	public void pstmtClose(){
		if(pstmt !=null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose(){
		if(rs !=null) {
			try {
				rs.close();
			} catch (Exception e) {}
		}
		pstmtClose();
	}
	
	//방명록 전체 리스트 출력
	public ArrayList<GuestVO> getGuestList() {
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql="select * from guest order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문오류 "+e.getMessage());
//			e.printStackTrace();
		} finally {
			rsClose();
		}
		
		return vos;
	}
	
	//방명록작성
	public int setGuestInput(GuestVO vo) {
		int res=0;
			try {
				sql="insert into guest values(default,?,?,?,?,default,?)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, vo.getName());
				pstmt.setString(2, vo.getContent());
				pstmt.setString(3, vo.getEmail());
				pstmt.setString(4, vo.getHomePage());
				pstmt.setString(5, vo.getHostIp());
				res=pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("SQL구문오류 "+e.getMessage());
//				e.printStackTrace();
			} finally {
				pstmtClose();
			}
		return res;
	}
}
