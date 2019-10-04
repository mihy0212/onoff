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
	
	//전체 회원 즐겨찾기 조회
	public List<FavoriteDTO> selectAll(Connection conn, int start, int end){
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
									+ " order by f.favo_date) a1) a2 where a2.rnum >=? and a2.rnum <=?";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
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
	
	//즐겨찾기 검증(하나의 가게에 2번 이상 즐겨찾기를 할 수 없음)
		//favoCount가 0이면 즐겨찾기 가능, 1이면 즐겨찾기를 한번 했으므로 불가능
	public int check(Connection conn, FavoriteDTO dto) {
		int favoCount = 0;
		String sql = "select count(*) from oc_favorite where store_num=? and user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreNum());
			psmt.setString(2, dto.getUserNum());
			rs = psmt.executeQuery();
			if(rs.next()) {
				favoCount = rs.getInt(1);
			}
			if(favoCount == 0) {
				insert(conn, dto);
			} else {
				delete(conn, dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favoCount;
	}
	
	//즐겨찾기 등록하기
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
	
	//즐겨찾기 삭제하기
	private int delete(Connection conn, FavoriteDTO dto) {
		int n = 0;
		String sql = "delete from oc_favorite where user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 즐겨찾기 삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	

	
	//2. 권보성
	
	
	
	
	
	//3. 백승진
	
	
	
	
	
	//4. 복진영
	
	
	
	
}
