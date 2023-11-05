package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

     @GetMapping
     @RequestMapping(value = "/login")
     public ResponseEntity<String> login() {
          return new ResponseEntity<String>("", HttpStatus.OK);
     }
     @PostMapping("/login")
     public String processLogIn(@RequestParam("username")String username,@RequestParam("password")String password){
          return "welcome"+username;
     }
     @GetMapping
     @RequestMapping(value = "/logout")
     public ResponseEntity<String> logout() {
          return new ResponseEntity<String>("", HttpStatus.OK);
     }
     @PostMapping("/logout")
     public String processLogOut(@RequestParam("username")String username,@RequestParam("password")String password){
          return "good_bye"+username;
     }
     
     
     @PostMapping
     @RequestMapping(value ="/sighup")
     public String Sighup(@RequestBody User request) {
          return "Received" + request;
     }

     @GetMapping
     public String showForgotPasswordForm(){
          return "forgotPassword";
     }
     @PostMapping("/forgotPassword")
     public String processForgotPassword(@RequestParam("email")String email){
          return "forgotPasswordConfirmation";
     }

     @GetMapping("/resetPassword")
     public String showResetPasswordForm(@RequestParam("token")String token){
          return "resetPassword";
     }
     
     @PostMapping("/resetPassword")
     public String resetPassword(@RequestParam("token")String token,@RequestParam("password")String password){
          return "resetPasswordConfirmation";
     }
}


