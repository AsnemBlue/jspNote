package com.tj.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tj.dto.MemberDto;

//회원 리스트(select * from member 출력), 회원가입
public class MemberDao2 {
	private String driver   = "oracle.jdbc.driver.OracleDriver";
	private String url	    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String user 	= "scott";
	private String password = "tiger";
	private static MemberDao2 instance = new MemberDao2();	//MemberDao 객체를 가르키는 변수
	//외부에서 객체생성시 MemberDao dao = MemberDao.getInstance();
	public static MemberDao2 getInstance() {
		return instance;
	}
	
	private MemberDao2() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
	public ArrayList<MemberDto> selectAll(){
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs	= null;
		String sql = "SELECT * FROM MEMBER";
		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				dtos.add(new MemberDto(id, name, pw, phone1, phone2, phone3, gender));
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
	public int insertMember(MemberDto dto) {
		int result=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?)";
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getPhone1());
			pstmt.setString(5, dto.getPhone2());
			pstmt.setString(6, dto.getPhone3());
			pstmt.setString(7, dto.getGender());
			result = pstmt.executeUpdate();
			System.out.println(result>0 ? "성공" : dto.toString()+"실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(dto.toString()+"실패");
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn .close();
			} catch (Exception e2) {}
		}
		return result;
	}
	
}
