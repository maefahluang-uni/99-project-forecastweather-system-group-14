package th.mfu.Config;

import org.springframework.data.jpa.repository.JpaRepository;

import th.mfu.model.User;

public interface UserRepository extends JpaRepository <User, Long>{
    User findByUsername(String username);

}
