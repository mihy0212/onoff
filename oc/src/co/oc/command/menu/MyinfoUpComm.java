package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;
import co.oc.dto.UserDTO;

public class MyinfoUpComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 접속
		Connection conn = DAO.connect();
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
		HttpSession session = request.getSession(false);
		String userNum = (String) session.getAttribute("userNum");
		UserDTO dto = new UserDTO();

//		// BeanUtils을 사용하여 한번에 저장만(bean=dto)
		/*
		 * try { BeanUtils.copyProperties(dto, request.getParameterMap()); } catch
		 * (Exception e) { e.printStackTrace(); }
		 */

		dto.setUserPw(request.getParameter("userPw"));
		dto.setUserNick(request.getParameter("userNickname"));
		dto.setUserAddr(request.getParameter("userAddr"));
		dto.setUserNum(userNum);
		
		
		// 유저 비번 null 값으로 나옴
		System.out.println(dto.getUserNick());
		System.out.println(dto.getUserPw());
		
		int n = UserDAO.getInstance().updateMyInfo(conn, dto);

		System.out.println(n);

		String path = null;

		// 성공하면 회원정보페이지
		if (n != 0) {
			path = "myinfo.do";
		}
		// 실패하면 회원정보 수정페이지
		else {
			path = "myinfoupForm.do";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		// 접속 해제
		DAO.disconnect(conn);

	}

}
