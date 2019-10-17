package co.oc.command.map;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.oc.command.Command;

public class TestUploadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String uploadPath = "C:\\Users\\User\\git\\on-off\\oc\\WebContent\\storeImg";

		out.println("절대경로 : " + uploadPath + "<br/>");

		int maxSize = 1024 * 1024 * 10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한

		String name = "";
		String subject = "";

		String fileName1 = "";// 중복처리된 이름
		String originalName1 = "";// 중복 처리전 실제 원본 이름
		long fileSize = 0;// 파일 사이즈
		String fileType = "";// 파일 타입

		MultipartRequest multi = null;

		try {
			// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
			multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

			// form내의 input name="name" 인 녀석 value를 가져옴
			name = multi.getParameter("name");
			// name="subject" 인 녀석 value를 가져옴
			subject = multi.getParameter("subject");
			// 전송한 전체 파일이름들을 가져옴
			Enumeration files = multi.getFileNames();
			
			while (files.hasMoreElements()) {
				// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
				String file1 = (String) files.nextElement();// 파일 input에 지정한 이름을 가져옴
				// 그에 해당하는 실재 파일 이름을 가져옴
				originalName1 = multi.getOriginalFileName(file1);
				// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
				// 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
				fileName1 = multi.getFilesystemName(file1);
				// 파일 타입 정보를 가져옴
				fileType = multi.getContentType(file1);
				// input file name에 해당하는 실재 파일을 가져옴
				File file = multi.getFile(file1);
				// 그 파일 객체의 크기를 알아냄
				fileSize = file.length();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(fileName1);

		RequestDispatcher dispatcher = request.getRequestDispatcher("index.do");
		dispatcher.forward(request, response);
	}

}
