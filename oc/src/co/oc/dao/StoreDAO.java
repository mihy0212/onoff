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

	//가게 전체 조회
	public List<StoreDTO> selectAll(Connection conn){
		List<StoreDTO> list = new ArrayList<StoreDTO>();
		String sql = "select * from oc_store order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
//			Iterator rows = (new ResultSetDynaClass(rs)).iterator();
//			System.out.println(rows);
//			while(rows.hasNext()) {
			while(rs.next()) {
//				DynaBean row = (DynaBean) rows.next();
				StoreDTO dto = new StoreDTO();
//				try {
//					BeanUtils.copyProperties(dto, row);
//					System.out.println(dto);
//					
//				} catch (IllegalAccessException | InvocationTargetException e) {
//					e.printStackTrace();
//				}
				dto.setStoreNum(rs.getString("store_num"));			//1
				dto.setStoreName(rs.getString("store_name"));		//2
				dto.setStoreAddr(rs.getString("store_addr"));		//3
				dto.setStoreXy(rs.getString("store_xy"));			//4
				dto.setStoreCateg1(rs.getString("store_categ1"));	//5
				dto.setStoreCateg2(rs.getString("store_categ2"));	//6
				dto.setStoreCateg3(rs.getString("store_categ3"));	//7
				dto.setStorePic(rs.getString("store_pic"));			//8
				dto.setStoreTime(rs.getString("store_time"));		//9
				dto.setStoreTel(rs.getString("store_tel"));			//10
				dto.setStoreMenu(rs.getString("store_menu"));		//11
				dto.setStoreEct(rs.getString("store_ect"));			//12
				dto.setStoreLike(rs.getInt("store_like"));		//13
				dto.setUserNum(rs.getString("user_num"));			//14
				dto.setStoreRegiday(rs.getDate("store_regiday"));	//15
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//가게 하나 조회1(가게 넘버로 조회)
	public StoreDTO selectStoreNum(Connection conn, String storeNum) {
		StoreDTO dto = null;
		String sql = "select * from oc_store where store_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, storeNum);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num"));			//1
				dto.setStoreName(rs.getString("store_name"));		//2
				dto.setStoreAddr(rs.getString("store_addr"));		//3
				dto.setStoreXy(rs.getString("store_xy"));			//4
				dto.setStoreCateg1(rs.getString("store_categ1"));	//5
				dto.setStoreCateg2(rs.getString("store_categ2"));	//6
				dto.setStoreCateg3(rs.getString("store_categ3"));	//7
				dto.setStorePic(rs.getString("store_pic"));			//8
				dto.setStoreTime(rs.getString("store_time"));		//9
				dto.setStoreTel(rs.getString("store_tel"));			//10
				dto.setStoreMenu(rs.getString("store_menu"));		//11
				dto.setStoreEct(rs.getString("store_ect"));			//12
				dto.setStoreLike(rs.getInt("store_like"));		//13
				dto.setUserNum(rs.getString("user_num"));			//14
				dto.setStoreRegiday(rs.getDate("store_regiday"));	//15
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//가게 하나 조회2(회원 번호로 조회)
	public StoreDTO selectUserNum(Connection conn, String userNum) {
		StoreDTO dto = null;
		String sql = "select * from oc_store where user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num"));			//1
				dto.setStoreName(rs.getString("store_name"));		//2
				dto.setStoreAddr(rs.getString("store_addr"));		//3
				dto.setStoreXy(rs.getString("store_xy"));			//4
				dto.setStoreCateg1(rs.getString("store_categ1"));	//5
				dto.setStoreCateg2(rs.getString("store_categ2"));	//6
				dto.setStoreCateg3(rs.getString("store_categ3"));	//7
				dto.setStorePic(rs.getString("store_pic"));			//8
				dto.setStoreTime(rs.getString("store_time"));		//9
				dto.setStoreTel(rs.getString("store_tel"));			//10
				dto.setStoreMenu(rs.getString("store_menu"));		//11
				dto.setStoreEct(rs.getString("store_ect"));			//12
				dto.setStoreLike(rs.getInt("store_like"));		//13
				dto.setUserNum(rs.getString("user_num"));			//14
				dto.setStoreRegiday(rs.getDate("store_regiday"));	//15
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//새로운 가게 정보 등록
	public int insert(Connection conn, StoreDTO dto) {
		int n = 0;
		String sql = "insert into oc_store (store_num," //1
				+ " store_name,"	//2
				+ " store_addr,"	//3
				+ " store_xy,"		//4
				+ " store_categ1,"	//5
				+ " store_categ2,"	//6
				+ " store_categ3,"	//7
				+ " store_pic,"		//8
				+ " store_time,"	//9
				+ " store_tel,"		//10
				+ " store_menu,"	//11
				+ " store_ect,"		//12
				+ " user_num"		//13
				+ ") values "
				+ "(oc_store_num_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreName());
			psmt.setString(2, dto.getStoreAddr());
			psmt.setString(3, dto.getStoreXy());
			psmt.setString(4, dto.getStoreCateg1());
			psmt.setString(5, dto.getStoreCateg2());
			psmt.setString(6, dto.getStoreCateg3());
			psmt.setString(7, dto.getStorePic());
			psmt.setString(8, dto.getStoreTime());
			psmt.setString(9, dto.getStoreTel());
			psmt.setString(10, dto.getStoreMenu());
			psmt.setString(11, dto.getStoreEct());
			psmt.setString(12, dto.getUserNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 새로운 가게 정보 등록 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	//가게 정보 수정
	public int update(Connection conn, StoreDTO dto) {
		int n = 0;
		String sql = "update oc_store set"
				+ " store_addr=?,"	//1
				+ " store_xy=?,"	//2
				+ " store_categ1=?,"	//3
				+ " store_categ2=?,"	//4
				+ " store_categ3=?,"	//5
				+ " store_pic=?,"	//6
				+ " store_time=?,"	//7
				+ " store_tel=?,"	//8
				+ " store_menu=?,"	//9
				+ " store_ect=?,"	//10
				+ " store_like=?"	//11
				+ " where store_num=?";	//12
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreAddr());
			psmt.setString(2, dto.getStoreXy());
			psmt.setString(3, dto.getStoreCateg1());
			psmt.setString(4, dto.getStoreCateg2());
			psmt.setString(5, dto.getStoreCateg3());
			psmt.setString(6, dto.getStorePic());
			psmt.setString(7, dto.getStoreTime());
			psmt.setString(8, dto.getStoreTel());
			psmt.setString(9, dto.getStoreMenu());
			psmt.setString(10, dto.getStoreEct());
			psmt.setInt(11, dto.getStoreLike());
			psmt.setString(12, dto.getStoreNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 가게 정보 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	//가게 정보 삭제
	public int delete(Connection conn, String storeNum) {
		int n = 0;
		String sql = "delete from oc_store where store_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, storeNum);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 가게 정보 삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return n;
	}
	
	
	
	//2. 권보성
	
	
	
	
	
	//3. 백승진
	
	
	
	
	
	//4. 복진영
	
	
}
