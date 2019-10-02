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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//사업자 신청 새로 등록
	
	
	//사업자 신청 수정
	
	//사업자 신청 삭제
	
	
	//2. 권보성
	
	
	
	//3. 백승진
	
	
	
	//4. 복진영
	
}
