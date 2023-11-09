package th.mfu.model;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Entity;
import th.mfu.model.User;

@Entity
public class User {
     @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
     private Long id;
     private String username;
     private String password;
     private String email;

     public Long getId() {
          return id;
     }
     public void setId(Long id){
          this.id = id;
     }
     public String getUser() {
          return username;
     }
     public void setUser(String username){
          this.username = username;
     }
     public String getPassword() {
          return password;
     }
     public void setPassword(String password){
          this.password = password;
     }
     public String getEmail() {
          return email;
     }
     public void setEmail(String email){
          this.email = email;
     }
}
