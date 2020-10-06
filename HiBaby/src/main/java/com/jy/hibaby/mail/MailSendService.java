package com.jy.hibaby.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.jy.hibaby.mail.model.EmailVO;	       

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
	
	
	public String sendAutoMail(String email) {
		
		String authKey = getKey(6);
				
		try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("HiBaby 비밀번호 인증 코드");
            sendMail.setText(new StringBuffer().append("<h1>[ 인증번호를 확인해주세요 ]</h1><hr>")					
					.append("<h2 style='width: 170px; background-color: green; color: black;'> 인증번호 : " + authKey + "</h2>")
					.toString());
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
	
