package th.mfu;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



@SpringBootApplication
public class WeatherApplication extends SpringBootServletInitializer {
    @Autowired
    private EmailSenderService EmailSenderService;
    public static void main(String[] args) {
        SpringApplication.run(WeatherApplication.class, args);
    }
    
    @EventListener(ApplicationReadyEvent.class)
    public void triggerMail() {
        senderService.sendEmail("6531503117@lamduan.mfu.ac.th", "สวัสดีจากกิ้กแฟ้ง", "เบนจี้กั้มมม");
    }
}