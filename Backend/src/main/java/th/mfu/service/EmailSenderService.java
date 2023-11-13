package th.mfu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;


@Service
public class EmailSenderService {

     @Autowired
     private JavaMailSender javaMailSender;

     public void sendEmail(String toEmail, String subject, String body){
          SimpleMailMessage message = new SimpleMailMessage();
          message.setFrom("mail");
          message.setTo(toEmail);
          message.setText(body);
          message.setSubject(subject);

          javaMailSender.send(message);

          System.out.println("Send Email Success!");
     }
}
