
package beans;

import java.io.Serializable;

public class Login implements Serializable {
    private String login;
    private String senha;
    
    public Login(){ 
    }  
    public String getLogin(){
        return this.login;
    }
    public void setLogin(String login){
        this.login = login;
    }    
    public String getSenha(){
        return this.senha;
    }
    public void setSenha(String senha){
        this.senha = senha;
    }
}
