 package th.mfu.model;

public class User {
    private String id;
    private String usernames;
    private String email;
    private String password;

    public User(){
}
    public String getId(){
    return id;
}
    public void setId(String id){
    this.id = id;
}
    public String getUsername(){
    return usernames;
}
    public void setUsername(String usernames){
    this.usernames = usernames;
}
    public String getEmail(){
    return email;
}
    public void setEmail(String email){
    this.email = email;
}
    public String getPassword() {
    return password;
}
    public void setPassword(String password){
    this.password = password;
    }
}