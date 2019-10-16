package co.oc.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class TestEmail {

	public static void main(String[] args) {
		
		//String userEmail = request.getParameter("param");
		String userEmail = "vwtkbiseo@gmail.com";
	 	
		String title = "OC에서 보내는 회원가입 인증 메일입니다.";
		String contents = "인증번호는 " + RandomNum() + "입니다.";
		
		

		String host = "smtp.gmail.com";
		final String user = "yedam8246";
		final String password = "dPeka1225";
		
		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable","true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
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
			System.out.println("message sent successfully...");

		} catch (MessagingException e) {
			e.printStackTrace();
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
