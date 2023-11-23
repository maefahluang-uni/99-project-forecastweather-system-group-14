package th.mfu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

//@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@SpringBootApplication
@ComponentScan("th.mfu")
public class WeatherApplication extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(WeatherApplication.class, args);
    }
}