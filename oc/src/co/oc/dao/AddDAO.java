package co.oc.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import co.oc.dto.AddDTO;

public class AddDAO extends DAO {
 
	private static AddDAO instance = new AddDAO();
	public static AddDAO getInstance() {
		return instance;
	}
	
	//전체 사업자신청 조회
	public List<AddDTO> selectAll(Connection conn){
		List<AddDTO> list = new ArrayList<AddDTO>();
		String sql = "select * from oc_add order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				AddDTO dto = new AddDTO();
				BeanUtils.copyProperties(dto, rs);
				list.add(dto);
			}
		} catch (SQLException | IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//사업자신청 한 건 조회
	public AddDTO selectStoreNum(Connection conn, String AddNum) {
		AddDTO dto = new AddDTO();
		String sql = "select * from oc_add where add_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				
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
				+ " store_xy,"						//4
				+ " store_categ1,"					//5
				+ " store_categ2,"					//6
				+ " store_categ3,"					//7
				+ " store_license,"					//8
				+ " user_license,"					//9
				+ " add_capture,"					//10
				+ " user_num,"						//11
				+ " add_day,"						//12
				+ " add_status,"					//13
				+ " add_re,"						//14
				+ " store_num"						//15
				+ ") values(oc_add_num_seq.nextval, ?, ?, ?, ?, ?, ? ,? , ?, ? ,? ,? ,? ,? ,? ,? ,?)";
		return n;
	}
	
	
	//사업자 신청 수정
	
	//사업자 신청 삭제
	
	
	//2. 권보성
	
	
	
	//3. 백승진
	
	
	
	//4. 복진영
	
}
