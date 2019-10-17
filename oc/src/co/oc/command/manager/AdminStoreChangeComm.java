package co.oc.command.manager;

import java.io.IOException;
import java.io.PrintWriter;
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
		PrintWriter out = response.getWriter();
		
		String choice = request.getParameter("choice");
		
		if(choice.equals("regiChange")) {
			String addStatus = request.getParameter("addStatus");
			
			if(addStatus.equals("2")) {
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
				int n = AddDAO.getInstance().updatePermit1(conn, adto);
				if(n != 0) {
					response.sendRedirect("addRead.do?addNum="+adto.getAddNum());
				}
				request.getSession().removeAttribute("adto");
				
			} else if(addStatus.equals("3") || addStatus.equals("4")) {
				AddDTO adto = new AddDTO();
				adto.setAddStatus(addStatus);
				adto.setAddRe(request.getParameter("addRe"));
				adto.setAddNum(request.getParameter("addNum"));
				int n = AddDAO.getInstance().updatePermit(conn, adto);
				out.print(n);
				
			} else if(addStatus.equals("1")) {
				String id = request.getParameter("id");
				System.out.println(id);
				if( id.equals("sub_cancle")) {
					AddDTO adto = new AddDTO();
					String storeNum = request.getParameter("storeNum");
					adto.setStoreNum("");
					adto.setAddStatus(addStatus);
					adto.setAddNum(request.getParameter("addNum"));
					int n = AddDAO.getInstance().updatePermit1(conn, adto);
					if(n != 0 ) {
						int a = StoreDAO.getInstance().delete(conn, storeNum);
						out.print(a);	
					}
				} else if(!id.equals("sub_cancle")){
					AddDTO adto = new AddDTO();
					adto.setAddStatus(addStatus);
					adto.setAddRe("");
					adto.setAddNum(request.getParameter("addNum"));
					int n = AddDAO.getInstance().updatePermit(conn, adto);
					out.print(n);
				}
			}
			
		} else if(choice.equals("storeDel")) {
			String[] deleteNum = request.getParameterValues("checkArray[]");
			int n = 0;
			if(deleteNum != null) {
				for(int i=0; i<deleteNum.length; i++) {
					String storeNum = deleteNum[i];
					n += StoreDAO.getInstance().delete(conn, storeNum);
				}
				out.print(n);
			} else {
				System.out.println("데이터가 없습니다.");
			}
		}
		
		DAO.disconnect(conn);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
}
