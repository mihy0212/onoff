package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dto.AskDTO;

public class BorderListCommand implements Command {

   
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      Connection conn = DAO.connect();
      int pagenum = 1; 
      if (request.getParameter("Page_num") != null) {
         pagenum = Integer.parseInt(request.getParameter("Page_num"));
      }
     
      int size = 5;

      int tot = 0;
      int cnt = 0;

      try {

         cnt = AskDAO.getInstance().ask_getPageCount(conn);
         System.out.println(cnt+"cnt");
         tot = cnt / size;
         if (cnt % size != 0) {
            tot++;
         }

      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      int end = pagenum * size;
      int start = end - size + 1;
      
      
      
      
      List<AskDTO> list = AskDAO.getInstance().selectAll(conn, start, end)  ;
      AskDAO dao = new AskDAO();
      //list = dao.selectAll(conn, start, end);
      
      request.setAttribute("list", list); //db�뿉�꽌 �꽆�뼱�삩 媛믪쓣  request媛앹껜�뿉 �냽�꽦�쑝濡� �궫�엯
      
      request.setAttribute("tot", tot);
      
      DAO.disconnect(conn);
      RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/manager/test2.jsp");
      dispatcher.forward(request, response);
   }

}