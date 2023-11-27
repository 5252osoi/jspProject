package study2.apiTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import schedule.ScheduleVO;

public class ApiDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	// pstmt 객체 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	// rs 객체 반납
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}
	//범죄현황 DB에 저장
	public void setSaveCrimeData(ApiVO vo) {
		try {
			sql="insert into crime values (default,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getYear());
			pstmt.setString(2, vo.getPolice());
			pstmt.setInt(3, vo.getRobbery());
			pstmt.setInt(4, vo.getMurder());
			pstmt.setInt(5, vo.getTheft());
			pstmt.setInt(6, vo.getViolence());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	//범죄현황 년도로 검색
	public int getSearchYear(int year) {
		int res=0;
		try {
			sql="select * from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs=pstmt.executeQuery();
			if(rs.next())res=1;
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	public String setCrimeDeleteOk(int year) {
		String str="삭제 실패";
		try {
			sql="delete from crime where year=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.executeUpdate();
			str="1";
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return str;
	}

	public ApiVO getListCrimeData(int year) {
		ApiVO vo = new ApiVO();
		try {
			sql ="select year,sum(robbery) as totRobbery,sum(murder) as totMurder,sum(theft) as totTheft,sum(violence) as totViolence, "
					+ " avg(robbery) as avgRobbery,avg(murder) as avgMurder,avg(theft) as avgTheft,avg(violence) as avgViolence "
					+ " from crime where year = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setYear(year);
				vo.setTotRobbery(rs.getInt("totRobbery"));
				vo.setTotMurder(rs.getInt("totMurder"));
				vo.setTotTheft(rs.getInt("totTheft"));
				vo.setTotViolence(rs.getInt("totViolence"));
				vo.setAvgRobbery(rs.getDouble("avgRobbery"));
				vo.setAvgMurder(rs.getDouble("avgMurder"));
				vo.setAvgTheft(rs.getDouble("avgTheft"));
				vo.setAvgViolence(rs.getDouble("avgViolence"));
			}
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
}
