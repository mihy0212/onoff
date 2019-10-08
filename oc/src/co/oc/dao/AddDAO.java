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
		String sql = "update oc_add set"
				+ " add_status=?,"
				+ " add_re=?,"
				+ " store_num=?"
				+ " where add_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getAddStatus());
			psmt.setString(2, dto.getAddRe());
			psmt.setString(3, dto.getStoreNum());
			psmt.setString(4, dto.getAddNum());
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
	
	
	
	//3. 백승진
	
	
	
	//4. 복진영
	
}
