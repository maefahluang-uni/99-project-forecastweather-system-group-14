/*
package th.mfu.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.EnableConSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
     
     @Bean
     public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
          http
               .csrf()
               .disable()
               .authorizeHttpRequests()
               .anyRequest()
               .authenticated()
               .and()
               .oauth2Login()
               ;
               return http.build();
     }
}
*/
