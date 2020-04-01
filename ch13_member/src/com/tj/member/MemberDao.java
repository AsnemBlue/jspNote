package com.tj.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	public static final int SUCCESS = 1;	//회원가입, 정보수정
	public static final int FAIL = 0;		//회원가입, 정보수정
	public static final int LOGIN_SUCCESS = 1; //로그인 성공
	public static final int LOGIN_FAIL_ID = -1; //로그인 오류(ID오류)
	public static final int LOGIN_FAIL_PW = 0;  //로그인 비번 오류
	public static final int MEMBER_NONEXISTENT = 1; //중복id
	public static final int MEMBER_EXISTENT = 0;
	
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	private MemberDao() {}
	//conn객체 가져오는 함수
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int confirmId(String id) {
		int result = MEMBER_EXISTENT;
		Connection 		  conn  = null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs	= null;
		String sql = "SELECT * FROM MEMBER WHERE ID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = MEMBER_EXISTENT;
			}else {
				result = MEMBER_NONEXISTENT;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	!=null) rs	 .close();
				if(pstmt!=null) pstmt.close();
				if(conn	!=null) conn .close();
			} catch (Exception e2) {}
		}
		return result;
	}
	public int insertMember(MemberDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER (ID,PW,NAME,EMAIL,BIRTH,RDATE,ADDRESS) VALUES (?,?,?,?,?,SYSDATE,?)";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString		(1, dto.getId()		);
			pstmt.setString		(2, dto.getPw()		);
			pstmt.setString		(3, dto.getName()	);
			pstmt.setString		(4, dto.getEmail()	);
			pstmt.setTimestamp	(5, dto.getBirth()	);
			pstmt.setString		(6, dto.getAddress());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"회원가입성공":"회원가입실패"+dto.toString());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn	!=null) conn .close();
			} catch (Exception e2) {}
		}
		return result;
	}
	public int loginCheck(String id, String pw) {
		int result = LOGIN_FAIL_ID;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE ID=?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPw = rs.getString("pw");
				if(dbPw.equals(pw)) {
					result = LOGIN_SUCCESS;
				} else {
					result = LOGIN_FAIL_PW;
				}
			}else {
				result = LOGIN_FAIL_ID;
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			try {
				if(rs	!=null) rs	 .close();
				if(pstmt!=null) pstmt.close();
				if(conn	!=null) conn .close();
			} catch (Exception e2) {}
		}
		return result;
	}
//4.get Dto by id
	public MemberDto getMember(String id) {
		MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE ID=?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDto();
				dto.setId		(id);
				dto.setPw		(rs.getString	("pw"		));
				dto.setName		(rs.getString	("name"		));
				dto.setEmail	(rs.getString	("email"	));
				dto.setBirth	(rs.getTimestamp("birth"	));
				dto.setrDate	(rs.getDate		("rdate"	));
				dto.setAddress	(rs.getString	("address"	));
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			try {
				if(rs	!=null) rs	 .close();
				if(pstmt!=null) pstmt.close();
				if(conn	!=null) conn .close();
			} catch (Exception e2) {}
		}
		return dto;
	}
//5.modify
	public int updateMember(MemberDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET PW=?, " + 
					" NAME=?, EMAIL=?, BIRTH=?, ADDRESS=? 		WHERE ID=?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString		(1, dto.getPw()		);
			pstmt.setString		(2, dto.getName()	);
			pstmt.setString		(3, dto.getEmail()	);
			pstmt.setTimestamp	(4, dto.getBirth()	);
			pstmt.setString		(5, dto.getAddress());
			pstmt.setString		(6, dto.getId()		);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"정보수정 성공":"정보수정 실패"+dto.toString());
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("정보수정 실패"+dto.toString());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn	!=null) conn .close();
			} catch (Exception e2) {}
		}
		return result;
	}
}
