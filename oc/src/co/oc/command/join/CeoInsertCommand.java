package co.oc.command.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;
import co.oc.dao.UserDAO;
import co.oc.dto.StoreDTO;
import co.oc.dto.UserDTO;

public class CeoInsertCommand implements Command {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				UserDTO dto = new UserDTO();
				UserDAO dao = new UserDAO();
				String path = null;
				dto.setUserEmail(request.getParameter("userEmail"));
				dto.setUserPw(request.getParameter("userPw"));
				dto.setUserName(request.getParameter("userName"));
				dto.setUserNick(request.getParameter("userNickname"));
				dto.setUserAddr(request.getParameter("userAddr"));
				Connection conn = DAO.connect();
				int n = dao.insertuser(conn, dto);
				
				
				StoreDTO sdto = new StoreDTO();
				StoreDAO sdao = new StoreDAO();
				sdto.setStoreName(request.getParameter("storeName"));
				sdto.setStoreAddr(request.getParameter("storeAddr"));
				sdto.setStoreXy(request.getParameter("storeXY"));
				sdto.setStoreCateg1(request.getParameter("storeCa1"));
				sdto.setStoreCateg2(request.getParameter("storeCa2"));
				sdto.setStoreCateg3(request.getParameter("storeCa3"));
				sdto.setUserNum(dto.getUserNum());
				int s = sdao.ceoinsert(conn, sdto);
				
				DAO.disconnect(conn);
				if (n != 0 && s != 0)
					path = "jsp/join/joinOk.jsp";
				else
					path = "jsp/join/joinFail.jsp";

				// 인서트 하는 구문 삽입
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}

		}