package th.mfu.service;

import th.mfu.dto.UserDto;
import th.mfu.model.User;

import java.util.List;

public interface UserService {

    //Save method
    void saveUser (UserDto userDto);

    //Find email
    User findUserByEmail(String email);

    //List data structure as algorithms
    List<UserDto> findAllUsers();
}
