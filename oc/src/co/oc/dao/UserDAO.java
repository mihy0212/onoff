package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.UserDTO;

public class UserDAO extends DAO{
	
	private static UserDAO instance=new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}

	public List<UserDTO> selectAll(Connection conn){
		List<UserDTO> list = new ArrayList<UserDTO>();
		String sql = "select * from oc_user order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUserNum(rs.getString("user_num"));
				dto.setUserEmail(rs.getString("user_email"));
				dto.setUserPw(rs.getString("user_pw"));
				dto.setUserName(rs.getString("user_name"));
				dto.setUserNick(rs.getString("user_nick"));
				dto.setUserAddr(rs.getString("user_addr"));
				dto.setUserXy(rs.getString("user_xy"));
				dto.setUserGrant(rs.getString("user_grant"));
				dto.setStoreNum(rs.getString("store_num"));
				dto.setUserInday(rs.getDate("user_inday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(Connection conn, UserDTO dto) {
		int n = 0;
		String sql = "insert into oc_user (user_num," //1
				+ " user_email,"	//2
				+ " user_pw,"		//3
				+ " user_name,"		//4
				+ " user_nick,"		//5
				+ " user_addr,"		//6
				+ " user_xy,"		//7
				+ " user_grant,"	//8
				+ " store_num"		//9
				+ ") values"	
				+ "(oc_user_num_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserEmail());
			psmt.setString(2, dto.getUserPw());
			psmt.setString(3, dto.getUserName());
			psmt.setString(4, dto.getUserNick());
			psmt.setString(5, dto.getUserAddr());
			psmt.setString(6, dto.getUserXy());
			psmt.setString(7, dto.getUserGrant());
			psmt.setString(8, dto.getStoreNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 회원정보 등록 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int update(Connection conn, UserDTO dto) {
		int n = 0;
		String sql = "update oc_user set"
				+ " user_pw=?,"		//1
				+ " user_nick=?,"	//2
				+ " user_addr=?,"	//3
				+ " user_xy=?,"		//4
				+ " user_grant=?,"	//5
				+ " store_num=?"	//6
				+ " where user_num=?";	//7
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserPw());
			psmt.setString(2, dto.getUserNick());
			psmt.setString(3, dto.getUserAddr());
			psmt.setString(4, dto.getUserXy());
			psmt.setString(5, dto.getUserGrant());
			psmt.setString(6, dto.getStoreNum());
			psmt.setString(7, dto.getUserNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 회원정보 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int delete(Connection conn, String userNum) {
		int n = 0;
		String sql = "delete from oc_user where user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 회원정보 삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
}
