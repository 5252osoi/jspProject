package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class PdsDAO {
	private Connection conn=GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs= null;
	private String sql="";
	
	PdsVO vo = null;
	
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
	//자료실 전체(part)리스트
	public ArrayList<PdsVO> getPdsList(String part) {
		ArrayList<PdsVO> vos = new ArrayList<PdsVO>();
		try {
			if(part.equals("전체")) {
				sql="select * from pds order by idx desc";
				pstmt=conn.prepareStatement(sql);
				
			}else {
				sql="select * from pds where part = ? order by idx desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, part);
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setPart(rs.getString("part"));
				vo.setPwd(rs.getString("pwd"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		}finally {
			rsClose();
		}
		
		return vos;
	}
	public int setPdsInputOk(PdsVO vo) {
		int res=0;
		try {
			sql="insert into pds values(default,?,?,?,?,?,?,?,?,default,default,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setInt(5, vo.getfSize());
			pstmt.setString(6, vo.getTitle());
			pstmt.setString(7, vo.getPart());
			pstmt.setString(8, vo.getPwd());
			pstmt.setString(9, vo.getOpenSw());
			pstmt.setString(10, vo.getContent());
			pstmt.setString(11, vo.getHostIp());
			res=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}
	
	//idx검색처리로 1건 가져오기
	public PdsVO getPdsIdxSearch(int idx) {
		vo = new PdsVO();
		try {
			sql = "select * from pds where idx=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setPart(rs.getString("part"));
				vo.setPwd(rs.getString("pwd"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		}finally {
			rsClose();
		}
		return vo;
	}
	public String setPdsDeleteOk(int idx) {
		int res=0;
		try {
			sql="delete from pds where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		}finally {
			pstmtClose();
		}
		return res+"";
	}
	public void setPdsDownNumCheck(int idx) {
		try {
			sql="update pds set downNum = downNum+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		}finally {
			pstmtClose();
		}
	}
}