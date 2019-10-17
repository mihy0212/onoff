package co.oc.command.join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.RandomDAO;
import co.oc.dto.RandomDTO;

public class EmailCheck implements Command {
	
	int n = 0;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String userEmail = request.getParameter("userEmail");
	 	
		String title = "OC에서 보내는 회원가입 인증 메일입니다.";
		String randomKey = RandomNum();
		String contents = "인증번호는 " + randomKey + "입니다.";
		
		RandomDTO dto = new RandomDTO();
		dto.setUserEmail(userEmail);
		dto.setRandomKey(randomKey);
		Connection conn = DAO.connect();
		RandomDAO.getInstance().insert(conn, dto);
		DAO.disconnect(conn);

		String host = "smtp.gmail.com";
		final String user = "yedam8246";
		final String password = "dPeka1225";
		
		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable","true");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

			// Subject
			message.setSubject(title);

			// Text
			message.setText(contents);

			// send the message
			Transport.send(message);
			n = 1; //성공했다
			out.print(n);

		} catch (Exception e) {
			e.printStackTrace();
			out.print(n);
		}

	}
	
	public static String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6; i++) {
			int n = (int) (Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
}
