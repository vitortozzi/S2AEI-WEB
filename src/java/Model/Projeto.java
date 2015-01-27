/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Vítor
 */
public class Projeto {
    
    private int id;
    private String titulo;
    private String descricao;
    private Aluno lider;
    private String dataCriacao;
    private String ultimaModificacao;
    private String Status;
    private ArrayList<Aluno> membros;
    private String area;
    private Professor orientador;
    private ArrayList<String> perguntas;
    private ArrayList<String> respostas;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Aluno getLider() {
        return lider;
    }

    public void setLider(Aluno lider) {
        this.lider = lider;
    }

    public String getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(String dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public String getUltimaModificacao() {
        return ultimaModificacao;
    }

    public void setUltimaModificacao(String ultimaModificacao) {
        this.ultimaModificacao = ultimaModificacao;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public ArrayList<Aluno> getMembros() {
        return membros;
    }

    public void setMembros(ArrayList<Aluno> membros) {
        this.membros = membros;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Professor getOrientador() {
        return orientador;
    }

    public void setOrientador(Professor orientador) {
        this.orientador = orientador;
    }

    public ArrayList<String> getPerguntas() {
        return perguntas;
    }

    public void setPerguntas(ArrayList<String> perguntas) {
        this.perguntas = perguntas;
    }

    public ArrayList<String> getRespostas() {
        return respostas;
    }

    public void setRespostas(ArrayList<String> respostas) {
        this.respostas = respostas;
    }
}
