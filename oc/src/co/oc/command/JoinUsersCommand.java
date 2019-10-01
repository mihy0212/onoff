package co.oc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.dao.UserDAO;
import co.oc.dto.UserDTO;



public class JoinUsersCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				UserDTO dto = new UserDTO();
				UserDAO dao = new UserDAO();
				String path = null;
				dto.setUserEmail(request.getParameter("userID"));
				dto.setUserPw(request.getParameter("userPassword"));
				dto.setUserName(request.getParameter("userName"));
				dto.setUserAddr(request.getParameter("userAddr"));

				int n = dao.insert(conn, dto);
				if (n != 0)
					path = "jsp/joinOk.jsp";
				else
					path = "jsp/joinFail.jsp";

				// 인서트 하는 구문 삽입
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}

		}