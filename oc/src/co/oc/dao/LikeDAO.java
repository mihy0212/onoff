package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.LikeDTO;

public class LikeDAO extends DAO {
	
	private static LikeDAO instance = new LikeDAO();
	public static LikeDAO getInstance() {
		return instance;
	}
	

	//좋아요 전체 현황 조회
	public List<LikeDTO> selectAll(Connection conn){
		List<LikeDTO> list = new ArrayList<LikeDTO>();
		String sql = "select * from oc_like order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				LikeDTO dto = new LikeDTO();
				dto.setStoreNum(rs.getString("store_num"));
				dto.setUserNum(rs.getString("user_num"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//좋아요 일부 조회 - 유저 기준 조회(좋아요를 누른 가게 이름 출력)
	public List<LikeDTO> selectUserNum(Connection conn, String userNum){
		List<LikeDTO> list = new ArrayList<LikeDTO>();
		String sql = "select s.store_name"
				+ " from oc_like l join oc_store s"
				+ " on (l.store_num = s.store_num)"
				+ " where l.user_num=?"
				+ " order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userNum);
			rs = psmt.executeQuery();
			while(rs.next()) {
				LikeDTO dto = new LikeDTO();
				dto.setStoreName(rs.getString("store_name"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//좋아요 일부 조회 - 가게 기준 좋아요 수 조회
	public int selectStoreNum(Connection conn, String storeNum){
		int likeCount = 0;
		String sql = "select count(*) as like_count from oc_like where store_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, storeNum);
			rs = psmt.executeQuery();
			if(rs.next()) {
				likeCount = rs.getInt("like_count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return likeCount;
	}
	
	//좋아요 검증(하나의 가게에 2번 이상 좋아요 등록 못하게 하기 위해 검색)
		//likeCount가 0이면 좋아요 가능, 1이면 이미 좋아요를 한번 했으므로 등록 불가능
	public int selectCheck(Connection conn, LikeDTO dto) {
		int likeCount = 0;
		String sql = "select count(*) as like_count from oc_like where store_num=? and user_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreNum());
			psmt.setString(2, dto.getUserNum());
			rs = psmt.executeQuery();
			if(rs.next()) {
				likeCount = rs.getInt("like_count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return likeCount;
	}
	
	//좋아요 등록
	public int insert(Connection conn, LikeDTO dto) {
		int n = 0;
		int check = selectCheck(conn, dto);
		if(check == 0) {
			String sql1 = "insert into oc_like (user_num, store_num) values (?, ?)";
			String sql2 = "update oc_store set store_like=store_like+1 where store_num=?";
			try {
				psmt = conn.prepareStatement(sql1);
				psmt.setString(1, dto.getUserNum());
				psmt.setString(2, dto.getStoreNum());
				n = psmt.executeUpdate();
				System.out.println(n + "건의 좋아요 등록 완료");
				
				psmt = conn.prepareStatement(sql2);
				psmt.setString(1, dto.getStoreNum());
				n = psmt.executeUpdate();
				System.out.println(n + "건의 가게 정보 좋아요수 +1 완료");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("등록 실패");
		}
		return n;
	}
	
	//좋아요 삭제
	public int delete(Connection conn, LikeDTO dto) {
		int n = 0;
		int check = selectCheck(conn, dto);
		if(check == 1) {
			String sql1 = "delete from oc_like where store_num=? and user_num=?";
			String sql2 = "update oc_store set store_like=store_like-1 where store_num=?";
			try {
				psmt = conn.prepareStatement(sql1);
				psmt.setString(1, dto.getStoreNum());
				psmt.setString(2, dto.getUserNum());
				n = psmt.executeUpdate();
				System.out.println(n + "건의 좋아요 등록 삭제 완료");
				
				psmt = conn.prepareStatement(sql2);
				psmt.setString(1, dto.getStoreNum());
				n = psmt.executeUpdate();
				System.out.println(n + "건의 가게 정보 좋아요수 -1 완료");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("삭제 실패");
		}
		return n;
	}
	

	
	//2. 권보성
	
	
	
	
	
	//3. 백승진
	
	
	
	
	
	//4. 복진영
	
	
	
}
