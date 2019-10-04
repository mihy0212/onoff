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
	public List<FavoriteDTO> selectAll(Connection conn){
		List<FavoriteDTO> list = new ArrayList<FavoriteDTO>();
		String sql = "select f.favo_num, f.user_num, f.store_num, s.store_name, s.store_categ1, s.store_categ2, s.store_categ3 from oc_favorite f join oc_store s on (f.store_sum = s.store_num) order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				FavoriteDTO dto = new FavoriteDTO();
				dto.setFavoNum(rs.getString("favo_num"));
				dto.setUserNum(rs.getString("user_num"));
				dto.setStoreNum(rs.getString("store_num"));
				dto.setStoreName(rs.getString("store_name"));
				dto.setStoreCateg1(rs.getString("store_categ1"));
				dto.setStoreCateg2(rs.getString("store_categ2"));
				dto.setStoreCateg3(rs.getString("store_categ3"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
