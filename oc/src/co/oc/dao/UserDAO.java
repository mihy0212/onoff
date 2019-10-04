package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import co.oc.dto.UserDTO;

public class UserDAO extends DAO{
	
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}

	//회원 전체 조회
	public List<UserDTO> selectAll(Connection conn){
		List<UserDTO> list = new ArrayList<UserDTO>();
		String sql = "select * from oc_user order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUserNum(rs.getString("user_num"));		//1
				dto.setUserEmail(rs.getString("user_email"));	//2
				dto.setUserPw(rs.getString("user_pw"));			//3
				dto.setUserName(rs.getString("user_name"));		//4
				dto.setUserNick(rs.getString("user_nick"));		//5
				dto.setUserAddr(rs.getString("user_addr"));		//6
				dto.setUserXy(rs.getString("user_xy"));			//7
				dto.setUserGrant(rs.getString("user_grant"));	//8
				dto.setStoreNum(rs.getString("store_num"));		//9
				dto.setUserInday(rs.getDate("user_inday"));		//10
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//회원 한 명 조회
	public UserDTO selectOne(Connection conn, String userNum) {
		UserDTO dto = new UserDTO();
		String sql = "select * from oc_user where user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setUserNum(rs.getString("user_num"));		//1
				dto.setUserEmail(rs.getString("user_email"));	//2
				dto.setUserPw(rs.getString("user_pw"));			//3
				dto.setUserName(rs.getString("user_name"));		//4
				dto.setUserNick(rs.getString("user_nick"));		//5
				dto.setUserAddr(rs.getString("user_addr"));		//6
				dto.setUserXy(rs.getString("user_xy"));			//7
				dto.setUserGrant(rs.getString("user_grant"));	//8
				dto.setStoreNum(rs.getString("store_num"));		//9
				dto.setUserInday(rs.getDate("user_inday"));		//10
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//회원 등록
	public int insert(Connection conn, UserDTO dto) {
		int n = 0;
		String sql1 = "select oc_user_num_seq.nextval from dual";
		String sql2 = "insert into oc_user (user_num," //1
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
			psmt = conn.prepareStatement(sql1);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setUserNum(rs.getString(1));				
			}
			
			psmt = conn.prepareStatement(sql2);
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
	
	//회원 수정
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
	
	//회원 삭제
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
	
	
	//2. 권보성
	public int insertuser(Connection conn, UserDTO dto) { //회원가입
		int n = 0;
		
		try {
			String sql = "select OC_USER_NUM_SEQ.nextval from dual";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			dto.setUserNum(rs.getString(1));
			
			sql = "insert into oc_user(user_num, user_email, user_pw, user_name, user_nick, user_addr) values(?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getUserEmail());
			psmt.setString(3, dto.getUserPw());
			psmt.setString(4, dto.getUserName());
			psmt.setString(5, dto.getUserNick());
			psmt.setString(6, dto.getUserAddr());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return n;
	}
	
	//아이디(회원 이메일) 중복체크
	public boolean isIdCheck(Connection conn, String id) { 
		boolean chk = true; // 존재하지 않으면
		String sql = "select user_email from oc_user where user_email = ?";
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
		return chk;
	}
	//닉네임 중복체크
		public boolean isNickCheck(Connection conn, String Nick) { 
			boolean chk = true; // 존재하지 않으면
			String sql = "select user_nick from oc_user where user_nick = ?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, Nick);
				rs = psmt.executeQuery();
				if (rs.next()) {
					chk = false; // 존재 하면
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return chk;
		}
	
	public UserDTO loginCheck(Connection conn, UserDTO dto) { // 로그인 체크
		String sql = "select * from OC_user where user_email=? and user_pw=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserEmail());
			psmt.setString(2, dto.getUserPw());
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new UserDTO();
				dto.setUserNum(rs.getString("user_num"));
				dto.setUserPw(rs.getString("user_Pw"));
				dto.setUserEmail(rs.getString("user_Email"));
				dto.setUserGrant(rs.getString("user_Grant"));
				dto.setUserName(rs.getString("user_Name"));
				dto.setUserAddr(rs.getString("user_Addr"));
				dto.setUserInday(rs.getDate("user_inday"));
				dto.setUserXy(rs.getString("user_xy"));
				dto.setUserNick(rs.getString("user_nick"));
				dto.setStoreNum(rs.getString("store_Num"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//3. 백승진
	
	
	
	//4. 복진영
	
	
	
}
