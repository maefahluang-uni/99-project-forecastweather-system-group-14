package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import th.mfu.model.User;

@RestController
@RequestMapping(value = "/user")
public class UserController {

     @Autowired
     private final User user;
     public UserController(User user) {
          this.user = user;
     }

     @GetMapping
     public ResponseEntity<String> hello() {
          return new ResponseEntity<String>("", HttpStatus.OK);
     }
     /*@GetMapping
     @RequestMapping(value = "/Login")
     public ResponseEntity<String> login() {
           return new ResponseEntity<String>("", HttpStatus.OK);}/* */
     @PostMapping
     @RequestMapping(value ="/Sighup")
     public String Sighup(@RequestBody User request) {
          return "Received" + request;
     }

}
