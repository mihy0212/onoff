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
import co.oc.command.join.EmailCheck;
import co.oc.command.join.FindFormCommand;
import co.oc.command.join.GoFindPW;
import co.oc.command.join.GoidfindCommand;
import co.oc.command.join.Homego;
import co.oc.command.join.IDFindCommand;
import co.oc.command.join.IDFindFormCommand;
import co.oc.command.join.IdCheckCommand;
import co.oc.command.join.JoinCeoForm;
import co.oc.command.join.JoinFormCommand;
import co.oc.command.join.JoinUserForm;
import co.oc.command.join.JoinUsersCommand;
import co.oc.command.join.LoginCheckCommand;
import co.oc.command.join.LoginFormCommand;
import co.oc.command.join.LogoutCommand;
import co.oc.command.join.NickcheckCommand;
import co.oc.command.join.PWFindCommand;
import co.oc.command.join.RanNumCheck;
import co.oc.command.join.StoreNickCheck;
import co.oc.command.manager.AddReadComm;
import co.oc.command.manager.AdminStoreChangeComm;
import co.oc.command.manager.AdminStoreInfoComm;
import co.oc.command.manager.AnswerCommand;
import co.oc.command.manager.BorderDelete;
import co.oc.command.manager.BorderListCommand;
import co.oc.command.manager.BorderReadCommand;
import co.oc.command.manager.UserDelete;
import co.oc.command.manager.UserList;
import co.oc.command.map.AjaxCloseStoreCommand;
import co.oc.command.map.AjaxFavoriteStoreCommand;
import co.oc.command.map.AjaxOpenStoreCommand;
import co.oc.command.map.SearchCommand;
import co.oc.command.map.StoreCloseCommand;
import co.oc.command.map.StoreOpenCommand;
import co.oc.command.map.StoreStateCommand;
import co.oc.command.map.TestUploadCommand;
import co.oc.command.map.TestUploadForm;
import co.oc.command.menu.DeldectMyReiviewComm;
import co.oc.command.menu.MyActComm;
import co.oc.command.menu.MyAskListComm;
import co.oc.command.menu.MyAskRead;
import co.oc.command.menu.MyAskUpFormComm;
import co.oc.command.menu.MyAskWriteComm;
import co.oc.command.menu.MyaskDeleteComm;
import co.oc.command.menu.MyinfoComm;
import co.oc.command.menu.MyinfoDeleteCheckComm;
import co.oc.command.menu.MyinfoDeleteComm;
import co.oc.command.menu.MyinfoUpComm;
import co.oc.command.menu.MyinfoupFormComm;
import co.oc.command.menu.UpdateMyAskComm;
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

		// 최미현
		map.put("/storeInfo.do", new StoreInfoComm()); // 가게별 상세 정보 조회
		map.put("/storeInfoChange.do", new StoreInfoChangeComm()); // storeInfo.jsp(가게 상세)에서 일어나는 모든 변경
		map.put("/storeReview.do", new StoreReviewComm()); // 리뷰 조회

		map.put("/adminStoreInfo.do", new AdminStoreInfoComm()); // 가게 신청 목록 및 전체 가게 관리
		map.put("/addRead.do", new AddReadComm()); // 가게 신청서 한 건 조회
		map.put("/adminStoreChange.do", new AdminStoreChangeComm()); // admin_store에서 일어나는 모든 변경
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
		map.put("/answer.do", new AnswerCommand()); // 답변 달기
		map.put("/borderRead.do", new BorderReadCommand()); // 문의글 상세보기
		map.put("/userlist.do", new UserList()); // 유저 리스트 출력
//		map.put("/userRead.do", new UserRead());
		map.put("/borderdelete.do", new BorderDelete()); // 문의글 삭제
		map.put("/userdelete.do", new UserDelete()); // 유저삭제
		map.put("/storeNickCheck.do", new StoreNickCheck()); // 스토어 이름 중복체크
		map.put("/index.do", new Homego()); // 홈화면가기
		map.put("/idfind.do", new IDFindCommand()); // 아이디찾기
		map.put("/findform.do", new FindFormCommand());// ID/PW 선택폼
		map.put("/idfindform", new IDFindFormCommand()); // ID 폼
		map.put("/goidfindtest.do", new GoidfindCommand()); // 아이디찾기 폼
		map.put("/gopwform.do", new GoFindPW()); // 패스워드 찾기폼
		map.put("/pwfind.do", new PWFindCommand()); // 패스워드 찾는 코맨드
		map.put("/emailCheck.do", new EmailCheck()); // 이메일 인증메일발송
		map.put("/ranNumCheck.do", new RanNumCheck()); // 이메일 인증 번호 체크.

		// 백승진
		map.put("/ajaxOpenStore.do", new AjaxOpenStoreCommand());
		map.put("/ajaxCloseStore.do", new AjaxCloseStoreCommand());
		map.put("/ajaxSearch.do", new SearchCommand());
		map.put("/ajaxStoreState.do", new StoreStateCommand());
		map.put("/storeOpen.do", new StoreOpenCommand());
		map.put("/storeClose.do", new StoreCloseCommand());
		map.put("/ajaxFavoriteStore.do", new AjaxFavoriteStoreCommand());
		map.put("/testUpload.do", new TestUploadCommand());
		map.put("/testUploadForm.do", new TestUploadForm());

		// 복진영
		// 마이 메뉴
		map.put("/myinfo.do", new MyinfoComm());// 정보조회 myinfo.jsp로
		map.put("/deletech.do", new MyinfoDeleteCheckComm());// 탈퇴확인
		map.put("/delete.do", new MyinfoDeleteComm());// 탈퇴
		map.put("/myinfoupForm.do", new MyinfoupFormComm());// formjsp로 이동
		map.put("/myinfoup.do", new MyinfoUpComm());// 수정

		map.put("/myReview.do", new MyActComm());// 리뷰리스트
		map.put("/myfavorite.do", new MyActComm());// 즐겨찾기리스트
		map.put("/updateMyReiview.do", new UpdateMyReiviewComm());// 리뷰수정
		map.put("/delectMyReiview.do", new DeldectMyReiviewComm());// 리뷰삭제
		// map.put("/storeInfoChange.do", new StoreInfoChangeComm());

		map.put("/myAskWrite.do", new MyAskWriteComm());// 문의리스트
		map.put("/myAsklist.do", new MyAskListComm());// 문의리스트
		map.put("/myAskRead.do", new MyAskRead());// 문의읽기
		map.put("/myaskupForm.do", new MyAskUpFormComm());// formjsp로 이동
		map.put("/myAskupdate.do", new UpdateMyAskComm());// 문의수정
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
