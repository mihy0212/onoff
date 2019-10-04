package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import co.oc.dto.AskDTO;

public class AskDAO extends DAO {

	private static AskDAO instance = new AskDAO();

	public static AskDAO getInstance() {
		return instance;
	}
//복진영
	// 모든 ask글들을 불러온다.
	public ArrayList<AskDTO> selectAll(Connection conn, int start, int end) {

		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<AskDTO> list = new ArrayList<AskDTO>();
		// SQL
		// 리뷰게시판에 모든 데이터를 불러온다.
		String sql = "select * from " + "(select rownum as rnum, a1.* from "
				+ "(select ASK_NUM, ask_re, user_num, store_num,  ask_title,ask_content,ask_date,ask_status FROM OC-ASK ORDER BY ASK_NUM DESC) a1) a2 "
				+ "where a2.rnum >= ? and a2.rnum <=?";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			psmt.setInt(1, start);// a1
			psmt.setInt(2, end);// a2

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {
				// 빈객체 생성
				AskDTO dto = new AskDTO();
				dto.setAskNum(rs.getString("ask_num"));// 글 번호
				dto.setAskRe(rs.getString("ask_re"));// 댓글
				dto.setUserNum(rs.getString("user_num"));// 작성자 번호
				dto.setStoreNum(rs.getString("store_num"));// 가게 번호
				dto.setAskTitle(rs.getString("ask_title"));// 제목
				dto.setAskContent(rs.getString("ask_Content"));// 리뷰 내용
				dto.setAskDate(rs.getDate("ask_date"));// 리뷰 작성일
				dto.setAskStatus(rs.getString("ask_status"));// 상태
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	// ask을 읽어오는 메서드
	public  AskDTO sellectOne(Connection conn,int askNum) {
			// 빈객체 생성
			AskDTO dto = new AskDTO();
			// SQL
			String sql = "SELECT * FROM OC-ASK WHERE ASK_NUM=" + askNum;//(<-이부분을 세션아이디로)

			try {
				Statement stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
			while (rs.next()) {
				dto.setAskNum(rs.getString("ask_num"));// 글 번호
				dto.setAskRe(rs.getString("ask_re"));// 댓글
				dto.setUserNum(rs.getString("user_num"));// 작성자 번호
				dto.setStoreNum(rs.getString("store_num"));// 가게 번호
				dto.setAskTitle(rs.getString("ask_title"));// 제목
				dto.setAskContent(rs.getString("ask_Content"));// 리뷰 내용
				dto.setAskDate(rs.getDate("ask_date"));// 리뷰 작성일
				dto.setAskStatus(rs.getString("ask_status"));// 상태

			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return dto;
		}
	
	
	// 빈객체를 매개변수로 받는다.
	// ask작성
	public int insert(Connection conn, AskDTO dto) {
		int n = 0;
			// SQL 문
			String sql = "INSERT INTO oc_ask (ask_num, " 
					+ "user_num," // 1
					+ " store_num, " // 2
					+ "ask_title, " // 3
					+ "ask_content, " // 4
					+ "ask_re, " // 5
					+ "ask_status, " // 6
					+ "ask_date)  VALUES(" + "ASK_NUM.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
			try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());// 작성자 번호
			psmt.setString(2, dto.getStoreNum());// 가게 번호
			psmt.setString(3, dto.getAskContent());// 내용
			psmt.setString(4, dto.getAskRe());// 댓글
			psmt.setString(5, dto.getAskTitle());// 제목
			psmt.setString(6, dto.getAskStatus());// 상태
			// SQL 실행
			n = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
			return n;
	} // insert()

	
	
	// 페이지 수를 구하는 메서드
	// 총 레코드수(게시글 수)를 구함.
	public int ask_getPageCount(Connection conn)  throws Exception {

		// 쿼리문
		String sql = "SELECT COUNT(*) FROM OC-ASK";
		Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();

			// 전체 글의 개수를 가져온다.
			int cnt = rs.getInt(1);

			// 총 페이지 개수 리턴
			return cnt;
		}



	public int delete(Connection conn, int askNum) {
		int n = 0;
		// SQL
		String sql = "DELETE FROM OC-ASK WHERE ask_num=" + askNum;
		try {
			psmt = conn.prepareStatement(sql);
			n = psmt.executeUpdate();
		//Statement stmt = conn.createStatement();
		//stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	
	
}

