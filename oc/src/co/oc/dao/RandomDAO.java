package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;

import co.oc.dto.RandomDTO;

public class RandomDAO extends DAO {

	private static RandomDAO instance = new RandomDAO();
	public static RandomDAO getInstance() {
		return instance;
	}
	
	public int select(Connection conn, RandomDTO dto) {
		int n = 0;
		String sql = "select count(*) from oc_random where user_email=? and random_key=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserEmail());
			psmt.setString(2, dto.getRandomKey());
			rs = psmt.executeQuery();
			if(rs.next()) {
				n = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int insert(Connection conn, RandomDTO dto) {
		int n = 0;
		String sql = "insert into oc_random (user_email, random_key) values (?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserEmail());
			psmt.setString(2, dto.getRandomKey());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 새로운 신청 등록 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	

	public int delete(Connection conn, String userEmail) {
		int n = 0;
		String sql = "delete from oc_random where user_email=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userEmail);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 신청 정보 삭제");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
}
