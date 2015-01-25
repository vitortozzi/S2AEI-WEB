/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Database;

import Model.Aluno;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Vítor
 */
public class AlunoDAO {
    
    Aluno a;
    
     private Connection connection;
    private ResultSet rs;
    private PreparedStatement pstm;

    public AlunoDAO() {
        connection = new ConnectionFactory().getConnection();
    }
    
    public Aluno getAluno(String email){
        
//        String sql = "SELECT email, nome, "
   
        return a;
    }
    
    public void addAluno(Aluno a){
  
        new UsuarioDAO().addUsuario(a);
        
        String sql = "INSERT INTO aluno (email, matricula, curso, periodo)"
                + " VALUES (?, ?, ?, ?)";
        
        try{
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, a.getEmail());
            pstm.setString(2, a.getMatricula());
            pstm.setString(3, a.getCurso());
            pstm.setInt(4, a.getPeriodo());
            
            pstm.execute();
            pstm.close();
            
            
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
    }
    
    public void editAluno(Aluno a){
        
    }
    
    public void deleteAluno(Aluno a){
        
    }
}
