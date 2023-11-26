package th.mfu.controller;

import com.sun.security.auth.UserPrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import th.mfu.DTO.UserDto;
import th.mfu.exception.EmailAlreadyExistsException;
import th.mfu.model.User;
import th.mfu.service.UserService;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
public class AuthController {
    private final UserService userService;
    private AuthenticationManager authenticationManager = null;

    @Autowired
    public AuthController(UserService userService) {
        this.userService = userService;
        this.authenticationManager = authenticationManager;

    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        // create model object to store form data
        UserDto user = new UserDto();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register/save")
    public String registration(@Valid @ModelAttribute("user") UserDto userDto,
                               BindingResult result,
                               Model model) {
        User existingUser = userService.findUserByEmail(userDto.getEmail());

        if (existingUser != null && !existingUser.getEmail().isEmpty()) {
            result.rejectValue("email", null,
                    "There is already an account registered with the same email");
        }

        if (result.hasErrors()) {
            model.addAttribute("user", userDto);
            return "register";
        }

        userService.saveUser(userDto);
        return "redirect:/login";
    }

    //Redirect path login
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    //Accout path
// Account path
    @GetMapping("/account")
    public String accountSettingsPage(Principal principal, Model model) {
        User currentUser = userService.findByEmail(principal.getName());
        List<UserDto> users = userService.findAllUsers();
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("users", users);
        return "account"; // Account settings JSP page
    }

    @PostMapping("/deleteAccount")
    public String deleteAccount(Model model, Principal principal) {
        // Delete the account in the database using a service method
        userService.deleteAccount(principal.getName());
        // Redirect to the login page after account deletion
        return "redirect:/login";
    }

    // Update Method
    @PostMapping("/updateUsername")
    public String updateUsername(@RequestParam String newEmail, Model model, Principal principal) {
        // Update the username in the database using a service method
        String currentUsername = principal.getName();
        model.addAttribute("currentUsername", currentUsername);
        userService.updateEmail(principal.getName(), newEmail);
        return "redirect:/account";
    }

    @PostMapping("/updateUsernameWithEmailCheck")
    public String updateUsernameWithEmailCheck(@RequestParam("newEmail") String newEmail, Model model) {
        // Get the current user's email (you need to implement this logic)
        String currentUserEmail = getCurrentUserEmail();

        try {
            userService.updateEmail(currentUserEmail, newEmail);
        } catch (EmailAlreadyExistsException e) {
            // If the new email already exists, add an error message to the model
            model.addAttribute("emailError", "Email address already in use.");
            // Redirect back to the account settings page
            return "redirect:/user/accountSettings";
        }
        return "redirect:/account";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam String newPassword,Model model, Principal principal) {
        // Update the password in the database using a service method
        userService.updatePassword(principal.getName(), newPassword);
        return "redirect:/account";
    }

    private String getCurrentUserEmail() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.getPrincipal() != null) {
            if (authentication.getPrincipal() instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) authentication.getPrincipal();
                return userDetails.getUsername();  // Assuming getUsername represents the email
            }
        }

        return null;  // Add a return statement or handle it appropriately
    }

}


