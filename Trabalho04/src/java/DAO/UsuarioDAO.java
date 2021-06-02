package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Usuario;

public class UsuarioDAO {

    private Connection con = null;
    
    public UsuarioDAO() {
        con = ConnectionFactory.getConnection();
    }
    
    public boolean adicionarUsuario(Usuario usuario){
        
        String sql = "INSERT INTO tb_usuario (login_Usuario,senha_Usuario,nome_Usuario) VALUES (?, ?, ?)";
        
        PreparedStatement stmt = null;
        try{
            //Inserindo os dados
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario.getLogin());
            stmt.setString(2, usuario.getSenha());
            stmt.setString(3, usuario.getNome());
            //Executando a query
            stmt.executeUpdate();            
            return true;
        }catch(SQLException ex){
            System.err.println("Erro na inserção: " + ex);
            return false;
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void listarUsuario(ArrayList<Usuario> usuario){
        
        String sql = "SELECT * FROM tb_usuario";
        
        PreparedStatement stmt = null;
        try{
            //Inserindo os dados
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            //Percorrendo os dados no banco e preenchendo a lista.
            while(rs.next()){                
                Usuario user = new Usuario(Integer.parseInt(rs.getString("id_Usuario")),rs.getString("login_Usuario"),rs.getString("nome_Usuario"),rs.getString("senha_Usuario"));
                usuario.add(user);
            }
                        
        }catch(SQLException ex){
            System.err.println("Erro na inserção: " + ex);

        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public boolean validarUsuario(String login, String senha){
        
        String sql = "SELECT * FROM tb_usuario where login_Usuario=? and senha_Usuario=?";
        boolean resultado = false;
        PreparedStatement stmt = null;
        try{
            //Inserindo os dados
            stmt = con.prepareStatement(sql);
            stmt.setString(1, login);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();
            
            //Verificando se existe algum valor
            resultado = rs.next() ? true: false;
            return resultado;
        }catch(SQLException ex){
            System.err.println("Erro na inserção: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
            return resultado;
        }
    }

    
}
