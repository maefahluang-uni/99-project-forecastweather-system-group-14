package th.mfu.service;

import th.mfu.DTO.UserDTO;
import th.mfu.DTO.LoginDTO;
import th.mfu.response.LoginResponse;

public interface UserService {
    String addUser(UserDTO userDTO);
    LoginResponse loginUser(LoginDTO loginDTO);
}