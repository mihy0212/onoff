package co.oc.command.join;

import java.util.Properties;
import java.util.Scanner;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public static void main(String[] args) {
		
		String whoIsSent;
		String title;
		String contents;

		String host = "smtp.naver.com";
		final String user = "dmsdud5656";
		final String password = "dudrjf200910932";
		
		System.out.print("받으실 분의 이메일 주소를 입력하세요. 틀리면 안됩니다. : ");
		Scanner sc = new Scanner(System.in);
		whoIsSent = sc.nextLine();
		
		System.out.print("메일 제목을 입력하세요 : ");
		title = sc.nextLine();
		
		System.out.print("메일 내용을 입력하세요 : ");
		contents = sc.nextLine();

		String to = whoIsSent;

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

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
}
