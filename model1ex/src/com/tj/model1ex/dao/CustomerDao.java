package com.tj.model1ex.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tj.model1ex.dto.CustomerDto;

public class CustomerDao {
	public static final int SUCCESS = 1; // 회원가입, 정보수정 할 때
	public static final int FAIL = 0;    // 회원가입, 정보수정 할 때
	public static final int LOGIN_SUCCESS = 1; // 로그인 성공
	public static final int LOGIN_FAIL = 0; // 로그인 오류(ID오류)
	public static final int CUSTOMER_EXISTENT = 0; // 있는(중복된) ID
	public static final int CUSTOMER_NONEXISTENT = 1; // 없는(사용가능한) ID
	
	private static CustomerDao instance = new CustomerDao();
	public static CustomerDao getInstance() {
		return instance;
	}
	private CustomerDao() {}
	// conn객체 가져오는 함수
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		} 
		return conn;
	}
	// 1. 회원가입시 id 중복체크 (매개변수 :cid)
	public int confirmId(String cid) {
		int result = CUSTOMER_NONEXISTENT;
		Connection 		  conn  = null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs	= null;
		String sql = "SELECT * FROM CUSTOMER WHERE CID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = CUSTOMER_EXISTENT;
			}else {
				result = CUSTOMER_NONEXISTENT;
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
	// 2. 회원가입 (매개변수 :dto)
	public int insertCustomer(CustomerDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) " + 
					 " VALUES (?,?,?,?,?,?,?,?)";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString		(1, dto.getCid()		);
			pstmt.setString		(2, dto.getCpw()		);
			pstmt.setString		(3, dto.getCname()		);
			pstmt.setString		(4, dto.getCtel()		);
			pstmt.setString		(5, dto.getCemail()		);
			pstmt.setString		(6, dto.getCaddress()	);
			pstmt.setString		(7, dto.getCgender()	);
			pstmt.setDate		(8, dto.getCbirth()		);
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
	// 3. 로그인 처리 (매개변수 : id, pw)
	public int loginCheck(String cid, String cpw) {
		int result = LOGIN_FAIL;
		Connection 		  conn  = null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs	= null;
		String sql = "SELECT * FROM CUSTOMER WHERE CID=? and CPW=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, cpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = LOGIN_SUCCESS;
			}else {
				result = LOGIN_FAIL;
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
	// 4. id로 DTO가져오기 (매개변수 : id)
	public CustomerDto getCustomer(String cid) {
		CustomerDto 	  dto 	= null;
		Connection 		  conn  = null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs	= null;
		String sql = "SELECT * FROM CUSTOMER WHERE CID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new CustomerDto();
				dto.setCid			(cid);		
				dto.setCpw			(rs.getString("Cpw"		));
				dto.setCname		(rs.getString("Cname"	));
				dto.setCtel			(rs.getString("Ctel"	));
				dto.setCemail		(rs.getString("Cemail"	));
				dto.setCaddress		(rs.getString("Caddress"));
				dto.setCgender		(rs.getString("Cgender"	));
				dto.setCbirth	 	(rs.getDate	 ("Cbirth"	));
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
		return dto;

	}
	// 5. 회원정보 수정 (매개변수 : dto)
	public int updateCustomer(CustomerDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " UPDATE CUSTOMER SET CPW=?, " + 
				"                CNAME=?, " + 
				"                CTEL =?, " + 
				"                CEMAIL=?, " + 
				"                CADDRESS=?, " + 
				"                CBIRTH=to_date(?,'yyyy-mm-dd'), " + 
				"                CGENDER = ? " + 
				"        		 WHERE CID=?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString		(1, dto.getCpw()		);
			pstmt.setString		(2, dto.getCname()		);
			pstmt.setString		(3, dto.getCtel()		);
			pstmt.setString		(4, dto.getCemail()		);
			pstmt.setString		(5, dto.getCaddress()	);
			pstmt.setDate		(6, dto.getCbirth()		);
			pstmt.setString		(7, dto.getCgender()	);
			pstmt.setString		(8, dto.getCid()		);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"정보수정성공":"정보수정실패"+dto.toString());
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
	//회원목록
	public ArrayList<CustomerDto> listCustomer(int startRow, int endRow){
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection 		  conn 	= null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs 	= null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT * FROM CUSTOMER ORDER BY CID) A) WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String cid		 = rs.getString("cid"		);
				String cpw		 = rs.getString("cpw"		);
				String cname	 = rs.getString("cname"		);
				String ctel		 = rs.getString("ctel"		);
				String cemail	 = rs.getString("cemail"	);
				String caddress	 = rs.getString("caddress"	);
				Date   cbirth	 = rs.getDate  ("cbirth"	);
				String cgender	 = rs.getString("cgender"	);
				Timestamp crdate = rs.getTimestamp("crdate"); 
				dtos.add(new CustomerDto(cid, cpw, cname, ctel, cemail, caddress, cbirth, cgender, crdate));
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
		return dtos;
	}
	//등록된 회원수 가져오기
	public int getCustomerTotCnt() {
		int totCnt = 0;
		Connection 		  conn  = null;
		PreparedStatement pstmt = null;
		ResultSet 		  rs 	= null;
		String sql="SELECT COUNT(*) TOTCNT FROM CUSTOMER";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totCnt = rs.getInt("totcnt");
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
		return totCnt;
	}
	
}
