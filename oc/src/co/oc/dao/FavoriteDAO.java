package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.FavoriteDTO;

public class FavoriteDAO extends DAO {

	private static FavoriteDAO instance = new FavoriteDAO();

	public static FavoriteDAO getInstance() {
		return instance;
	}

	// 전체 회원 즐겨찾기 조회
	public List<FavoriteDTO> selectAll(Connection conn, int start, int end) {
		List<FavoriteDTO> list = new ArrayList<FavoriteDTO>();
		String sql = "select *"
					+ " from (select rownum as rnum, a1.*"
							+ " from (select f.user_num,"
										+ " f.store_num,"
										+ " s.store_name,"
										+ " s.store_categ1,"
										+ " s.store_categ2,"
										+ " s.store_categ3,"
										+ " f.favo_date"
										+ " from oc_favorite f join oc_store s"
										+ " on (f.store_num = s.store_num)"
										+ " order by f.favo_date) a1"
							+ " where rownum<=?) a2"
					+ " where a2.rnum>=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			while (rs.next()) {
				FavoriteDTO dto = new FavoriteDTO();
				dto.setUserNum(rs.getString("user_num"));
				dto.setStoreNum(rs.getString("store_num"));
				dto.setStoreName(rs.getString("store_name"));
				dto.setStoreCateg1(rs.getString("store_categ1"));
				dto.setStoreCateg2(rs.getString("store_categ2"));
				dto.setStoreCateg3(rs.getString("store_categ3"));
				dto.setFavoDate(rs.getDate("favo_date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 즐겨찾기 유저별 카테고리별 조회
	public List<FavoriteDTO> selectUser(Connection conn, FavoriteDTO dto, int start, int end) {
		List<FavoriteDTO> list = new ArrayList<FavoriteDTO>();
		String sql = "select *" 
					+ " from (select rownum as rnum, a1.*" 
							+ " from (select f.user_num," 
										+ " f.store_num,"
										+ " s.store_name," 
										+ " s.store_categ1," 
										+ " s.store_categ2," 
										+ " s.store_categ3," 
										+ " f.favo_date"
										+ " from oc_favorite f join oc_store s" 
										+ " on (f.store_num = s.store_num)"
										+ " where f.user_num=? and s.store_categ1 like '%'|| ? ||'%' and s.store_categ2 like '%'|| ? ||'%' and s.store_categ3 like '%'|| ? ||'%'"
										+ " order by f.favo_date) a1"
							+ " where rownum<=?) a2"
					+ " where a2.rnum>=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getStoreCateg1());
			psmt.setString(3, dto.getStoreCateg2());
			psmt.setString(4, dto.getStoreCateg3());
			psmt.setInt(5, end);
			psmt.setInt(6, start);
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new FavoriteDTO();
				dto.setUserNum(rs.getString("user_num"));
				dto.setStoreNum(rs.getString("store_num"));
				dto.setStoreName(rs.getString("store_name"));
				dto.setStoreCateg1(rs.getString("store_categ1"));
				dto.setStoreCateg2(rs.getString("store_categ2"));
				dto.setStoreCateg3(rs.getString("store_categ3"));
				dto.setFavoDate(rs.getDate("favo_date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 회원이 해당 가게를 즐겨찾기 했는지 검증
	public int check(Connection conn, FavoriteDTO dto) {
		int favoCount = 0;
		String sql = "select count(*) from oc_favorite where store_num=? and user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreNum());
			psmt.setString(2, dto.getUserNum());
			rs = psmt.executeQuery();
			if (rs.next()) {
				favoCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favoCount;
	}

	// 즐겨찾기 추가 +삭제하기(추가를 했으면 삭제만 가능, 삭제했으면 추가만 가능)
	// favoCount가 0이면 즐겨찾기 가능, 1이면 즐겨찾기를 한번 했으므로 불가능
	public int checkInsert(Connection conn, FavoriteDTO dto) {
		int favoCount = 0;
		String sql = "select count(*) from oc_favorite where store_num=? and user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreNum());
			psmt.setString(2, dto.getUserNum());
			rs = psmt.executeQuery();
			if (rs.next()) {
				favoCount = rs.getInt(1);
			}
			if (favoCount == 0) {
				insert(conn, dto);
			} else {
				delete(conn, dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favoCount;
	}

	// 즐겨찾기 등록하기
	private int insert(Connection conn, FavoriteDTO dto) {
		int n = 0;
		String sql = "insert into oc_favorite (user_num, store_num) values (?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getStoreNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 즐겨찾기 등록 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 즐겨찾기 삭제하기
	private int delete(Connection conn, FavoriteDTO dto) {
		int n = 0;
		String sql = "delete from oc_favorite where user_num=? and store_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getStoreNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 즐겨찾기 삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 2. 권보성

	// 3. 백승진

	// 특정 회원의 즐겨찾기 목록 쿼리
	public ArrayList<FavoriteDTO> userFavorite(Connection conn, String userNum) {
		ArrayList<FavoriteDTO> list = new ArrayList<FavoriteDTO>();

		String sql = "select * from oc_favorite where user_num=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();

			while (rs.next()) {
				FavoriteDTO dto = new FavoriteDTO();

				dto.setUserNum(rs.getString("user_num"));
				dto.setStoreNum(rs.getString("store_num"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	// 4. 복진영

	// 4. 복진영
	// 페이지 수를 구하기 위해 총 게시글 수 를 구함.
	public int favorite_getPageCountuserNum(Connection conn, String userNum) {
		int cnt = 0;
		String sql = "SELECT COUNT(*) FROM oc_favorite where user_num=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();
			if (rs.next()) {
				// 전체 글의 개수를 가져온다.
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
