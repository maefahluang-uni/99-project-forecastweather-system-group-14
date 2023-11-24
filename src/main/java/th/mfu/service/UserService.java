package th.mfu.service;

import th.mfu.DTO.UserDto;
import th.mfu.model.User;

import javax.validation.Valid;
import java.util.List;

public interface UserService {

    //Save method
    void saveUser (@Valid UserDto userDto);

    //Find email
    User findUserByEmail(String email);

    //List data structure as algorithms
    List<UserDto> findAllUsers();
}
