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

import com.tj.model1ex.dto.BookDto;

public class BookDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 1;
	private static BookDao instance;
	public static BookDao getInstance() {
		if(instance==null) {
			instance = new BookDao();
		}
		return instance;
	}
	private BookDao() {}
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
	//책등록
	public int insertBook(BookDto book) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOOK(BID ,BTITLE ,BPRICE ,BIMAGE1 ,BIMAGE2 ,BCONTENT ,BDISCOUNT) VALUES(BOOK_SEQ.NEXTVAL, ?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString	(1, book.getBtitle()	);
			pstmt.setInt	(2, book.getBprice()	);
			pstmt.setString	(3, book.getBimage1()	);
			pstmt.setString	(4, book.getBimage2()	);
			pstmt.setString	(5, book.getBcontent()	);
			pstmt.setInt	(6, book.getBdiscount()	);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS?"등록성공":"등록실패");
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
	//책목록
	public ArrayList<BookDto> listBook(){
		ArrayList<BookDto> books = new ArrayList<BookDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOOK ORDER BY BRDATE DESC";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int		bid	 		= rs.getInt		("bid"); 
				String 	btitle  	= rs.getString	("btitle");
				int 	bprice  	= rs.getInt		("bprice");
				String 	bimage1 	= rs.getString	("bimage1");
				String 	bimage2 	= rs.getString	("bimage2");
				String 	bcontent	= rs.getString	("bcontent");
				int 	bdiscount	= rs.getInt		("bdiscount");
				Date	brdate  	= rs.getDate	("brdate");
				books.add(new BookDto(bid, btitle, bprice, bimage1, bimage2, bcontent, bdiscount, brdate));
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
		return books;
	}
	//책목록(페이징)
	public ArrayList<BookDto> listBook(int startRow, int endRow){
		ArrayList<BookDto> books = new ArrayList<BookDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A) WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bid 		= rs.getInt		("bid"		);
				String btitle 	= rs.getString	("btitle"	);
				int bprice 		= rs.getInt		("bprice"	);
				String bimage1 	= rs.getString	("bimage1"	);
				String bimage2  = rs.getString	("bimage2"	);
				String bcontent = rs.getString	("bcontent"	);
				int bdiscount  	= rs.getInt		("bdiscount");
				Date brdate 	= rs.getDate	("brdate"	);

				books.add(new BookDto(bid, btitle, bprice, bimage1, bimage2, bcontent, bdiscount, brdate));
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
		return books;
	}
	//전체등록된 책갯수
	public int getBookTotCnt() {
		int bookTotCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT COUNT(*) totCnt FROM BOOK";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bookTotCnt = rs.getInt("totCnt");
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
		
		return bookTotCnt;
	}
	//책상세보기
	public BookDto getBook(int bid) {
		BookDto book = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOOK WHERE BID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String 	btitle  	= rs.getString	("btitle");
				int 	bprice  	= rs.getInt		("bprice");
				String 	bimage1 	= rs.getString	("bimage1");
				String 	bimage2 	= rs.getString	("bimage2");
				String 	bcontent	= rs.getString	("bcontent");
				int 	bdiscount	= rs.getInt		("bdiscount");
				Date	brdate  	= rs.getDate	("brdate");
				book = new BookDto(bid, btitle, bprice, bimage1, bimage2, bcontent, bdiscount, brdate);
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
		return book;
	}
}
