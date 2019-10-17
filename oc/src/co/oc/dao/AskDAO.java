package co.oc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.oc.dto.AskDTO;

public class AskDAO extends DAO {

	private static AskDAO instance = new AskDAO();

	public static AskDAO getInstance() {
		return instance;
	}
	
	//전체 문의 조회
	public List<AskDTO> selectAll(Connection conn, int start, int end){
		List<AskDTO> list = new ArrayList<AskDTO>();
		String sql = "select a.ask_num," //1
				+ " a.ask_re,"		//2
				+ " a.user_num,"	//3
				+ " u.user_name,"	//4
				+ " u.user_grant,"	//5
				+ " a.store_num,"	//6
				+ " s.store_name,"	//7
				+ " a.ask_title,"	//8
				+ " a.ask_content,"	//9
				+ " a.ask_status,"	//10
				+ " a.ask_date"		//11
				+ " from oc_ask a join oc_user u on(a.user_num = u.user_num)"
				+ " left outer join oc_store s on(a.store_num = s.store_num)"
				+ " where a.ask_re in (select ask_num"
						+ " from (select rownum as rnum, ask_num"
							+ " from (select *"
								+ " from oc_ask"
								+ " where ask_num=ask_re"
								+ " order by ask_num desc) a1"
							+ " where rownum<=?) a2"
						+ " where a2.rnum>=?)"
				+ " order by a.ask_re desc, a.ask_num asc";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			while(rs.next()) {
				AskDTO dto = new AskDTO();
				dto.setAskNum(rs.getString("ask_num"));		//1
				dto.setAskRe(rs.getString("ask_re"));		//2
				dto.setUserNum(rs.getString("user_num"));	//3
				dto.setUserName(rs.getString("user_name"));	//4
				dto.setUserGrant(rs.getString("user_grant"));//5
				dto.setStoreNum(rs.getString("store_num"));	//6
				dto.setStoreName(rs.getString("store_name"));//7
				dto.setAskTitle(rs.getString("ask_title"));	//8
				dto.setAskContent(rs.getString("ask_content"));//9
				dto.setAskStatus(rs.getString("ask_status"));//10
				dto.setAskDate(rs.getDate("ask_date"));		//11
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//문의 일부 조회(문의에 대한 답변까지 모두 조회됨)
		//(check:조회할 컬럼명 / content:해당 컬럼에서 조회할 내용)
		//- 회원 기준(chk => "user_num")
		//- 가게 기준(chk => "store_num")
		//- 문의 번호 기준(chk => "ask_re")
		//- 문의 상태 기준(chk => "ask_status")
	public List<AskDTO> selectOne(Connection conn, String check, String content, int start, int end){
		List<AskDTO> list = new ArrayList<AskDTO>();
		String sql = "select a.ask_num," //1
				+ " a.ask_re,"		//2
				+ " a.user_num,"	//3
				+ " u.user_name,"	//4
				+ " u.user_grant,"	//5
				+ " a.store_num,"	//6
				+ " s.store_name,"	//7
				+ " a.ask_title,"	//8
				+ " a.ask_content,"	//9
				+ " a.ask_status,"	//10
				+ " a.ask_date"		//11
				+ " from oc_ask a join oc_user u on(a.user_num = u.user_num)"
				+ " left outer join oc_store s on(a.store_num = s.store_num)"
				+ " where a.ask_re in (select ask_num"
						+ " from (select rownum as rnum, ask_num"
							+ " from (select *"
								+ " from oc_ask"
								+ " where ask_num=ask_re and "+check+"="+content
								+ " order by ask_num desc) a1"
							+ " where rownum<=?) a2"
						+ " where a2.rnum>=?)"
				+ " order by a.ask_re desc, a.ask_num asc";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			while(rs.next()) {
				AskDTO dto = new AskDTO();
				dto.setAskNum(rs.getString("ask_num"));		//1
				dto.setAskRe(rs.getString("ask_re"));		//2
				dto.setUserNum(rs.getString("user_num"));	//3
				dto.setUserName(rs.getString("user_name"));	//4
				dto.setUserGrant(rs.getString("user_grant"));//5
				dto.setStoreNum(rs.getString("store_num"));	//6
				dto.setStoreName(rs.getString("store_name"));//7
				dto.setAskTitle(rs.getString("ask_title"));	//8
				dto.setAskContent(rs.getString("ask_content"));//9
				dto.setAskStatus(rs.getString("ask_status"));//10
				dto.setAskDate(rs.getDate("ask_date"));		//11
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//회원의 문의&관리자의 답변 등록
	public int insert(Connection conn, AskDTO dto) {
		int n = 0;
		int seq = sequence(conn);
		String sql = "insert into oc_ask (ask_num," //1
				+ " ask_re,"	//2
				+ " user_num,"	//3
				+ " store_num,"	//4
				+ " ask_title,"	//5
				+ " ask_content,"//6
				+ " ask_status"	//7
				+ ") values (?, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, Integer.toString(seq));		//1
			System.out.println(dto.getAskRe());
			if(dto.getAskRe() == null) {
				psmt.setString(2, Integer.toString(seq)); //2
			} else {
				psmt.setString(2, dto.getAskRe());
			}
			psmt.setString(3, dto.getUserNum());	//3
			psmt.setString(4, dto.getStoreNum());	//4
			psmt.setString(5, dto.getAskTitle());	//5
			psmt.setString(6, dto.getAskContent());	//6
			if(dto.getAskRe() == null) {
				psmt.setString(7, "1");	//7
			} else {
				psmt.setString(7, "3");
			}
			n = psmt.executeUpdate();
			System.out.println(n + "건의 문의or답변 등록 완료");
			
			//상태변화 메소드
			if(dto.getAskRe() != null) {
				updateStatus(conn, dto.getAskRe());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	//문의글 쓰기를 위한 문의번호 시퀀스 생성
	private int sequence(Connection conn) {
		int seq = 0;
		String sql = "select oc_ask_num_seq.nextval from dual";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				seq = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seq;
	}
	
	//답변 등록 시 문의글의 상태 변화 등록
	public int updateStatus(Connection conn, String askRe) {
		int n = 0;
		String sql = "update oc_ask set ask_status=? where ask_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "2");
			psmt.setString(2, askRe);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 회원 문의 상태 변경 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	//문의&답변 수정
	public int update(Connection conn, AskDTO dto) {
		int n = 0;
		String sql = null;
		if(dto.getAskStatus() == "2") {
			System.out.println("처리 상태가 바뀌어 문의내용 수정 불가");
			
		} else {
			sql = "update oc_ask set ask_title=?, ask_content=? where ask_num=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getAskTitle());
				psmt.setString(2, dto.getAskContent());
				psmt.setString(3, dto.getAskNum());
				n = psmt.executeUpdate();
				System.out.println(n + "건의 문의 내용 수정 완료");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return n;
	}
	
	//문의&답변 삭제
	public int delete(Connection conn, String askNum) {
		int n = 0;
		
		String sql = "delete from oc_ask where ask_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, askNum);
			n = psmt.executeUpdate();
			System.out.println(n + "건의 문의 내용 삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	//페이지 구하기 위한 총 게시글 수 카운트
	public int ask_getPageCount(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) from oc_ask";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	
	
	//2. 권보성
	
	
	
	//3. 백승진
	
	
	
	//4. 복진영
	// 페이지 수를 구하기 위해 총 게시글 수 를 구함.
			public int ask_getPageCountuserNum(Connection conn, String userNum) {
				int cnt = 0;
				String sql = "SELECT COUNT(*) FROM oc_ask where user_num=?" ;

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

