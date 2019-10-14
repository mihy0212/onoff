package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.AddDTO;

public class AddDAO extends DAO {
 
	private static AddDAO instance = new AddDAO();
	public static AddDAO getInstance() {
		return instance;
	}
	
	//전체 신청 조회
	public List<AddDTO> selectAll(Connection conn){
		List<AddDTO> list = new ArrayList<AddDTO>();
		String sql = "select * from oc_add order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				AddDTO dto = new AddDTO();
				dto.setAddNum(rs.getString("add_num"));				//1
				dto.setStoreName(rs.getString("store_name"));		//2
				dto.setStoreAddr(rs.getString("store_addr"));		//3
				dto.setStoreXy(rs.getString("store_xy"));			//4	
				dto.setStoreCateg1(rs.getString("store_categ1"));	//5
				dto.setStoreCateg2(rs.getString("store_categ2"));	//6
				dto.setStoreCateg3(rs.getString("store_categ3"));	//7
				dto.setStoreLicense(rs.getString("store_license"));	//8
				dto.setUserLicense(rs.getString("user_license"));	//9
				dto.setAddCapture(rs.getString("add_capture"));		//10
				dto.setUserNum(rs.getString("user_num"));			//11
				dto.setAddDay(rs.getDate("add_day"));				//12
				dto.setAddStatus(rs.getString("add_status"));		//13
				dto.setAddRe(rs.getString("add_re"));				//14
				dto.setStoreNum(rs.getString("store_num"));			//15
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//신청 일부 조회1-가게 번호로 조회
	public List<AddDTO> selectStoreNum(Connection conn, String storeNum) {
		List<AddDTO> list = new ArrayList<AddDTO>();
		String sql = "select * from oc_add where store_num=? order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, storeNum);
			rs = psmt.executeQuery();
			while(rs.next()) {
				AddDTO dto = new AddDTO();
				dto.setAddNum(rs.getString("add_num"));				//1
				dto.setStoreName(rs.getString("store_name"));		//2
				dto.setStoreAddr(rs.getString("store_addr"));		//3
				dto.setStoreXy(rs.getString("store_xy"));			//4	
				dto.setStoreCateg1(rs.getString("store_categ1"));	//5
				dto.setStoreCateg2(rs.getString("store_categ2"));	//6
				dto.setStoreCateg3(rs.getString("store_categ3"));	//7
				dto.setStoreLicense(rs.getString("store_license"));	//8
				dto.setUserLicense(rs.getString("user_license"));	//9
				dto.setAddCapture(rs.getString("add_capture"));		//10
				dto.setUserNum(rs.getString("user_num"));			//11
				dto.setAddDay(rs.getDate("add_day"));				//12
				dto.setAddStatus(rs.getString("add_status"));		//13
				dto.setAddRe(rs.getString("add_re"));				//14
				dto.setStoreNum(rs.getString("store_num"));			//15
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//신청 일부 조회2-유저 번호로 조회
	public List<AddDTO> selectUserNum(Connection conn, String userNum) {
		List<AddDTO> list = new ArrayList<AddDTO>();
		String sql = "select * from oc_add where user_num=? order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();
			while(rs.next()) {
				AddDTO dto = new AddDTO();
				dto.setAddNum(rs.getString("add_num"));				//1
				dto.setStoreName(rs.getString("store_name"));		//2
				dto.setStoreAddr(rs.getString("store_addr"));		//3
				dto.setStoreXy(rs.getString("store_xy"));			//4	
				dto.setStoreCateg1(rs.getString("store_categ1"));	//5
				dto.setStoreCateg2(rs.getString("store_categ2"));	//6
				dto.setStoreCateg3(rs.getString("store_categ3"));	//7
				dto.setStoreLicense(rs.getString("store_license"));	//8
				dto.setUserLicense(rs.getString("user_license"));	//9
				dto.setAddCapture(rs.getString("add_capture"));		//10
				dto.setUserNum(rs.getString("user_num"));			//11
				dto.setAddDay(rs.getDate("add_day"));				//12
				dto.setAddStatus(rs.getString("add_status"));		//13
				dto.setAddRe(rs.getString("add_re"));				//14
				dto.setStoreNum(rs.getString("store_num"));			//15
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//검색 조회
	public List<AddDTO> selectSearch(Connection conn, AddDTO adto, int start, int end) {
		 List<AddDTO> list = new ArrayList<AddDTO>();
		 String where = " where 1=1 ";
		 if (adto != null) {
			 if ( adto.getAddStatus() != null && adto.getAddStatus() != "All") {	//1. 처리 상태별 조회 
				 where += " and add_status like ? ";
			 }
			 if ( adto.getAddNum() != null) {	//2. 신청번호별 조회
				 where += " and add_num = ? ";
			 }
			 if ( adto.getStoreName() != null) {	//3. 가게명으로 조히
				 where += " and store_name like '%' || ? || '%' ";
			 }
			 if ( adto.getStoreAddr() != null) {	//4. 가게 주소로 조회
				 where += " and store_addr like '%' || ? || '%' ";
			 }
			 if ( adto.getStoreCateg1() != null) {	//5. 카테고리1로 조회
				 where += " and store_categ1 = ? ";
			 }
			 if ( adto.getStoreCateg2() != null) {	//6. 카테고리2로 조회
				 where += " and store_categ2 = ? ";
			 }
			 if ( adto.getStoreCateg3() != null) {	//7. 카테고리 3으로 조회
				 where += " and store_categ3 = ? ";
			 }
			 if ( adto.getStoreLicense() == "null" && adto.getUserLicense() == "null") { //8. 거절 조건 검색(사업자 번호/주민번호 둘 다 없을 경우:코드 번호 "null")
				 where += " and store_license is null and user_license is null ";
			 }
			 if ( adto.getAddCapture() == "null") { //9. 거절 조건 검색(캡처가 없을 경우:코드 번호 "null")
				 where += " and add_capture is null ";
			 }
			 if ( adto.getUserName() != null) {	//10. 회원 이름으로 검색
				 where += " and user_name like '%' || ? || '%' ";
			 }
			 if ( adto.getAddDay() != null && adto.getBeforeAfter() == "1" ) {	//11. 등록 신청일로 검색
				 where += " and add_day <= ? ";
			 }
			 if ( adto.getAddDay() != null && adto.getBeforeAfter() == "2" ) {	//12. 등록 신청일로 검색
				 where += " and add_day >= ? ";
			 }
		 }
		 String sql ="select *"
		 		+ " from (select a1.*, rownum rnum"
		 				+ " from (select a.*, u.user_name, u.user_nick"
		 						+ " from oc_add a join oc_user u on (a.user_num=u.user_num) "
		 						+ where + " order by a.add_num desc)a1"
		 				+ " where rownum<=?)a2"
		 		+ " where a2.rnum >=?";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			int i=0;
			if (adto != null) {
				if ( adto.getAddStatus() != null) {	//1.
					psmt.setString(++i, adto.getAddStatus());
				}
				if ( adto.getAddNum() != null) {	//2.
					psmt.setString(++i, adto.getAddNum());
				}
				if ( adto.getStoreName() != null) { 	//3
					psmt.setString(++i, adto.getStoreName());
				}
				if ( adto.getStoreAddr() != null) { 	//4
					psmt.setString(++i, adto.getStoreAddr());
				}
				if ( adto.getStoreCateg1() != null) { 	//5
					psmt.setString(++i, adto.getStoreCateg1());
				}
				if ( adto.getStoreCateg2() != null) {	//6 
					psmt.setString(++i, adto.getStoreCateg2());
				}
				if ( adto.getStoreCateg3() != null) { 	//7
					psmt.setString(++i, adto.getStoreCateg3());
				}
				if ( adto.getUserName() != null) { 	//10
					psmt.setString(++i, adto.getUserName());
				}
				if ( adto.getAddDay() != null ) {
					psmt.setDate(++i, adto.getAddDay());
				}
			}
			psmt.setInt(++i, end);
			psmt.setInt(++i, start);
			rs = psmt.executeQuery();
			while (rs.next()) {
				AddDTO dto = new AddDTO();
				dto.setAddNum(rs.getString("add_num"));				//1
				dto.setStoreName(rs.getString("store_name"));		//2
				dto.setStoreAddr(rs.getString("store_addr"));		//3
				dto.setStoreXy(rs.getString("store_xy"));			//4	
				dto.setStoreCateg1(rs.getString("store_categ1"));	//5
				dto.setStoreCateg2(rs.getString("store_categ2"));	//6
				dto.setStoreCateg3(rs.getString("store_categ3"));	//7
				dto.setStoreLicense(rs.getString("store_license"));	//8
				dto.setUserLicense(rs.getString("user_license"));	//9
				dto.setAddCapture(rs.getString("add_capture"));		//10
				dto.setUserNum(rs.getString("user_num"));			//11
				dto.setAddDay(rs.getDate("add_day"));				//12
				dto.setAddStatus(rs.getString("add_status"));		//13
				dto.setAddRe(rs.getString("add_re"));				//14
				dto.setStoreNum(rs.getString("store_num"));			//15
				dto.setUserName(rs.getString("user_name"));			//16
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
		String sql = "select count(*) from oc_add where " + culumn + " like '" + content + "'";
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
	
	//신청서 단건 조회
	public AddDTO selectAddNum(Connection conn, String addNum) {
		AddDTO dto = new AddDTO();;
		String sql = "select a.add_num,"//1
				+ " a.store_name,"		//2
				+ " a.store_addr,"		//3
				+ " a.store_xy,"		//4
				+ " a.store_categ1,"	//5
				+ " a.store_categ2,"	//6
				+ " a.store_categ3,"	//7
				+ " a.store_license,"	//8
				+ " a.user_license,"	//9
				+ " a.add_capture,"		//10
				+ " a.user_num,"		//11
				+ " u.user_name,"		//12
				+ " a.add_day,"			//13
				+ " a.add_status,"		//14
				+ " a.add_re,"			//15
				+ " a.store_num"		//16
				+ " from oc_add a join oc_user u on(a.user_num = u.user_num)"
				+ " where a.add_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, addNum);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setAddNum(rs.getString("add_num"));				//1
				dto.setStoreName(rs.getString("store_name"));		//2
				dto.setStoreAddr(rs.getString("store_addr"));		//3
				dto.setStoreXy(rs.getString("store_xy"));			//4	
				dto.setStoreCateg1(rs.getString("store_categ1"));	//5
				dto.setStoreCateg2(rs.getString("store_categ2"));	//6
				dto.setStoreCateg3(rs.getString("store_categ3"));	//7
				dto.setStoreLicense(rs.getString("store_license"));	//8
				dto.setUserLicense(rs.getString("user_license"));	//9
				dto.setAddCapture(rs.getString("add_capture"));		//10
				dto.setUserNum(rs.getString("user_num"));			//11
				dto.setAddDay(rs.getDate("add_day"));				//12
				dto.setAddStatus(rs.getString("add_status"));		//13
				dto.setAddRe(rs.getString("add_re"));				//14
				dto.setStoreNum(rs.getString("store_num"));			//15
				dto.setUserName(rs.getString("user_name"));			//16	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//사업자 신청 새로 등록
	public int insert(Connection conn, AddDTO dto) {
		int n = 0;
		String sql = "insert into oc_Add (add_num," //1
				+ " store_name,"					//2
				+ " store_addr,"					//3
				+ " store_categ1,"					//4
				+ " store_categ2,"					//5
				+ " store_categ3,"					//6
				+ " store_license,"					//7
				+ " user_license,"					//8
				+ " add_capture,"					//9
				+ " store_XY,"
				+" user_num"
				+ ") values ("
				+ " oc_add_num_seq.nextval, ?, ?, ?, ?, ? ,?, ?, ?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreName());
			psmt.setString(2, dto.getStoreAddr());
			psmt.setString(3, dto.getStoreCateg1());
			psmt.setString(4, dto.getStoreCateg2());
			psmt.setString(5, dto.getStoreCateg3());
			psmt.setString(6, dto.getStoreLicense());
			psmt.setString(7, dto.getUserLicense());
			psmt.setString(8, dto.getAddCapture());
			psmt.setString(9, dto.getStoreXy());
			psmt.setString(10, dto.getUserNum());

			n = psmt.executeUpdate();
			System.out.println(n + "건의 새로운 신청 등록 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
		
	//사업자 신청 수정1 : 신청자의 신청 내용 수정
	public int update(Connection conn, AddDTO dto) {
		int n = 0;
		String sql = "update oc_add set"
				+ " store_name=?,"
				+ " store_addr=?,"
				+ " store_xy=?,"
				+ " store_categ1=?,"
				+ " store_categ2=?,"
				+ " store_categ3=?,"
				+ " store_license=?,"
				+ " user_license=?,"
				+ " add_capture=?,"
				+ " add_day=sysdate"
				+ " where add_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreName());
			psmt.setString(2, dto.getStoreAddr());
			psmt.setString(3, dto.getStoreXy());
			psmt.setString(4, dto.getStoreCateg1());
			psmt.setString(5, dto.getStoreCateg2());
			psmt.setString(6, dto.getStoreCateg3());
			psmt.setString(7, dto.getStoreLicense());
			psmt.setString(8, dto.getUserLicense());
			psmt.setString(9, dto.getAddCapture());
			psmt.setString(10, dto.getAddNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 신청 정보 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	//사업자 신청 수정2 : 등록 허가/거절 수정
		//반드시 StoreDAO의 insert 먼저 해서 storeNum을 발급받고,
		//그 storeNum을 AddDTO에 담도록 command 작성하기  
	public int updatePermit(Connection conn, AddDTO dto) {
		int n = 0;
		String sql = null;
		if(dto.getAddRe() != null) {
			sql = "update oc_add set add_status=?,"
					+ " add_re=?,"
					+ " store_num=?"
					+ " where add_num=?";
		} else {
			sql = "update oc_add set"
					+ " add_status=?,"
					+ " store_num=?"
					+ " where add_num=?";
		}
		
		try {
			psmt = conn.prepareStatement(sql);
			int i=0;
			psmt.setString(++i, dto.getAddStatus());
			if(dto.getAddRe() != null) {
				psmt.setString(++i, dto.getAddRe());
			}
			psmt.setString(++i, dto.getStoreNum());
			psmt.setString(++i, dto.getAddNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 신청 정보 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	//사업자 신청 삭제
	public int delete(Connection conn, String addNum) {
		int n = 0;
		String sql = "delete from oc_add where add_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, addNum);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 신청 정보 삭제");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	//2. 권보성
	public boolean isstoreCheck(Connection conn, String id) {
		boolean chk = true; // 존재하지 않으면
		String sql = "select store_name from oc_add where store_name = ?";
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
	
	
	//3. 백승진
	
	
	
	//4. 복진영
	
}
