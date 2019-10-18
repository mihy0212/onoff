package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.UserDTO;

public class UserDAO extends DAO {

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	// 회원 전체 조회
	public List<UserDTO> selectAll(Connection conn, int start, int end) {
		List<UserDTO> list = new ArrayList<UserDTO>();
		System.out.println(start+ ", "+end);
		String sql  ="select * from (select rownum as rnum, a1.*  from(select * FROM oc_user ORDER BY user_num)a1  where rownum<=?)a2 where a2.rnum>=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(2, start);//a1
			psmt.setInt(1, end);//a2
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUserNum(rs.getString("user_num")); // 1
				dto.setUserEmail(rs.getString("user_email")); // 2
				dto.setUserPw(rs.getString("user_pw")); // 3
				dto.setUserName(rs.getString("user_name")); // 4
				dto.setUserNick(rs.getString("user_nick")); // 5
				dto.setUserAddr(rs.getString("user_addr")); // 6
				dto.setUserXy(rs.getString("user_xy")); // 7
				dto.setUserGrant(rs.getString("user_grant")); // 8
				dto.setStoreNum(rs.getString("store_num")); // 9
			    dto.setUserInday(rs.getDate("user_inday")); // 10
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 회원 한 명 조회
	public UserDTO selectOne(Connection conn, String userNum) {
		UserDTO dto = new UserDTO();
		String sql = "select * from oc_user where user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setUserNum(rs.getString("user_num")); // 1
				dto.setUserEmail(rs.getString("user_email")); // 2
				dto.setUserPw(rs.getString("user_pw")); // 3
				dto.setUserName(rs.getString("user_name")); // 4
				dto.setUserNick(rs.getString("user_nick")); // 5
				dto.setUserAddr(rs.getString("user_addr")); // 6
				dto.setUserXy(rs.getString("user_xy")); // 7
				dto.setUserGrant(rs.getString("user_grant")); // 8
				dto.setStoreNum(rs.getString("store_num")); // 9
				dto.setUserInday(rs.getDate("user_inday")); // 10
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 회원 등록
	public int insert(Connection conn, UserDTO dto) {
		int n = 0;

		try {
			String sql = "select OC_USER_NUM_SEQ.nextval from dual";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			dto.setUserNum(rs.getString(1));

			sql = "insert into oc_user(user_num, user_email, user_pw, user_name, user_nick, user_addr, user_xy) values(?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getUserEmail());
			psmt.setString(3, dto.getUserPw());
			psmt.setString(4, dto.getUserName());
			psmt.setString(5, dto.getUserNick());
			psmt.setString(6, dto.getUserAddr());
			psmt.setString(7, dto.getUserXy());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return n;
	}

	// 회원 수정
	public int update(Connection conn, UserDTO dto) {
		int n = 0;
		String sql = "update oc_user set" + " user_pw=?," // 1
				+ " user_nick=?," // 2
				+ " user_addr=?," // 3
				+ " user_xy=?," // 4
				+ " user_grant=?," // 5
				+ " store_num=?" // 6
				+ " where user_num=?"; // 7
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

	// 회원 삭제
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

	// 2. 권보성

	// 아이디(회원 이메일) 중복체크
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

	// 닉네임 중복체크
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

	public String findid(Connection conn, UserDTO dto) { // ID찾기
		String chk = null;
		try {
			String sql = "select user_email from oc_user where user_name=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserName());
			rs = psmt.executeQuery();
			if (rs.next()) {
				chk = rs.getString("user_email");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}System.out.println(chk);
		return chk;
	}
	public String findpw(Connection conn, UserDTO dto) { // PW 찾기
		String pw = null;
		try {
			String sql = "select user_pw from oc_user where user_email=? and user_name=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserEmail());
			psmt.setString(2, dto.getUserName());
			rs = psmt.executeQuery();
			if (rs.next()) {
				pw = rs.getString("user_pw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}System.out.println(pw);
		return pw;
	}

	
	// 3. 백승진

	// 자기 정보 수정
	public int updateMyInfo(Connection conn, UserDTO dto) {
		int n = 0;
		String sql = "update oc_user set" + " user_pw=?," // 1
				+ " user_nick=?," // 2
				+ " user_addr=?" // 3
				+ " where user_num=?"; // 7
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserPw());
			psmt.setString(2, dto.getUserNick());
			psmt.setString(3, dto.getUserAddr());
			psmt.setString(4, dto.getUserNum());

			n = psmt.executeUpdate();

			System.out.println(n + "건의 회원정보 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 4. 복진영
	// 페이지 수를 구하기 위해 총 게시글 수 를 구함.
				public int user_getPageCount(Connection conn) {
					int cnt = 0;
					String sql = "SELECT COUNT(*)from oc_user order by 1";

					try {
						psmt = conn.prepareStatement(sql);
						rs = psmt.executeQuery();
						if(rs.next()) {
							// 전체 글의 개수를 가져온다.
							cnt = rs.getInt(1);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return cnt;
				}

}
