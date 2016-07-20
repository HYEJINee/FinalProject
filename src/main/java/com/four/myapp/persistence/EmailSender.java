package com.four.myapp.persistence;


import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.EmailVO;
   @Repository
    public class EmailSender  {
         
        @Autowired
     	private JavaMailSender mailSender;
        public void SendEmail(EmailVO email) throws Exception {
            System.out.println("sender : "+ email.getContent());
            
            MimeMessage msg = mailSender.createMimeMessage();
    
            try {
                msg.setSubject(email.getSubject());
                msg.setText(email.getContent());
                msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
               
            }catch(MessagingException e) {
                System.out.println("MessagingException");
                e.printStackTrace();
            }
            try {
                mailSender.send(msg);
            }catch(MailException e) {
                System.out.println("MailException¹ß»ý");
                e.printStackTrace();
            }
        }
}
