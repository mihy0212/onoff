package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.StoreDTO;

public class StoreDAO extends DAO{
	
	private static StoreDAO instance = new StoreDAO();
	public static StoreDAO getInstance() {
		return instance;
	}

	public List<StoreDTO> selectAll(Connection conn){
		List<StoreDTO> list = new ArrayList<StoreDTO>();
		String sql = "select * from oc_store order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num"));
				dto.setStoreName(rs.getString("store_name"));
				dto.setStoreAddr(rs.getString("store_addr"));
				dto.setStoreXy(rs.getString("store_xy"));
				dto.setStoreCateg1(rs.getString("store_categ1"));
				dto.setStoreCateg2(rs.getString("store_categ2"));
				dto.setStoreCateg3(rs.getString("store_categ3"));
				dto.setStorePic(rs.getString("store_pic"));
				dto.setStoreTime(rs.getString("store_time"));
				dto.setStoreTel(rs.getString("store_tel"));
				dto.setStoreMenu(rs.getString("store_menu"));
				dto.setStoreEct(rs.getString("store_ect"));
				dto.setStoreLike(rs.getString("store_like"));
				dto.setUserNum(rs.getString("user_num"));
				dto.setStoreRegiday(rs.getDate("store_regiday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert() {
		int n = 0;
		StoreDTO dto = new StoreDTO();
		
		
		return n;
	}
}
