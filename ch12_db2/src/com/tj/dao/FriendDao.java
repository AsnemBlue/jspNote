package com.tj.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tj.dto.FriendDto;

public class FriendDao {
	private String driver   = "oracle.jdbc.driver.OracleDriver";
	private String url	    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String user 	= "scott";
	private String password = "tiger";
	private static FriendDao instance = new FriendDao();
	
	public static FriendDao getInstance() {
		return instance;
	}
	private FriendDao() {
		try {
			Class.forName(driver);
		}catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
	
//메소드
	public ArrayList<FriendDto> listup(){
		ArrayList<FriendDto> dtos = new ArrayList<FriendDto>();
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs	= null;
		String sql = "SELECT * FROM FRIEND";
		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			while(rs.next()) {
				FriendDto dto = new FriendDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dtos.add(dto);
			}
		}catch (Exception e){
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs	!=null) rs	.close();
				if(stmt !=null) stmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {}
		}
		return dtos;
		
	}
	public int addFriend(FriendDto dto) {
		int result=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO FRIEND VALUES(FRIEND_SEQNO.nextval, ?,?)";
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTel());
			result = pstmt.executeUpdate();
			System.out.println(result>0 ? "성공" : dto.toString()+"실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(dto.toString()+"추가실패");	
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn .close();
			} catch (Exception e2) {}
		}
		
		
		return result;
	}
}
