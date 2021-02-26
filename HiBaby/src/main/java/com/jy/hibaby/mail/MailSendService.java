package com.jy.hibaby.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;


@Service("mss")
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int size;
	
	
	// 인증번호 난수 생성 
	private String getKey(int size) {
		this.size = size;
		return getAutoCode();
	}
	
	private String getAutoCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while(buffer.length() < size) {
			num = random.nextInt(6);
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	// 비밀번호 인증코드 발급
	public String sendAutoMailFindPw(String email) {
		
		String authKey = getKey(6);
				
		try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("HiBaby 비밀번호 인증 코드");
            sendMail.setText(new StringBuffer().append("<h1>[ 인증번호를 확인해주세요 ]</h1><hr>")					
					.append("<h2 style='width: 170px; background-color: green; color: black;'> 인증번호 : " + authKey + "</h2>")
					.toString());
            sendMail.setFrom("ddw0099@naver.com");	// 본인 이메일 작성
            sendMail.setTo(email);
            sendMail.send();
	            
	    } catch (MessagingException e) {
	        e.printStackTrace();
	            
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }
	    return authKey;
    }
	
	
	// 아디찾기
	public void sendAutoMailFindId(String email, String user_id) {
		
		try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("HiBaby 아이디가 도착하였습니다. ");
            sendMail.setText(new StringBuffer().append("<h1>[ ID를 확인해 주세요 ]</h1><hr>")					
					.append("<h2 style='width: 170px; color: black;'> ID : " + user_id + "</h2>")
					.toString());
            sendMail.setFrom("ddw0099@naver.com");
            sendMail.setTo(email);
            sendMail.send();
	            
	    } catch (MessagingException e) {
	        e.printStackTrace();
	            
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }
    }
	
	// 이메일 인증
	public String sendAutoMail(String email) {
		 
		String authKey = getKey(6);
		try {
		    MailUtils sendMail = new MailUtils(mailSender);
		    sendMail.setSubject("회원가입 이메일 인증");
		    sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>").append("<p>아래 버튼을 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<form action='http://localhost:8089/user/signUpConfirm' method='post'>")
					.append("<input type='hidden' name='email' value='").append(email).append("'>")
					.append("<input type='hidden' name='authKey' value='").append(authKey).append("'>")
					.append("<input type='submit' value='이메일 인증 확인' style='width: 200px; height: 50px; border: 0; border-radius: 10px; background: #08a600; margin-top: 30px;'>").toString());
		    		
		    sendMail.setFrom("ddw0099@naver.com");
		    sendMail.setTo(email);
		    sendMail.send();
		} catch (MessagingException e) {
		    e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
		    e.printStackTrace();
		}
		 
        return authKey;
    }
}

