package main.java.com.services;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.MimeMessageHelper;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(String to, String subject, String formIdentifier) {
    	
    	   String msg = "hello This is from so and so company. We need more details about"
    	   		+ " your enquire to go on with the process of your enquire."+"\n"
    			   +"Tap on the link to give more details about your enquire";
    	   String htmlContent = "<html><body><a href=\""+"http://localhost:8080/DynamicModule/form-page/"
    			   + formIdentifier + "\">Click here to access the form</a></body></html>";
    	       	   
           MimeMessage message = mailSender.createMimeMessage();
           MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(to);
		    message.setSubject(subject);
		    helper.setText(msg+"\n"+htmlContent, true);
		}catch (MessagingException e) {
			e.printStackTrace();
			}         
     
        mailSender.send(message);
    }

}