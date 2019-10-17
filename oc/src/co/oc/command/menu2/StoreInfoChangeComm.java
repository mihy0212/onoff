package co.oc.command.menu2;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.FavoriteDAO;
import co.oc.dao.LikeDAO;
import co.oc.dao.ReviewDAO;
import co.oc.dao.StoreDAO;
import co.oc.dto.FavoriteDTO;
import co.oc.dto.LikeDTO;
import co.oc.dto.ReviewDTO;

public class StoreInfoChangeComm implements Command {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		Connection conn = DAO.connect();
		
//		int maxSize = 1024 * 1024 * 10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
//		String uploadPath = "C:\\Users\\User\\git\\on-off\\oc\\WebContent\\storeImg";
////		String uploadPath = request.getSession().getServletContext().getRealPath("/storeImg");
//		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

		String choice = request.getParameter("choice");
//		String choice1 = multi.getParameter("choice");
		
		if(choice != null ) {
			if (choice.equals("likeClick")) {
				LikeDTO ldto = new LikeDTO();
				ldto.setStoreNum(request.getParameter("storeNum"));
				ldto.setUserNum(request.getParameter("userNum"));
				int likeChk = LikeDAO.getInstance().checkInsert(conn, ldto);
				int likeCount = LikeDAO.getInstance().selectStoreNum(conn, ldto.getStoreNum());
	
				JSONObject obj = new JSONObject();
				obj.put("likeChk", likeChk);
				obj.put("likeCount", likeCount);
				out.print(obj.toJSONString());
	
			} else if (choice.equals("favoClick")) {
				FavoriteDTO dto = new FavoriteDTO();
				dto.setStoreNum(request.getParameter("storeNum"));
				dto.setUserNum(request.getParameter("userNum"));
				int favoCount = FavoriteDAO.getInstance().checkInsert(conn, dto);
				out.print(favoCount);
	
			} else if (choice.equals("storeInfoUpdate")) {
				String check = request.getParameter("check");
				String content = request.getParameter("content");
				String storeNum = request.getParameter("storeNum");
				if (check.equals("store_addr")) {
					String check2 = request.getParameter("check2");
					String content2 = request.getParameter("content2");
					int n = StoreDAO.getInstance().update1(conn, check, content, storeNum);
					int a = StoreDAO.getInstance().update1(conn, check2, content2, storeNum);
	
					JSONObject obj = new JSONObject();
					obj.put("n", n);
					obj.put("a", a);
					out.print(obj.toJSONString());
				} else {
					int n = StoreDAO.getInstance().update1(conn, check, content, storeNum);
					out.print(n);
				}
	
			} else if (choice.equals("reviewInsert")) {
				ReviewDTO dto = new ReviewDTO();
				String storeNum = request.getParameter("storeNum");
				dto.setStoreNum(storeNum);
				dto.setUserNum(request.getParameter("userNum"));
				dto.setReviewStar(request.getParameter("reviewStar"));
				dto.setReviewContent(request.getParameter("reviewContent"));
				int n = ReviewDAO.getInstance().insert(conn, dto);
				// out.print(n);
				if (n != 0) {
					response.sendRedirect("storeInfo.do?storeNum=" + storeNum);
				}
	
			} else if (choice.equals("reviewDelete")) {
				String reviewNum = request.getParameter("reviewNum");
				int n = ReviewDAO.getInstance().delete(conn, reviewNum);
				out.print(n);
	
			} else if (choice.equals("reviewUpdate")) {
				ReviewDTO dto = new ReviewDTO();
				String storeNum = request.getParameter("storeNum");
				dto.setReviewNum(request.getParameter("reviewNum"));
				dto.setReviewStar(request.getParameter("reviewStar"));
				dto.setReviewContent(request.getParameter("reviewContent"));
				int n = ReviewDAO.getInstance().update(conn, dto);
				double stars = ReviewDAO.getInstance().selectStar(conn, storeNum);
	
				JSONObject obj = new JSONObject();
				obj.put("n", n);
				obj.put("stars", stars);
				out.print(obj.toJSONString());
	
			} else if (choice.equals("reviewReply")) {
				ReviewDTO dto = new ReviewDTO();
				dto.setReviewRe(request.getParameter("reviewRe"));
				String storeNum = request.getParameter("storeNum");
				System.out.println(storeNum);
				dto.setStoreNum(storeNum);
				dto.setUserNum(request.getParameter("userNum"));
				dto.setReviewContent(request.getParameter("reviewContent"));
				int n = ReviewDAO.getInstance().insert(conn, dto);
				if (n != 0) {
					response.sendRedirect("storeInfo.do?storeNum=" + storeNum);
				} else {
					System.out.println("리뷰 댓글 등록 실패");
				}
			}
		}
//		if (choice1.equals("storeImgUp")) {
//
//			HttpSession session = request.getSession(false);
//			out.println("절대경로 : " + uploadPath + "<br/>");
//
//			
//
//			String name = "";
//			String subject = "";
//
//			String fileName1 = "";// 중복처리된 이름
//			String originalName1 = "";// 중복 처리전 실제 원본 이름
//			long fileSize = 0;// 파일 사이즈
//			String fileType = "";// 파일 타입
//
//
//			
//			// 파일 엘리먼트 이름 fileName1로 할것
//			try {
//				// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
//				
//
//				// form내의 input name="name" 인 녀석 value를 가져옴
//				name = multi.getParameter("file");
//				// name="subject" 인 녀석 value를 가져옴
//				subject = multi.getParameter("subject");
//
//				// 전송한 전체 파일이름들을 가져옴
//				Enumeration files = multi.getFileNames();
//
//				while (files.hasMoreElements()) {
//					// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
//					String file1 = (String) files.nextElement();// 파일 input에 지정한 이름을 가져옴
//					// 그에 해당하는 실재 파일 이름을 가져옴
//					originalName1 = multi.getOriginalFileName(file1);
//					// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
//					// 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
//					fileName1 = multi.getFilesystemName(file1);
//					// 파일 타입 정보를 가져옴
//					fileType = multi.getContentType(file1);
//					// input file name에 해당하는 실재 파일을 가져옴
//					File file = multi.getFile(file1);
//					// 그 파일 객체의 크기를 알아냄
//					fileSize = file.length();
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			String storeNum = (String) session.getAttribute("storeNum");
//			System.out.println(storeNum);
//			System.out.println(fileName1);
//			int n = StoreDAO.getInstance().changeStorePic(conn, fileName1, storeNum);
//			if(n !=0 ) {
//				response.sendRedirect("storeInfo.do?storeNum=" + storeNum);
//			} else {
//				System.out.println("이미지 등록 실패");
//			}
//		}

		DAO.disconnect(conn);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

}
