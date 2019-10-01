package co.onOff.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.onOff.DAO.UsersDAO;
import co.onOff.DTO.UsersDTO;


public class JoinUsersCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				UsersDTO dto = new UsersDTO();
				UsersDAO dao = new UsersDAO();
				String path = null;
				dto.setUserId(request.getParameter("userID"));
				dto.setUserPw(request.getParameter("userPassword"));
				dto.setUserName(request.getParameter("userName"));
				dto.setUserAddr(request.getParameter("userAddr"));

				int n = dao.insertUsers(dto);
				if (n != 0)
					path = "jsp/joinOk.jsp";
				else
					path = "jsp/joinFail.jsp";

				// 인서트 하는 구문 삽입
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}

		}