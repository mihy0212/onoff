package co.oc.command.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.oc.command.Command;
import co.oc.dao.AddDAO;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;
import co.oc.dto.AddDTO;
import co.oc.dto.UserDTO;

public class CeoInsertCommand implements Command {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = request.getServletContext();
		String saveDir = context.getRealPath("jsp/join/image"); 
		System.out.println(saveDir);
		int maxsize = 3*1024*1024; // 3MB
		String encoding = "UTF-8";
	MultipartRequest multi = new MultipartRequest(request, saveDir, maxsize, encoding, new DefaultFileRenamePolicy());
				UserDTO dto = new UserDTO();
				UserDAO dao = new UserDAO();
				String file = multi.getFilesystemName("addCapture");
				String path = null;
				dto.setUserEmail(multi.getParameter("userEmail"));
				dto.setUserPw(multi.getParameter("userPw"));
				dto.setUserName(multi.getParameter("userName"));
				dto.setUserNick(multi.getParameter("userNickname"));
				dto.setUserAddr(multi.getParameter("userAddr"));
				dto.setUserXy(multi.getParameter("userXY"));
				Connection conn = DAO.connect();
				int n = dao.insert(conn, dto);
				
				
				AddDTO adto = new AddDTO();
				AddDAO adao = new AddDAO();
				adto.setStoreName(multi.getParameter("storeName"));
				adto.setStoreAddr(multi.getParameter("storeAddr"));
				adto.setStoreXy(multi.getParameter("storeXY"));
				adto.setStoreCateg1(multi.getParameter("storeCa1"));
				adto.setStoreCateg2(multi.getParameter("storeCa2"));
				adto.setStoreCateg3(multi.getParameter("storeCa3"));
				adto.setStoreLicense(multi.getParameter("storeLicense"));
				adto.setUserLicense(multi.getParameter("userLicense"));
				adto.setAddCapture(file);
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