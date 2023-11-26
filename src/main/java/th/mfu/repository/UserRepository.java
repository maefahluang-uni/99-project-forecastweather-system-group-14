package th.mfu.repository;

import org.springframework.data.repository.CrudRepository;
import th.mfu.model.User;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmail(String email);
    User findByResetPasswordToken(String token);

    boolean existsByEmail(java.lang.String newEmail);
}
