package co.oc.command.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AddDAO;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;
import co.oc.dao.UserDAO;
import co.oc.dto.AddDTO;
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
				int n = dao.insert(conn, dto);
				
				
				AddDTO adto = new AddDTO();
				AddDAO adao = new AddDAO();
				adto.setStoreName(request.getParameter("storeName"));
				adto.setStoreAddr(request.getParameter("storeAddr"));
				adto.setStoreCateg1(request.getParameter("storeCa1"));
				adto.setStoreCateg2(request.getParameter("storeCa2"));
				adto.setStoreCateg3(request.getParameter("storeCa3"));
				adto.setStoreLicense(request.getParameter("storeLicense"));
				adto.setUserLicense(request.getParameter("userLicense"));
				adto.setAddCapture(request.getParameter("addCapture"));
				adto.setUserNum(dto.getUserNum());
				int s = adao.insert(conn, adto);
				
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