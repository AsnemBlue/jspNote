package com.tj.model1ex.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tj.model1ex.dto.FileboardDto;

public class FileboardDao {
	public static final int SUCCESS = 1; 
	public static final int FAIL = 0;
	
	private static FileboardDao instance = new FileboardDao();
	public static FileboardDao getInstance() {
		return instance;
	}
	private FileboardDao() {}
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
	
	//글목록(startRow~endRow)
	public ArrayList<FileboardDto> listFileboard(int startRow, int endRow){
		ArrayList<FileboardDto> dtos = new ArrayList<FileboardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT F.*, CNAME,CEMAIL FROM FILEBOARD F, CUSTOMER C " + 
				"    WHERE F.CID=C.CID ORDER BY FREF DESC, FRE_STEP) A) WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int		fnum	 	= rs.getInt		("fnum"	 	); 
				String 	cid  		= rs.getString	("cid"  	);
				String 	fsubject  	= rs.getString	("fsubject" );
				String 	fcontent 	= rs.getString	("fcontent" );
				String 	ffilename 	= rs.getString	("ffilename");
				String 	fpw			= rs.getString	("fpw"		);
				int 	fhit		= rs.getInt		("fhit"		);
				int 	fref		= rs.getInt		("fref"		);
				int 	fre_step	= rs.getInt		("fre_step"	);
				int 	fre_level	= rs.getInt		("fre_level");
				String 	fip			= rs.getString	("fip"		);
				Date	frdate  	= rs.getDate	("frdate"  	);
				String 	cname		= rs.getString	("cname"	);
				String 	cemail		= rs.getString	("cemail"	);
				dtos.add(new FileboardDto(fnum, cid, fsubject, fcontent, ffilename, fpw, fhit, fref, fre_step, fre_level, fip, frdate, cname, cemail));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
		return dtos;
	}
	//글갯수
	public int getFileboardTotCnt() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM FILEBOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
		return totCnt;
	}
	//글 쓰기
	public int insertFileboardTotCnt(FileboardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FILEBOARD (FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, FREF, FRE_STEP, FRE_LEVEL, FIP) " + 
				"    VALUES(FILEBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?,FILEBOARD_SEQ.CURRVAL, 0, 0 , ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCid());
			pstmt.setString(2, dto.getFsubject());
			pstmt.setString(3, dto.getFcontent());
			pstmt.setString(4, dto.getFfilename());
			pstmt.setString(5, dto.getFpw());
			pstmt.setString(6, dto.getFip());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"글쓰기성공" : "글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("글쓰기 예외 : "+dto.toString());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
	//답변쓰기 STEP a수행(REF가 같고 원글의 RE_STEP보다 많은경우 RE_STEP++)
	private void preReflyStepA(int fref, int fre_step) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD SET FRE_STEP = FRE_STEP+1 WHERE FREF=? AND FRE_STEP>?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fref);
			pstmt.setInt(2, fre_step);
			int result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"기존 답변글 위치조정 성공" : "답변글 위치조정 실패 or 첫답글");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
	//답변쓰기
	public int reply(FileboardDto dto) {
		int result = FAIL;
		preReflyStepA(dto.getFref(), dto.getFre_step());
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FILEBOARD (FNUM, CID, FSUBJECT, FCONTENT, FFILENAME, FPW, FREF, FRE_STEP, FRE_LEVEL, FIP) " + 
				"    VALUES(FILEBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ? , ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCid()			);
			pstmt.setString(2, dto.getFsubject()	);
			pstmt.setString(3, dto.getFcontent()	);
			pstmt.setString(4, dto.getFfilename()	);
			pstmt.setString(5, dto.getFpw()			);
			pstmt.setInt   (6, dto.getFref()		);
			pstmt.setInt   (7, dto.getFre_step()+1	);
			pstmt.setInt   (8, dto.getFre_level()+1	);
			pstmt.setString(9, dto.getFip()			);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"글쓰기성공" : "글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("글쓰기 예외 : "+dto.toString());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
	//글 상세보기
	public FileboardDto getFileBoard(int fnum) {
		FileboardDto dto 		= null;
		Connection conn 		= null;
		PreparedStatement pstmt = null;
		ResultSet rs 			= null;
		String sql = "SELECT F.*, CNAME, CEMAIL FROM FILEBOARD F, CUSTOMER C WHERE F.CID=C.CID AND FNUM=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String 	cid  		= rs.getString	("cid"  	);
				String 	fsubject  	= rs.getString	("fsubject" );
				String 	fcontent 	= rs.getString	("fcontent" );
				String 	ffilename 	= rs.getString	("ffilename");
				String 	fpw			= rs.getString	("fpw"		);
				int 	fhit		= rs.getInt		("fhit"		);
				int 	fref		= rs.getInt		("fref"		);
				int 	fre_step	= rs.getInt		("fre_step"	);
				int 	fre_level	= rs.getInt		("fre_level");
				String 	fip			= rs.getString	("fip"		);
				Date	frdate  	= rs.getDate	("frdate"  	);
				String 	cname		= rs.getString	("cname"	);
				String 	cemail		= rs.getString	("cemail"	);
				dto = (new FileboardDto(fnum, cid, fsubject, fcontent, ffilename, fpw, fhit, fref, fre_step, fre_level, fip, frdate, cname, cemail));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	!=null) rs	 .close();
				if(pstmt!=null) pstmt.close();
				if(conn	!=null) conn .close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
		return dto;
	}
	//조회수 올리기
	public void hitUp(int fnum) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD SET FHIT=FHIT+1 WHERE FNUM=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fnum);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"조회수 올리기 성공" : "조회수 올리기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
	//글 수정하기
	public int updateFileBoard(FileboardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD SET FSUBJECT=?,FCONTENT=?,FFILENAME=?, FPW=?, FIP=? WHERE FNUM=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getFsubject()	);
			pstmt.setString(2, dto.getFcontent()	);
			pstmt.setString(3, dto.getFfilename()	);
			pstmt.setString(4, dto.getFpw()			);
			pstmt.setString(5, dto.getFip()			);
			pstmt.setInt   (6, dto.getFnum()		);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"글수정성공" : "글수정실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
	//글 삭제하기
	public int deleteFileBoard(int fnum, String fpw) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM FILEBOARD WHERE FNUM=? AND FPW=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt   (1, fnum);
			pstmt.setString(2, fpw );
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"글삭제 성공" : "글삭제 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
}
