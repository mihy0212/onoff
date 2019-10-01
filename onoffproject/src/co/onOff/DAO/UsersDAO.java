package co.onOff.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.onOff.DTO.UsersDTO;

public class UsersDAO extends DAO {

	private PreparedStatement psmt;
	private ResultSet rs;

	public UsersDAO() {
		super();
}
	
	
	public int insertUsers(UsersDTO dto) { //권보성 회원가입정보업데이트
		int n = 0;
		String sql = "insert into member values(?,?,?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserId());
			psmt.setString(2, dto.getUserPw());
			psmt.setString(3, dto.getUserName());
			psmt.setString(4, dto.getUserEmail());
			psmt.setString(5, dto.getUserTel());
			psmt.setString(6, dto.getUserNick());
			psmt.setString(7, dto.getUserAddr());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return n;
	}

	public boolean isIdCheck(String id) { // id 중복체크 //권보성 회원가입정보업데이트 중복확인
		boolean chk = true; // 존재하지 않으면
		String sql = "select userId from member where userId = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				chk = false; // 존재 하면
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return chk;
	}
	
	private void close() { //권보성 DB Close
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
