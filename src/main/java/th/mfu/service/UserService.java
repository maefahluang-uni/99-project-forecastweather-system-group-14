package th.mfu.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.mfu.Config.UserRepository;
import th.mfu.model.User;

@Service
public class UserService {
        @Autowired
        private UserRepository userRepository;

        public User findByUsername(String username) {
            return userRepository.findByUsername(username);
        }
        public User save(User user) {
            return userRepository.save(user);
        }
}
