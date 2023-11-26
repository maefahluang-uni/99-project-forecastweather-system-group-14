package th.mfu.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean<ImageRedirectFilter> imageRedirectFilter() {
        FilterRegistrationBean<ImageRedirectFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new ImageRedirectFilter());
        registrationBean.addUrlPatterns("/img/mian%20login%202%203.png");
        return registrationBean;
    }
}
