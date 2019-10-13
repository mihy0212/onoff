package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.TimeDTO;

public class TimeDAO extends DAO {

	private static TimeDAO instance = new TimeDAO();

	public static TimeDAO getInstance() {
		return instance;
	}

	// 오픈 클로즈 정보 전체 조회
	public List<TimeDTO> selectAll(Connection conn) {
		List<TimeDTO> list = new ArrayList<TimeDTO>();
		String sql = "select * from oc_time order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				TimeDTO dto = new TimeDTO();
				dto.setTimeNum(rs.getString("time_num"));
				dto.setStoreNum(rs.getString("store_num"));
				dto.setTimeOpen(rs.getString("time_open"));
				dto.setTimeClose(rs.getString("time_close"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 오픈 클로즈 정보 일부 조회 - 가게번호 기준 조회
	public List<TimeDTO> selectOne(Connection conn, String storeNum) {
		List<TimeDTO> list = new ArrayList<TimeDTO>();
		String sql = "select * from oc_time where store_num=? order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, storeNum);
			rs = psmt.executeQuery();
			while (rs.next()) {
				TimeDTO dto = new TimeDTO();
				dto.setTimeNum(rs.getString("time_num"));
				dto.setStoreNum(rs.getString("store_num"));
				dto.setTimeOpen(rs.getString("time_open"));
				dto.setTimeClose(rs.getString("time_close"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 오픈 클로즈 정보 등록
	public int insert(Connection conn, String storeNum) {
		int n = 0;
		String sql = "insert into oc_time" + " (time_num, store_num)" + " values (oc_time_num_seq.nextval, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, storeNum);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 오픈클로즈 정보 등록 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 오픈 클로즈 정보 수정
	public int update(Connection conn, String timeNum) {
		int n = 0;
		String sql = "update oc_time set time_close=sysdate where time_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, timeNum);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 오픈클로즈 정보 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 가게 오픈 로그 등록

	public void storeOpenLog(Connection conn, String userNum) {
		String sql1 = "select store_num from oc_store where user_num = ?";

		try {
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();

			if (rs.next()) {
				String sql = "insert into oc_time(time_num, store_num, time_open) values(oc_time_num_seq.nextval, ?, sysdate)";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, rs.getString("store_num"));
				psmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 가게 클로즈 로그 등록

	public void storeCloseLog(Connection conn, String userNum) {
		String sql1 = "select store_num from oc_store where user_num = ?";

		try {
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();

			if (rs.next()) {
				String sql = "insert into oc_time(time_num, store_num, time_close) values(oc_time_num_seq.nextval, ?, sysdate)";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, rs.getString("store_num"));
				psmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
