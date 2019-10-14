package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AddDAO;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;
import co.oc.dto.AddDTO;
import co.oc.dto.StoreDTO;

public class AdminStoreChangeComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = DAO.connect();
		
		String choice = request.getParameter("choice");
		
		if(choice.equals("regiChange")) {
			
			String addStatus = request.getParameter("addStatus");
			if(addStatus == "2") {
				AddDTO adto = (AddDTO) request.getSession().getAttribute("adto");	
				StoreDTO sdto = new StoreDTO();
				sdto.setStoreName(adto.getStoreName());
				sdto.setStoreAddr(adto.getStoreAddr());
				sdto.setStoreXy(adto.getStoreXy());
				sdto.setStoreCateg1(adto.getStoreCateg1());
				sdto.setStoreCateg2(adto.getStoreCateg2());
				sdto.setStoreCateg3(adto.getStoreCateg3());
				sdto.setUserNum(adto.getUserNum());
				String storeNum = StoreDAO.getInstance().insert(conn, sdto);
				
				adto.setAddStatus(addStatus);
				adto.setStoreNum(storeNum);
				int n = AddDAO.getInstance().updatePermit(conn, adto);
				if(n != 0) {
					response.sendRedirect("addRead.do?addNum="+adto.getAddNum());
				}
				
			} else if(addStatus == "3") {
				String addRe = request.getParameter("addRe");				
			}
			
			
			
		}
		
		DAO.disconnect(conn);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
}
