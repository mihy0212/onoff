package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.StoreDTO;

public class StoreDAO extends DAO {

	private static StoreDAO instance = new StoreDAO();

	public static StoreDAO getInstance() {
		return instance;
	}

	// 가게 전체 조회
	public List<StoreDTO> selectAll(Connection conn) {
		List<StoreDTO> list = new ArrayList<StoreDTO>();
		String sql = "select * from oc_store order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
//			Iterator rows = (new ResultSetDynaClass(rs)).iterator();
//			System.out.println(rows);
//			while(rows.hasNext()) {
			while (rs.next()) {
//				DynaBean row = (DynaBean) rows.next();
				StoreDTO dto = new StoreDTO();
//				try {
//					BeanUtils.copyProperties(dto, row);
//					System.out.println(dto);
//					
//				} catch (IllegalAccessException | InvocationTargetException e) {
//					e.printStackTrace();
//				}
				dto.setStoreNum(rs.getString("store_num")); // 1
				dto.setStoreName(rs.getString("store_name")); // 2
				dto.setStoreAddr(rs.getString("store_addr")); // 3
				dto.setStoreXy(rs.getString("store_xy")); // 4
				dto.setStoreCateg1(rs.getString("store_categ1")); // 5
				dto.setStoreCateg2(rs.getString("store_categ2")); // 6
				dto.setStoreCateg3(rs.getString("store_categ3")); // 7
				dto.setStorePic(rs.getString("store_pic")); // 8
				dto.setStoreTime(rs.getString("store_time")); // 9
				dto.setStoreTel(rs.getString("store_tel")); // 10
				dto.setStoreMenu(rs.getString("store_menu")); // 11
				dto.setStoreEtc(rs.getString("store_etc")); // 12
				dto.setStoreLike(rs.getInt("store_like")); // 13
				dto.setUserNum(rs.getString("user_num")); // 14
				dto.setStoreRegiday(rs.getDate("store_regiday")); // 15
				dto.setStoreOpen(rs.getString("store_oc")); // 16
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 가게 하나 조회1(가게 넘버로 조회)
	public StoreDTO selectStoreNum(Connection conn, String storeNum) {
		StoreDTO dto = null;
		String sql = "select * from oc_store where store_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, storeNum);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num")); // 1
				dto.setStoreName(rs.getString("store_name")); // 2
				dto.setStoreAddr(rs.getString("store_addr")); // 3
				dto.setStoreXy(rs.getString("store_xy")); // 4
				dto.setStoreCateg1(rs.getString("store_categ1")); // 5
				dto.setStoreCateg2(rs.getString("store_categ2")); // 6
				dto.setStoreCateg3(rs.getString("store_categ3")); // 7
				dto.setStorePic(rs.getString("store_pic")); // 8
				dto.setStoreTime(rs.getString("store_time")); // 9
				dto.setStoreTel(rs.getString("store_tel")); // 10
				dto.setStoreMenu(rs.getString("store_menu")); // 11
				dto.setStoreEtc(rs.getString("store_etc")); // 12
				dto.setStoreLike(rs.getInt("store_like")); // 13
				dto.setUserNum(rs.getString("user_num")); // 14
				dto.setStoreRegiday(rs.getDate("store_regiday")); // 15
				dto.setStoreOpen(rs.getString("store_oc")); // 16
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 가게 하나 조회2(회원 번호로 조회)
	public StoreDTO selectUserNum(Connection conn, String userNum) {
		StoreDTO dto = null;
		String sql = "select * from oc_store where user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num")); // 1
				dto.setStoreName(rs.getString("store_name")); // 2
				dto.setStoreAddr(rs.getString("store_addr")); // 3
				dto.setStoreXy(rs.getString("store_xy")); // 4
				dto.setStoreCateg1(rs.getString("store_categ1")); // 5
				dto.setStoreCateg2(rs.getString("store_categ2")); // 6
				dto.setStoreCateg3(rs.getString("store_categ3")); // 7
				dto.setStorePic(rs.getString("store_pic")); // 8
				dto.setStoreTime(rs.getString("store_time")); // 9
				dto.setStoreTel(rs.getString("store_tel")); // 10
				dto.setStoreMenu(rs.getString("store_menu")); // 11
				dto.setStoreEtc(rs.getString("store_etc")); // 12
				dto.setStoreLike(rs.getInt("store_like")); // 13
				dto.setUserNum(rs.getString("user_num")); // 14
				dto.setStoreRegiday(rs.getDate("store_regiday")); // 15
				dto.setStoreOpen(rs.getString("store_oc")); // 16
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//검색 조회
	public List<StoreDTO> selectSearch(Connection conn, StoreDTO sdto, int start, int end) {
		 List<StoreDTO> list = new ArrayList<StoreDTO>();
		 String where = " where 1=1 ";
		 if (sdto != null) {
			 if ( sdto.getStoreOpen() != null && sdto.getStoreOpen() != "All") {	//1. 가게 오픈 여부 조회
				 where += " and store_oc = ? ";
			 }
		 }
		 String sql ="select *"
		 		+ " from (select a1.*, rownum rnum"
		 				+ " from (select s.*, u.user_name, u.user_nick"
		 						+ " from oc_store s join oc_user u on (s.user_num=u.user_num) "
		 						+ where + " order by s.store_num desc)a1"
		 				+ " where rownum<=?)a2"
		 		+ " where a2.rnum >=?";
		try {
			
			psmt = conn.prepareStatement(sql);
			int i=0;
			if (sdto != null) {
				if ( sdto.getStoreOpen() != null) {	//1.
					psmt.setString(++i, sdto.getStoreOpen());
				}
			}
			psmt.setInt(++i, start);
			psmt.setInt(++i, end);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num")); // 1
				dto.setStoreName(rs.getString("store_name")); // 2
				dto.setStoreAddr(rs.getString("store_addr")); // 3
				dto.setStoreXy(rs.getString("store_xy")); // 4
				dto.setStoreCateg1(rs.getString("store_categ1")); // 5
				dto.setStoreCateg2(rs.getString("store_categ2")); // 6
				dto.setStoreCateg3(rs.getString("store_categ3")); // 7
				dto.setStorePic(rs.getString("store_pic")); // 8
				dto.setStoreTime(rs.getString("store_time")); // 9
				dto.setStoreTel(rs.getString("store_tel")); // 10
				dto.setStoreMenu(rs.getString("store_menu")); // 11
				dto.setStoreEtc(rs.getString("store_etc")); // 12
				dto.setStoreLike(rs.getInt("store_like")); // 13
				dto.setUserNum(rs.getString("user_num")); // 14
				dto.setStoreRegiday(rs.getDate("store_regiday")); // 15
				dto.setStoreOpen(rs.getString("store_oc")); // 16
				dto.setUserName(rs.getString("user_name")); // 17
				dto.setUserNick(rs.getString("user_nick")); // 18
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 페이지 수를 구하기 위해 총 게시글 수 를 구함.
				//culumn : 검색할 컬럼명, content: 검색할 내용
	public int getPageCount(Connection conn, String culumn, String content) {
		int cnt = 0;
		String sql = "select count(*) from oc_store where " + culumn + "=" + content;
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 새로운 가게 정보 등록
	public int insert(Connection conn, StoreDTO dto) {
		int n = 0;
		String sql = "insert into oc_store (store_num," // 1
				+ " store_name," // 2
				+ " store_addr," // 3
				+ " store_xy," // 4
				+ " store_categ1," // 5
				+ " store_categ2," // 6
				+ " store_categ3," // 7
				+ " store_pic," // 8
				+ " store_time," // 9
				+ " store_tel," // 10
				+ " store_menu," // 11
				+ " store_etc," // 12
				+ " user_num" // 13
				+ ") values " + "(oc_store_num_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,?)";
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
			psmt.setString(11, dto.getStoreEtc());
			psmt.setString(12, dto.getUserNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 새로운 가게 정보 등록 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 가게 정보 전체 수정
	public int update(Connection conn, StoreDTO dto) {
		int n = 0;
		String sql = "update oc_store set" + " store_addr=?," // 1
				+ " store_xy=?," // 2
				+ " store_categ1=?," // 3
				+ " store_categ2=?," // 4
				+ " store_categ3=?," // 5
				+ " store_pic=?," // 6
				+ " store_time=?," // 7
				+ " store_tel=?," // 8
				+ " store_menu=?," // 9
				+ " store_etc=?," // 10
				+ " store_like=?" // 11
				+ " where store_num=?"; // 12
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
			psmt.setString(10, dto.getStoreEtc());
			psmt.setInt(11, dto.getStoreLike());
			psmt.setString(12, dto.getStoreNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 가게 정보 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 가게 정보 일부 변경
	// check : 변경할 컬럼명, content: 변경할 내용
	public int update1(Connection conn, String check, String content, String storeNum) {
		int n = 0;
		String sql = "update oc_store set " + check + "=? where store_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, content);
			psmt.setString(2, storeNum);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 가게 " + check + " 정보 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 가게 정보 삭제
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

	// 2. 권보성

	// 3. 백승진

	// 가게 이름 검색
	public ArrayList<StoreDTO> searchStore(Connection conn, String keyword) {
		ArrayList<StoreDTO> list = new ArrayList<StoreDTO>();
		String sql = "select * from oc_store where store_name like ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + keyword + "%");
			rs = psmt.executeQuery();

			while (rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num")); // 1
				dto.setStoreName(rs.getString("store_name")); // 2
				dto.setStoreAddr(rs.getString("store_addr")); // 3
				dto.setStoreXy(rs.getString("store_xy")); // 4
				dto.setStoreCateg1(rs.getString("store_categ1")); // 5
				dto.setStoreCateg2(rs.getString("store_categ2")); // 6
				dto.setStoreCateg3(rs.getString("store_categ3")); // 7
				dto.setStorePic(rs.getString("store_pic")); // 8
				dto.setStoreTime(rs.getString("store_time")); // 9
				dto.setStoreTel(rs.getString("store_tel")); // 10
				dto.setStoreMenu(rs.getString("store_menu")); // 11
				dto.setStoreEtc(rs.getString("store_etc")); // 12
				dto.setStoreLike(rs.getInt("store_like")); // 13
				dto.setUserNum(rs.getString("user_num")); // 14
				dto.setStoreRegiday(rs.getDate("store_regiday")); // 15

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	// 오픈 가게 가져오기
	public List<StoreDTO> selectOpenStore(Connection conn) {
		List<StoreDTO> list = new ArrayList<StoreDTO>();
		String sql = "select * from oc_store where store_oc=1 order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num")); // 1
				dto.setStoreName(rs.getString("store_name")); // 2
				dto.setStoreAddr(rs.getString("store_addr")); // 3
				dto.setStoreXy(rs.getString("store_xy")); // 4
				dto.setStoreCateg1(rs.getString("store_categ1")); // 5
				dto.setStoreCateg2(rs.getString("store_categ2")); // 6
				dto.setStoreCateg3(rs.getString("store_categ3")); // 7
				dto.setStorePic(rs.getString("store_pic")); // 8
				dto.setStoreTime(rs.getString("store_time")); // 9
				dto.setStoreTel(rs.getString("store_tel")); // 10
				dto.setStoreMenu(rs.getString("store_menu")); // 11
				dto.setStoreEtc(rs.getString("store_etc")); // 12
				dto.setStoreLike(rs.getInt("store_like")); // 13
				dto.setUserNum(rs.getString("user_num")); // 14
				dto.setStoreOc(rs.getInt("store_oc")); // 가게 오픈 상태, 15
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 닫힌 가게 가져오기
	public List<StoreDTO> selectCloseStore(Connection conn) {
		List<StoreDTO> list = new ArrayList<StoreDTO>();
		String sql = "select * from oc_store where store_oc=0 order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setStoreNum(rs.getString("store_num")); // 1
				dto.setStoreName(rs.getString("store_name")); // 2
				dto.setStoreAddr(rs.getString("store_addr")); // 3
				dto.setStoreXy(rs.getString("store_xy")); // 4
				dto.setStoreCateg1(rs.getString("store_categ1")); // 5
				dto.setStoreCateg2(rs.getString("store_categ2")); // 6
				dto.setStoreCateg3(rs.getString("store_categ3")); // 7
				dto.setStorePic(rs.getString("store_pic")); // 8
				dto.setStoreTime(rs.getString("store_time")); // 9
				dto.setStoreTel(rs.getString("store_tel")); // 10
				dto.setStoreMenu(rs.getString("store_menu")); // 11
				dto.setStoreEtc(rs.getString("store_etc")); // 12
				dto.setStoreLike(rs.getInt("store_like")); // 13
				dto.setUserNum(rs.getString("user_num")); // 14
				dto.setStoreOc(rs.getInt("store_oc")); // 가게 오픈 상태, 15
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 가게 상태 조회
	public int storeState(Connection conn, String userNum) {

		int storeState = 0;
		String sql = "select store_oc from oc_store where user_num = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);

			rs = psmt.executeQuery();

			if (rs.next()) {
				storeState = rs.getInt("store_oc");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return storeState;

	}

	public void storeOpen(Connection conn, String userNum) {
		String sql = "update oc_store set store_oc=1 where user_num=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void storeClose(Connection conn, String userNum) {
		String sql = "update oc_store set store_oc=0 where user_num=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 4. 복진영

}