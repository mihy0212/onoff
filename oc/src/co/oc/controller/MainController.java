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
import co.oc.command.join.IdCheckCommand;
import co.oc.command.join.JoinUsersCommand;
import co.oc.command.join.LoginCheckCommand;
import co.oc.command.menu.DeleteComm;
import co.oc.command.menu.MyinfoComm;
import co.oc.command.menu.MyinfoupComm;
import co.oc.command.menu.MyinfoupFormComm;


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
		
		
		//권보성
		map.put("/join_user.do", new JoinUsersCommand());		
		map.put("/idCheck.do", new IdCheckCommand());		
		map.put("/login.do", new LoginCheckCommand());
		
		//백승진
		
		
		//복진영
		//마이 메뉴
				map.put("/myinfo.do", new MyinfoComm() );//정보조회 myinfo.jsp로
				map.put("/delete.do", new DeleteComm());//탈퇴
				map.put("/myinfoupForm.do", new MyinfoupFormComm() );//formjsp로 이동
				map.put("/myinfoup.do", new MyinfoupComm());//수정
		
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
