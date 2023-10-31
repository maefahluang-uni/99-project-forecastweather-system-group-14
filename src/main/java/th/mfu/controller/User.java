package th.mfu.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/user")
public class User {
     @GetMapping
     public ResponseEntity<String> hello(){
          return new ResponseEntity<String>("", HttpStatus.OK);
     }
    
}
