package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;
import co.oc.dto.ReviewDTO;

public class ReviewDAO extends DAO {

	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		return instance;
	}

	// 전체 리뷰와 별점 조회
	public List<ReviewDTO> selectAll(Connection conn) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select r.review_num," + " r.review_re," + " r.user_num," + " u.user_nick," + " r.store_num,"
				+ " r.store_name," + " r.review_star," + " r.review_content," + " r.review_date"
				+ " from oc_review r join oc_user u" + " on (r.user_num = u.user_num)" + " order by 2, 1;";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setReviewNum(rs.getString("review_num")); // 1
				dto.setReviewRe(rs.getString("review_re")); // 2
				dto.setUserNum(rs.getString("user_num")); // 3
				dto.setUserNick(rs.getString("user_nick")); // 4
				dto.setStoreNum(rs.getString("store_num")); // 5
				dto.setStoreName(rs.getString("store_name")); // 6
				dto.setReviewStar(rs.getString("review_star")); // 7
				dto.setReviewContent(rs.getString("review_content")); // 8
				dto.setReviewDate(rs.getDate("review_date")); // 9
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 리뷰 일부 조회1 (check:조회할 컬럼명 / content:해당 컬럼에서 조회할 내용)
	public List<ReviewDTO> select1(Connection conn, String check, String content) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = null;
		// 1. 리뷰 번호로 조회
		if (check == "reviewNum") {
			sql = "select * from oc_review where review_num=?";
			// 2. 댓글 번호로 조회
		} else if (check == "reviewRe") {
			sql = "select * from oc_review where review_re=? order by 1";
			// 3. 회원 번호로 조회
		} else if (check == "userNum") {
			sql = "select * from oc_review where user_num=? order by 2, 1";
			// 4. 가게 번호로 조회
		} else if (check == "storeNum") {
			sql = "select * from oc_review where store_num=? order by 2, 1";
			// 5. 별점 숫자로 조회
		} else if (check == "reviewStar") {
			sql = "select * from oc_review where review_star=? order by 1";
		}
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, content);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setReviewNum(rs.getString("review_num")); // 1
				dto.setReviewRe(rs.getString("review_re")); // 2
				dto.setUserNum(rs.getString("user_num")); // 3
				dto.setUserNick(rs.getString("user_nick")); // 4
				dto.setStoreNum(rs.getString("store_num")); // 5
				dto.setStoreName(rs.getString("store_name")); // 6
				dto.setReviewStar(rs.getString("review_star")); // 7
				dto.setReviewContent(rs.getString("review_content")); // 8
				dto.setReviewDate(rs.getDate("review_date")); // 9
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 리뷰 일부 조회2 - 특정 회원의 별점별 리뷰 조회
	public List<ReviewDTO> selectUserStar(Connection conn, ReviewDTO dto) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select * from oc_review where user_num=? and review_star=? order by 2, 1";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getReviewStar());
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new ReviewDTO();
				dto.setReviewNum(rs.getString("review_num")); // 1
				dto.setReviewRe(rs.getString("review_re")); // 2
				dto.setUserNum(rs.getString("user_num")); // 3
				dto.setUserNick(rs.getString("user_nick")); // 4
				dto.setStoreNum(rs.getString("store_num")); // 5
				dto.setStoreName(rs.getString("store_name")); // 6
				dto.setReviewStar(rs.getString("review_star")); // 7
				dto.setReviewContent(rs.getString("review_content")); // 8
				dto.setReviewDate(rs.getDate("review_date")); // 9
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 리뷰 일부 조회3 - 특정 가게의 별점별 리뷰 조회
	public List<ReviewDTO> selectStoreStar(Connection conn, ReviewDTO dto) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select * from oc_review where store_num=? and review_star=? order by 2, 1";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreNum());
			psmt.setString(2, dto.getReviewStar());
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new ReviewDTO();
				dto.setReviewNum(rs.getString("review_num")); // 1
				dto.setReviewRe(rs.getString("review_re")); // 2
				dto.setUserNum(rs.getString("user_num")); // 3
				dto.setUserNick(rs.getString("user_nick")); // 4
				dto.setStoreNum(rs.getString("store_num")); // 5
				dto.setStoreName(rs.getString("store_name")); // 6
				dto.setReviewStar(rs.getString("review_star")); // 7
				dto.setReviewContent(rs.getString("review_content")); // 8
				dto.setReviewDate(rs.getDate("review_date")); // 9
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 리뷰 일부 조회4 - 가게별 별점 평균
	public Double selectStar(Connection conn, String storeNum) {
		Double stars = null;
		String sql = "select avg(review_star) as stars from oc_review where review_num=review_re and store_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, storeNum);
			rs = psmt.executeQuery();
			if (rs.next()) {
				stars = rs.getDouble("stars");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stars;
	}

	// 리뷰 쓰기(댓글 쓰기 포함)
	public int insert(Connection conn, ReviewDTO dto) {
		int n = 0;
		int seq = sequence(conn);
		String sql = "insert into oc_review (" + " review_num," // 1
				+ " review_re," // 2
				+ " user_num," // 3
				+ " user_nick," // 4
				+ " store_num," // 5
				+ " store_name," // 6
				+ " review_star," // 7
				+ " review_content" // 8
				+ ") values (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, Integer.toString(seq));
			if (dto.getReviewRe() == null) {
				psmt.setString(2, Integer.toString(seq));
			} else {
				psmt.setString(2, dto.getReviewRe());
			}
			psmt.setString(3, dto.getUserNum());
			psmt.setString(4, dto.getUserNick());
			psmt.setString(5, dto.getStoreNum());
			psmt.setString(6, dto.getStoreName());
			psmt.setString(7, dto.getReviewStar());
			psmt.setString(8, dto.getReviewContent());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 새로운 리뷰 등록 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 리뷰글 쓰기를 위한 리뷰번호 시퀀스 생성
	private int sequence(Connection conn) {
		int seq = 0;
		String sql = "select oc_review_num_seq.nextval from dual";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				seq = rs.getInt("nextval");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seq;
	}

	// 리뷰 수정
	public int update(Connection conn, ReviewDTO dto) {
		int n = 0;
		String sql = "update oc_review set" + " review_star=?, review_content=? where review_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getReviewStar());
			psmt.setString(2, dto.getReviewContent());
			psmt.setString(3, dto.getReviewNum());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 리뷰 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 리뷰 삭제
	public int delete(Connection conn, String reviewNum) {
		int n = 0;
		String sql = "delete from oc_review where review_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, reviewNum);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 리뷰 삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 2. 권보성

	// 3. 백승진

	// 복진영
	// 모든 리뷰글들을 불러온다.
	public  ArrayList<ReviewDTO> selectAll(Connection conn, int start, int end) {

			// Arraylist 생성
			// 빈객체를 담을 arraylist
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			//rownum 조회된 순서되로 순번
			String sql = "select * from " + "(select rownum as rnum, a1.* from "
					+ "(select review_num, review_re, user_num, store_num, review_star, review_content,review_date FROM REVIEW_TABLE ORDER BY review_num DESC) a1) a2 "
					+ "where a2.rnum >= ? and a2.rnum <=?";
				
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, start);//a1
				psmt.setInt(2, end);//a2

				// rs.next() 값이 있으면 투루를 반환.
				while (rs.next()) {
					// 빈객체 생성
					ReviewDTO dto = new ReviewDTO();

					dto.setReviewNum(rs.getString("review_num"));// 글 번호
					dto.setReviewNum(rs.getString("review_re"));// 댓글
					dto.setUserNum(rs.getString("user_num"));// 작성자 번호
					dto.setStoreNum(rs.getString("store_num"));// 가게 번호
					dto.setReviewRe(rs.getString("review_star"));// 별점
					dto.setReviewContent(rs.getString("reviewContent"));// 리뷰 내용
					dto.setReviewDate(rs.getDate("review_date"));// 리뷰 작성일
					list.add(dto);
				} // end while

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;

		}// end selectAll

	// 한 사용자의 모든 리뷰글들을 불러온다.
	public ArrayList<ReviewDTO> selectoneID(Connection conn, int start, int end) {

		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();

		// SQL
		// 리뷰게시판에 모든 데이터를 불러온다.
		// rownum 조회된 순서되로 순번
		String sql = "select * from " + "(select rownum as rnum, a1.* from "
				+ "(select review_num, review_re, user_num, store_num, review_star, review_content,review_date FROM REVIEW_TABLE WHERE=? ORDER BY review_num DESC) a1) a2 "
				+ "where a2.rnum >= ? and a2.rnum <=?";
		try {
			psmt = conn.prepareStatement(sql);

			// 수정해야함 pstmt.setString(1, "세션아이디");
			psmt.setInt(2, start);// a1
			psmt.setInt(3, end);// a2

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {
				// 빈객체 생성
				ReviewDTO dto = new ReviewDTO();

				dto.setReviewNum(rs.getString("review_num"));// 글 번호
				dto.setReviewNum(rs.getString("review_re"));// 댓글
				dto.setUserNum(rs.getString("user_num"));// 작성자 번호
				dto.setStoreNum(rs.getString("store_num"));// 가게 번호
				dto.setReviewRe(rs.getString("review_star"));// 별점
				dto.setReviewContent(rs.getString("reviewContent"));// 리뷰 내용
				dto.setReviewDate(rs.getDate("review_date"));// 리뷰 작성일
				list.add(dto);
			} // end while

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}// end selectoneID

	// 페이지 수를 구하는 메서드
	// 총 게시글 수 를 구함.
	public int review_getPageCount(Connection conn) throws Exception {

		// 쿼리문
		String sql = "SELECT COUNT(*) FROM " + "REVIEW_TABLE";

		Statement stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		rs.next();

		// 전체 글의 개수를 가져온다.
		int cnt = rs.getInt(1);

		// 총 페이지 개수 리턴
		return cnt;
	}

}
