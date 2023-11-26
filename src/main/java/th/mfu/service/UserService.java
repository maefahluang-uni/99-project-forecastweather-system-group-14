package th.mfu.service;

import org.springframework.security.core.userdetails.UserDetails;
import th.mfu.DTO.UserDto;
import th.mfu.model.User;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

public interface UserService {

    //Save method
    void saveUser (@Valid UserDto userDto);

    //Find email
    User findUserByEmail(String email);

    //List data structure as algorithms
    List<UserDto> findAllUsers();

    User findByEmail(String name);

    void deleteAccount(String name);

    void updateEmail(String name, String newEmail);

    void updatePassword(String name, String newPassword);
}
