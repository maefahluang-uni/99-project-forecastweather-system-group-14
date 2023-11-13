package th.mfu.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Servie
public class EmailSenderService {

     @Autowired
     private JavamailSender javaMailSender;

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
