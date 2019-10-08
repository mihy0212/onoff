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
import co.oc.command.join.IdCheckCommand;
import co.oc.command.join.JoinCeoForm;
import co.oc.command.join.JoinFormCommand;
import co.oc.command.join.JoinUserForm;
import co.oc.command.join.JoinUsersCommand;
import co.oc.command.join.LoginCheckCommand;
import co.oc.command.join.LoginFormCommand;
import co.oc.command.join.LogoutCommand;
import co.oc.command.join.NickcheckCommand;
import co.oc.command.manager.BorderListCommand;
import co.oc.command.manager.BorderReadCommand;
import co.oc.command.manager.WriteForm;
import co.oc.command.menu.MyinfoDeleteComm;
import co.oc.command.menu.DeldectMyReiviewComm;
import co.oc.command.menu.MyAskListComm;
import co.oc.command.menu.MyAskRead;
import co.oc.command.menu.MyAskWriteComm;
import co.oc.command.menu.MyReviewComm;
import co.oc.command.menu.MyaskDeleteComm;
import co.oc.command.menu.MyinfoComm;
import co.oc.command.menu.MyinfoDeleteCheckComm;
import co.oc.command.menu.MyinfoUpComm;
import co.oc.command.menu.MyinfoupFormComm;
import co.oc.command.menu.UpdateMyReiviewComm;
import co.oc.command.menu2.LikeClickComm;
import co.oc.command.menu2.StoreInfoComm;


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
//		map.put("/reviewWrite.do", new ReviewWriteComm()); //회원의 가게 리뷰 쓰기
		map.put("/likeClick.do", new LikeClickComm()); //좋아요 클릭 시 좋아요 수 변동
//		map.put("/", new ());
//		map.put("/", new ());
//		map.put("/", new ());
		
		//권보성
		map.put("/join_ceo.do", new CeoInsertCommand()); //CEO 회원가입처리
		map.put("/NickCheck.do", new NickcheckCommand()); //nick네임 중복체크
		map.put("/join_userform.do", new JoinUserForm()); //일반유저 회원가입 폼
		map.put("/join_ceoform.do", new JoinCeoForm()); //CEO 회원가입폼
		map.put("/join_form.do", new JoinFormCommand()); //회원가입선택페이지
		map.put("/join_user.do", new JoinUsersCommand()); //회원가입처리
		map.put("/loginform.do", new LoginFormCommand()); // 로그인페이지로돌아가기
		map.put("/idCheck.do", new IdCheckCommand());	//ID중복체크
		map.put("/login.do", new LoginCheckCommand()); //로그인 정보 DB에확인 후 로그인
		map.put("/logout.do", new LogoutCommand()); //로그아웃
		map.put("/list.do", new BorderListCommand()); //문의글리스트보기
		map.put("/writeForm.do", new WriteForm()); //문의 답변폼
		map.put("/borderRead.do", new BorderReadCommand()); //문의글 하나보기
		//백승진
		
		
		//복진영
		//마이 메뉴
		map.put("/myinfo.do", new MyinfoComm() );//정보조회 myinfo.jsp로		
		map.put("/deletech.do", new MyinfoDeleteCheckComm());//탈퇴확인
		map.put("/delete.do", new MyinfoDeleteComm());//탈퇴
		map.put("/myinfoupForm.do", new MyinfoupFormComm() );//formjsp로 이동
		map.put("/myinfoup.do", new MyinfoUpComm());//수정
		
		map.put("/myReview.do", new MyReviewComm());//리뷰
		map.put("/myfavorite.do", new MyReviewComm());//즐겨찾기
		map.put("/updateMyReiview.do", new UpdateMyReiviewComm());
		map.put("/delectMyReiview.do", new DeldectMyReiviewComm());//리뷰삭제
		
		map.put("/myAskWrite.do", new MyAskWriteComm());//문의리스트
		map.put("/myAsklist.do", new MyAskListComm());//문의리스트
		map.put("/myAskRead.do", new MyAskRead());//문의읽기
		map.put("/myAskdelecte.do", new MyaskDeleteComm());//문의삭제
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		
		Command comm = map.get(path);
		comm.execute(request, response);
	}

}
