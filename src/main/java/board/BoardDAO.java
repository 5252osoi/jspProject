package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class BoardDAO {
	private Connection conn=GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs= null;
	private String sql="";
	
	BoardVO vo = null;
	
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
	//전체조회
	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql="select *, timestampdiff(hour,wDate,now()) as hour_diff, datediff(now(), wDate) as date_diff from board order by idx desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));;
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
				
				vos.add(vo);
			}
		} catch (Exception e) {
			System.out.println("SQL구문오류 : " +e.getMessage());
		} finally {
			rsClose();
		}
		
		return vos;
	}
	public int setBoardInputOk(BoardVO vo) {
		int res=0;
		try {
			sql="insert into board values(default,?,?,?,?,?,?,default,?,?,default,default)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getHomePage());
			pstmt.setString(6, vo.getContent());
			pstmt.setString(7, vo.getHostIp());
			pstmt.setString(8, vo.getOpenSw());
			res=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql="select count(*) as cnt from board";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totRecCnt=rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("SQL구문오류 : " +e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}
	
	//게시글 내용 보기
	public BoardVO getBoardContent(int idx) {
		vo = new BoardVO();
		try {
			sql="select * from board where idx = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));;
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				
			}
		} catch (Exception e) {
			System.out.println("SQL구문오류 : " +e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	//게시글 조회수 1씩 증가시키기
	public void setBoardReadNumPlus(int idx) {
		try {
			sql="update board set readNum = readNum+1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}
	
	//좋아요 수 1씩 증가
	public void setBoardGoodCheck(int idx) {
		try {
			sql="update board set good = good+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	//글 내용 수정
	public int setBoardUpdateOk(BoardVO vo) {
		int res=0;
		try {
			sql="update board set title=?,email=?,homePage=?,content=?,openSw=?,hostIp=? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomePage());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getOpenSw());
			pstmt.setString(6, vo.getHostIp());
			pstmt.setInt(7, vo.getIdx());
			res=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	//게시글삭제
	public int setBoardDelete(int idx) {
		int res=0;
		try {
			sql="delete from board where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	//좋아요 1씩증가시키기(중복허용)
	public void setBoardGoodCheckPlus(int idx) {
		try {
			sql="update board set good = good+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}
	//좋아요 1씩감소시키기(중복허용)
	public void setBoardGoodCheckMinus(int idx) {
		try {
			sql="update board set good = good-1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}
	public ArrayList<BoardVO> getBoardContentSearch(String search, String searchString, int startIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql="select *, timestampdiff(hour,wDate,now()) as hour_diff from board where "+search+" like ? order by idx desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));;
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				
				vos.add(vo);
			}
			
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			rsClose();
		}
		
		return vos;
	}
	public BoardVO getPreNexSearch(int idx, String str) {
		vo = new BoardVO();
		try {
			if(str.equals("preVo")) {
				sql="select idx,title from board where idx < ? order by idx desc limit 1";
			} else {
				sql="select idx,title from board where idx > ? order by idx limit 1";
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
			}
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	public int getSearchCnt(String search, String searchString) {
		int totRecCnt=0;
		try {
			sql="select count(*) as cnt from board where "+search+" like ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totRecCnt=rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("SQL구문오류 : "+e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}
}
