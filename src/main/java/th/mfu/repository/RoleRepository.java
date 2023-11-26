package th.mfu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import th.mfu.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);

    @Modifying
    @Query("DELETE FROM User u WHERE u.id = :userId")
    void deleteUserRoles(@Param("userId") Long userId);

}
