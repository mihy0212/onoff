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
				+ " s.store_name,"			//6
				+ " r.review_star,"			//7
				+ " r.review_content,"		//8
				+ " r.review_date"			//9
				+ " from oc_review r join oc_user u"
				+ " on (r.user_num = u.user_num) join oc_store s"
				+ " on (r.store_num = s.store_num)"
				+ " where r.review_re in" //review_re에서 review_num를 찾는다.
					+ " (select review_num"
							+ " from (select rownum as rnum, review_num"
									+ "	from (select review_num "
											+ "	from oc_review"
											+ " where review_num=review_re"
											+ " order by review_num desc) a1"
									+ " where rownum<=?) a2"
						+ " where a2.rnum>=?)"
				+ " order by r.review_re desc, r.review_num asc";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
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
				+ " s.store_name,"			//6
				+ " r.review_star,"			//7
				+ " r.review_content,"		//8
				+ " r.review_date"			//9
				+ " from oc_review r join oc_user u"
				+ " on (r.user_num = u.user_num) join oc_store s"
				+ " on (r.store_num = s.store_num)"
				+ " where r.review_re in"
					+ " (select review_num"
							+ " from (select rownum as rnum, review_num"
									+ "	from (select review_num, review_re, user_num, store_num, review_star, review_content, review_date"
											+ "	from oc_review"
											+ " where review_num=review_re and "+check+"="+content
											+ " order by review_num desc) a1"
									+ " where rownum<=?) a2"
						+ " where a2.rnum>=?)"
				+ " order by r.review_re desc, r.review_num asc";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
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
				+ " s.store_name,"			//6
				+ " r.review_star,"			//7
				+ " r.review_content,"		//8
				+ " r.review_date"			//9
				+ " from oc_review r join oc_user u"
				+ " on (r.user_num = u.user_num) join oc_store s"
				+ " on (r.store_num = s.store_num)"
				+ " where r.review_re in"
					+ " (select review_num"
							+ " from (select rownum as rnum, review_num"
									+ "	from (select review_num, review_re, user_num, store_num, review_star, review_content, review_date"
											+ "	from oc_review"
											+ " where review_num=review_re and store_num like '%'|| ? ||'%' and user_num like '%' || ? ||'%' and review_star=?"
											+ " order by review_num desc) a1"
									+ " where rownum<=?) a2"
						+ " where a2.rnum>=?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStoreNum());
			psmt.setString(2, dto.getUserNum());
			psmt.setString(3, dto.getReviewStar());
			psmt.setInt(4, end);
			psmt.setInt(5, start);
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

	// 리뷰 일부 조회3 - 가게별 별점 평균
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
				+ " review_star," // 5
				+ " review_content" // 6
				+ ") values (?, ?, ?, ?, ?, ?)";
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
			psmt.setString(5, dto.getReviewStar());
			psmt.setString(6, dto.getReviewContent());
			n = psmt.executeUpdate();
			System.out.println(n + "건의 새로운 리뷰 등록 완료");
			if(n == 0) {
				seq = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seq;
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
		//culumn : 검색할 컬럼명, content: 검색할 내용
	public int review_getPageCount(Connection conn, String culumn, String content) {
		int cnt = 0;
		String sql = "select count(*) from oc_review where " + culumn + "=" + content;
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

	// 2. 권보성

	
	
	// 3. 백승진

	
	
	// 4. 복진영
	// 페이지 수를 구하기 위해 총 게시글 수 를 구함.
		public int review_getPageCountuserNum(Connection conn, String userNum) {
			int cnt = 0;
			String sql = "SELECT COUNT(*) FROM oc_review where user_num=?" ;

			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, userNum);
				rs = psmt.executeQuery();
				if(rs.next()) {
					// 전체 글의 개수를 가져온다.
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
		}


}
