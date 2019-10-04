package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import co.oc.dto.ReviewDTO;

public class ReviewDAO extends DAO {

	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		return instance;
	}

	// 전체 리뷰와 별점 조회
	public List<ReviewDTO> selectAll(Connection conn, int start, int end) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select r.review_num,"	//1
				+ " r.review_re,"			//2
				+ " r.user_num,"			//3
				+ " u.user_nick,"			//4
				+ " r.store_num,"			//5
				+ " r.store_name,"			//6
				+ " r.review_star,"			//7
				+ " r.review_content,"		//8
				+ " r.review_date"			//9
				+ " from oc_review r join oc_user u"
				+ " on (r.user_num = u.user_num)"
				+ " where r.review_re in (select review_num" //review_re에서 review_num를 찾는다.
										+ " from (select rownum as rnum, review_num"
												+ "	from (select review_num from oc_review where review_num=review_re order by review_num desc) a1"
										+ ") a2 where a2.rnum >=? and a2.rnum <=?)"
				+ " order by r.review_re desc, r.review_num asc";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
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
	public List<ReviewDTO> select1(Connection conn, String check, String content, int start, int end) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select r.review_num,"	//1
				+ " r.review_re,"			//2
				+ " r.user_num,"			//3
				+ " u.user_nick,"			//4
				+ " r.store_num,"			//5
				+ " r.store_name,"			//6
				+ " r.review_star,"			//7
				+ " r.review_content,"		//8
				+ " r.review_date"			//9
				+ " from oc_review r join oc_user u"
				+ " on (r.user_num = u.user_num)"
				+ " where r.review_re in (select review_num" //review_re에서 review_num를 찾는다.
										+ " from (select rownum as rnum, review_num"
												+ "	from (select review_num from oc_review where review_num=review_re order by review_num desc) a1"
										+ ") a2 where a2.rnum >=? and a2.rnum <=?)"
				+ " and " + check + " = " + content
				+ " order by r.review_re desc, r.review_num asc";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
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

	// 리뷰 일부 조회2 - 특정 회원 또는 가게의 별점별 리뷰 조회
	public List<ReviewDTO> selectStar(Connection conn, ReviewDTO dto, int start, int end) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select r.review_num,"	//1
				+ " r.review_re,"			//2
				+ " r.user_num,"			//3
				+ " u.user_nick,"			//4
				+ " r.store_num,"			//5
				+ " r.store_name,"			//6
				+ " r.review_star,"			//7
				+ " r.review_content,"		//8
				+ " r.review_date"			//9
				+ " from oc_review r join oc_user u"
				+ " on (r.user_num = u.user_num)"
				+ " where r.review_re in (select review_num" //review_re에서 review_num를 찾는다.
										+ " from (select rownum as rnum, review_num"
												+ "	from (select review_num from oc_review where review_num=review_re order by review_num desc) a1"
										+ ") a2 where a2.rnum >=? and a2.rnum <=?)"
				+ " and r.store_num like '%'|| ? ||'%' and r.user_num like '%' || ? ||'%' and r.review_star=?"
				+ " order by r.review_re desc, r.review_num asc";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			psmt.setString(3, dto.getStoreNum());
			psmt.setString(4, dto.getUserNum());
			psmt.setString(5, dto.getReviewStar());
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
		String sql = "insert into oc_review ("
				+ "review_num," // 1
				+ " review_re," // 2
				+ " user_num," // 3
				+ " store_num," // 4
				+ " store_name," // 5
				+ " review_star," // 6
				+ " review_content" // 7
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
			psmt.setString(4, dto.getStoreNum());
			psmt.setString(5, dto.getStoreName());
			psmt.setString(6, dto.getReviewStar());
			psmt.setString(7, dto.getReviewContent());
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
		String sql = "update oc_review set"
			+ " review_star=?, review_content=? where review_num=?";
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
	
	// 페이지 수를 구하기 위해 총 게시글 수 를 구함.
	public int review_getPageCount(Connection conn) {
		int cnt = 0;
		String sql = "SELECT COUNT(*) FROM oc_review";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery(sql);
			if(rs.next()) {
				// 전체 글의 개수를 가져온다.
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 2. 권보성

	
	
	// 3. 백승진

	
	
	// 4. 복진영



}
