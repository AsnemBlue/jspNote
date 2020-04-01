package com.tj.pr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	private static BoardDao instance = new BoardDao();
	public static BoardDao getinstance() {
		return instance;
	}
	private BoardDao() {}
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
//글 목록 불러오기	
	public ArrayList<BoardDto> listup() {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection 			conn  = null;
		PreparedStatement 	pstmt = null;
		ResultSet			rs	  = null;
		String sql = "SELECT * FROM BOARDPR ORDER BY REF DESC, RE_STEP";
		try {
			conn 	= getConnection();
			pstmt 	= conn.prepareStatement(sql);
			rs 		= pstmt.executeQuery();
			while(rs.next()) {
				int 	num      = rs.getInt	("num		");
				int 	ref      = rs.getInt	("ref		");
				int 	re_step  = rs.getInt	("re_step	");
				int 	re_level = rs.getInt	("re_level	");
				String 	writer   = rs.getString	("writer	");
				String 	pw       = rs.getString	("pw		");
				String 	content  = rs.getString	("content	");
				int 	hit      = rs.getInt	("hit		");
				String 	ip     	 = rs.getString	("ip		");
				dtos.add(new BoardDto(num, ref, re_step, re_level, writer, pw, content, hit, ip));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs	 !=null) rs		.close();
				if(pstmt !=null) pstmt	.close();
				if(conn	 !=null) conn	.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return dtos;
	}
// 글 갯수 불러오기
	 
}
