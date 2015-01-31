/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Database;

import Model.Projeto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Vítor
 */
public class ProjetoDAO {

    private Connection connection;
    private ResultSet rs;
    private PreparedStatement pstm;
    Projeto p;

    public ProjetoDAO() {
        connection = new ConnectionFactory().getConnection();
    }

    public boolean insertProjeto(Projeto projeto) {

        String sql = "INSERT INTO projeto (titulo, descricao, data_criacao, ultima_modificacao, status, area, email_orientador"
                + ", email_lider) VALUES (?, ?, curdate(), curdate(), 'Novo', ?, (SELECT email FROM usuario WHERE usuario.nome = (?)), "
                + "(SELECT email FROM usuario WHERE usuario.nome = (?)))";

        try {
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, projeto.getTitulo());
            pstm.setString(2, projeto.getDescricao());
            pstm.setString(3, projeto.getArea());
            pstm.setString(4, projeto.getOrientador());
            pstm.setString(5, projeto.getLider());

            pstm.execute();
            pstm.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        addParticipantes(projeto);

        return true;
    }

    public boolean addParticipantes(Projeto projeto) {

        String sql = "INSERT INTO participa (id_projeto, email_aluno) VALUES ((SELECT id FROM projeto WHERE email_lider = "
                + " (SELECT email FROM usuario WHERE usuario.nome = (?))), (SELECT email FROM usuario WHERE usuario.nome = (?))) ";

        try {
            pstm = connection.prepareStatement(sql);
            for (String s : projeto.getMembros()) {
                pstm.setString(1, projeto.getLider());
                pstm.setString(2, s);
                pstm.execute();

            }
            pstm.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return true;
    }
    
    public ArrayList getProjetosParticipante(String nome){
        
        ArrayList<Projeto> projetos = new ArrayList<>();
        
        
        String sql = "SELECT p.id, p.titulo, lider.nome, professor.nome, p.data_criacao, p.ultima_modificacao, "
                + "p.status FROM projeto p, usuario lider, usuario professor WHERE p.id in (SELECT id_projeto FROM"
                + " participa WHERE email_aluno in (SELECT email FROM usuario WHERE nome = (?))) and lider.email = p.email_lider and "
                + "p.email_orientador = professor.email";
        
        try{
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, nome);
            
            pstm.execute();
            
            rs = pstm.getResultSet();
            while(rs.next()){
                p = new Projeto();
                p.setId(rs.getInt(1));
                p.setTitulo(rs.getString(2));
                p.setLider(rs.getString(3));
                p.setOrientador(rs.getString(4));
                p.setDataCriacao(rs.getString(5));
                p.setUltimaModificacao(rs.getString(6));
                p.setStatus(rs.getString(7));
                projetos.add(p);
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return projetos;
    }
}
