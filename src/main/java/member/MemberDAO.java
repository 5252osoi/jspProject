package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class MemberDAO {
	//GetConn getConn = GetConn.getInstance();
	//private Connection conn = getConn.getConn();
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	private String sql="";
	MemberVO vo = null;
	
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
	
	// ID중복체크
	public MemberVO getMemberMidCheck(String mid) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	public MemberVO getMemberNickCheck(String nickName) {
		vo = new MemberVO();
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql="insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	public MemberVO getMemberEmailCheck(String email) {
		vo = new MemberVO();
		try {
			sql = "select * from member where email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	public int setMemberImsiPwd(String pwd, String mid) {
		int res=0;
		try {
			sql="update member set pwd=? where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			res=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	public void setLoginUpdate(MemberVO vo) {
		try {
			sql = "update member set point=?, lastDate=now(), todayCnt=?, visitCnt=visitCnt+1  where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPoint());
			pstmt.setInt(2, vo.getTodayCnt());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	public int setMemberUpdateOk(MemberVO vo) {
		int res=0;
		try {
			sql="update member set nickName=?,name=?,gender=?,birthday=?,tel=?,"
					+ "address=?,email=?,homePage=?,job=?,hobby=?,photo=?,content=?,userInfor=? where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getHomePage());
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getHobby());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getContent());
			pstmt.setString(13, vo.getUserInfor());
			pstmt.setString(14, vo.getMid());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	//비밀번호 변경
	public void setMemberPwdUpdate(String mid, String pwdUid) {
		try {
			sql = "update member set pwd = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwdUid);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}
	
	//회원 전체체리스트
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "select * from member order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	public int setMemberLevelChange(int idx, int level) {
		int res=0;
		try {
			sql="update member set level=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			res=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	public ArrayList<MemberVO> getMemberLevelSearchList(int level) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "select * from member where level=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vos.add(vo);	
			}
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	
	
}
