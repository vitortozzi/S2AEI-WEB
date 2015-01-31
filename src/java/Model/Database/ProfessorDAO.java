/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Database;

import Model.Professor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Vítor
 */
public class ProfessorDAO {

    private Connection connection;
    private ResultSet rs;
    private PreparedStatement pstm;

    Professor professor;
    ArrayList<Professor> professores;

    public ProfessorDAO() {
        connection = new ConnectionFactory().getConnection();
    }

    public ArrayList<Professor> getProfessores() {

        String sql = "SELECT p.email, p.disciplina_principal, p.departamento, u.nome, u.senha, u.status FROM professor p, usuario u"
                + " WHERE p.email = u.email";

        professores = new ArrayList<>();
        professor = new Professor();

        try {
            pstm = connection.prepareStatement(sql);
            pstm.execute();
            rs = pstm.getResultSet();

            while (rs.next()) {
                professor.setEmail(rs.getString(1));
                professor.setDisciplinaPrincipal(rs.getString(2));
                professor.setDepartamento(rs.getString(3));
                professor.setNome(rs.getString(4));
                professor.setSenha(rs.getString(5));
                professor.setStatus(rs.getString(6));
                professores.add(professor);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return professores;
    }

}
