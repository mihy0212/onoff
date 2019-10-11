package co.oc.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.command.join.CeoInsertCommand;
import co.oc.command.join.Homego;
import co.oc.command.join.IdCheckCommand;
import co.oc.command.join.JoinCeoForm;
import co.oc.command.join.JoinFormCommand;
import co.oc.command.join.JoinUserForm;
import co.oc.command.join.JoinUsersCommand;
import co.oc.command.join.LoginCheckCommand;
import co.oc.command.join.LoginFormCommand;
import co.oc.command.join.LogoutCommand;
import co.oc.command.join.NickcheckCommand;
import co.oc.command.join.StoreNickCheck;
import co.oc.command.manager.AddReadComm;
import co.oc.command.manager.AdminStoreInfoComm;
import co.oc.command.manager.BorderDelete;
import co.oc.command.manager.BorderListCommand;
import co.oc.command.manager.BorderReadCommand;
import co.oc.command.manager.UserDelete;
import co.oc.command.manager.UserList;
import co.oc.command.manager.UserRead;
import co.oc.command.manager.WriteForm;
import co.oc.command.map.CloseStoreCommand;
import co.oc.command.map.OpenStoreCommand;
import co.oc.command.map.SearchCommand;
import co.oc.command.menu.DeldectMyReiviewComm;
import co.oc.command.menu.MyActComm;
import co.oc.command.menu.MyAskListComm;
import co.oc.command.menu.MyAskRead;
import co.oc.command.menu.MyAskWriteComm;
import co.oc.command.menu.MyaskDeleteComm;
import co.oc.command.menu.MyinfoComm;
import co.oc.command.menu.MyinfoDeleteCheckComm;
import co.oc.command.menu.MyinfoDeleteComm;
import co.oc.command.menu.MyinfoUpComm;
import co.oc.command.menu.MyinfoupFormComm;
import co.oc.command.menu.UpdateMyReiviewComm;
import co.oc.command.menu2.StoreInfoChangeComm;
import co.oc.command.menu2.StoreInfoComm;
import co.oc.command.menu2.StoreReviewComm;

@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainController() {
		super();
	}

	HashMap<String, Command> map = null;

	public void init(ServletConfig config) throws ServletException {
		map = new HashMap<String, Command>();
		
		//최미현
		map.put("/storeInfo.do", new StoreInfoComm()); //가게별 상세 정보 조회
		map.put("/storeInfoChange.do", new StoreInfoChangeComm()); //storeInfo.jsp(가게 상세)에서 일어나는 모든 변경
		map.put("/storeReview.do", new StoreReviewComm());
		
		map.put("/adminStoreInfo.do", new AdminStoreInfoComm()); //가게 신청 목록 및 전체 가게 관리 
		map.put("/addRead.do", new AddReadComm()); //가게 신청서 한 건 조회
//		map.put("/", new ());
//		map.put("/", new ());

		// 권보성
		map.put("/join_ceo.do", new CeoInsertCommand()); // CEO 회원가입처리
		map.put("/NickCheck.do", new NickcheckCommand()); // nick네임 중복체크
		map.put("/join_userform.do", new JoinUserForm()); // 일반유저 회원가입 폼
		map.put("/join_ceoform.do", new JoinCeoForm()); // CEO 회원가입폼
		map.put("/join_form.do", new JoinFormCommand()); // 회원가입선택페이지
		map.put("/join_user.do", new JoinUsersCommand()); // 회원가입처리
		map.put("/loginform.do", new LoginFormCommand()); // 로그인페이지로돌아가기
		map.put("/idCheck.do", new IdCheckCommand()); // ID중복체크
		map.put("/login.do", new LoginCheckCommand()); // 로그인 정보 DB에확인 후 로그인
		map.put("/logout.do", new LogoutCommand()); // 로그아웃
		map.put("/list.do", new BorderListCommand()); // 문의글리스트보기
		map.put("/writeForm.do", new WriteForm()); //문의 답변폼으로가기
		map.put("/borderRead.do", new BorderReadCommand()); // 문의글 상세보기
		map.put("/userlist.do", new UserList()); // 유저 리스트 출력
//		map.put("/userRead.do", new UserRead());
		map.put("/borderdelete.do", new BorderDelete()); // 문의글 삭제
		map.put("/userdelete.do", new UserDelete()); // 유저삭제
		map.put("/storeNickCheck.do", new StoreNickCheck()); // 스토어 이름 중복체크
		map.put("/index.do", new Homego());
		
		// 백승진
		map.put("/ajaxOpenStore.do", new OpenStoreCommand());
		map.put("/ajaxCloseStore.do", new CloseStoreCommand());
		map.put("/search.do", new SearchCommand());

		// 복진영
		// 마이 메뉴
		map.put("/myinfo.do", new MyinfoComm());// 정보조회 myinfo.jsp로
		map.put("/deletech.do", new MyinfoDeleteCheckComm());// 탈퇴확인
		map.put("/delete.do", new MyinfoDeleteComm());// 탈퇴
		map.put("/myinfoupForm.do", new MyinfoupFormComm());// formjsp로 이동
		map.put("/myinfoup.do", new MyinfoUpComm());// 수정

		map.put("/myReview.do", new MyActComm());// 리뷰리스트
		map.put("/myfavorite.do", new MyActComm());// 즐겨찾기리스트
		map.put("/updateMyReiview.do", new UpdateMyReiviewComm());//리뷰수정
		map.put("/delectMyReiview.do", new DeldectMyReiviewComm());// 리뷰삭제

		map.put("/myAskWrite.do", new MyAskWriteComm());// 문의리스트
		map.put("/myAsklist.do", new MyAskListComm());// 문의리스트
		map.put("/myAskRead.do", new MyAskRead());// 문의읽기
		map.put("/myAskdelecte.do", new MyaskDeleteComm());// 문의삭제

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());

		Command comm = map.get(path);
		comm.execute(request, response);
	}

}
