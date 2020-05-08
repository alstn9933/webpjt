package ajax.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
	public String mailSend(String email) {
		Random r = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i=0; i<6; i++) {
			if(i%2==1) {
				sb.append((char)(r.nextInt(10)+65));//랜덤 대문자 영어
			}else {
				sb.append(r.nextInt(10));//랜덤 숫자
			}
		}
		
		Properties prop = System.getProperties();//Web객체인데 String타입으로 주로 이루어짐
		
		//사용할 메일서버설정
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port",465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//메일 계정 정보 설정
		Session session = Session.getDefaultInstance(prop,new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("alstn9003@gmail.com", "PMSjan9002@");
			}
		});
		
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());//보내는 날짜 설정
			msg.setFrom(new InternetAddress("alstn9003@gmail.com","박민수"));//보내는 사람 이메일 설정
			InternetAddress to = new InternetAddress(email);//받는 사람 이메일 설정
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("인증메일(인증코드)","utf-8");//이메일 제목설정 글자타입설정
			msg.setContent("<h1>인증메일입니다 코드를 확인해주세요</h1><h3>인증번호["+sb.toString()+"]</h3>","text/html;charset=utf-8");//메일내용작성
			Transport.send(msg);//메일전송
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sb.toString();
	}
}
