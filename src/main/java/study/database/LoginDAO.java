package study.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	String sql = "";
	
	private LoginVO vo = null;
	
	//DAO객체의 생성과 동시에 DB접속처리
	public LoginDAO() {
		String url="jdbc:mysql://localhost:3306/javaProject";
		String user="root";
		String password="1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패"+e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 실패"+e.getMessage());
		}
	}
	//사용한 객체의 반납(conn객체 반납)
	public void connClose() {
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {}
		}
	}
	//pstmt객체 반납
	public void pstmtClose() {
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	//rs객체반납
	public void rsClose() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}
	//로그인 처리
	public LoginVO getLoginCheck(String mid, String pwd) {
		vo = new LoginVO();
		try {
			sql="select * from login where mid=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCount(rs.getInt("todayCount"));
			}
		} catch (SQLException e) {
			System.out.println("sql 구문 오류입니다 : "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	//전체조회처리
	public ArrayList<LoginVO> getLoginList() {
		ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
		try {
			sql="select * from login order by name";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCount(rs.getInt("todayCount"));	
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 구문 오류입니다 : "+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	public LoginVO getLoginList(String mid) {
		vo = new LoginVO();
		try {
			sql="select * from login where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCount(rs.getInt("todayCount"));
			}
		} catch (SQLException e) {
			System.out.println("sql 구문 오류입니다 : "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
}
