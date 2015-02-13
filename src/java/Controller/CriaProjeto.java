/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Model.Negocio.EnAluno;
import Model.Negocio.EnProfessor;
import Model.Negocio.EnProjeto;

import Model.Tabelas.Aluno;
import Model.Tabelas.Professor;
import Model.Tabelas.Projeto;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vítor
 */
@WebServlet(name = "CriaProjeto", urlPatterns = {"/criaProjeto"})
public class CriaProjeto extends HttpServlet {

    Projeto projeto;
    EnProjeto enProjeto;
    EnAluno enAluno;
    EnProfessor enProfessor;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CriaProjeto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CriaProjeto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        enProjeto = new EnProjeto();
        enAluno = new EnAluno();
        enProfessor = new EnProfessor();
        
        HttpSession session = request.getSession();

        if (!(enProjeto.jaLideraProjeto((String) session.getAttribute("nome")))) {           
            
            ArrayList<Aluno> alunos = new ArrayList<>();
            alunos = enAluno.getAlunosAtivos();

            ArrayList<Professor> professores = new ArrayList<>();
            professores = enProfessor.getProfessoresAtivos();

            request.setAttribute("professores", professores);
            request.setAttribute("alunosAtivos", alunos);
            RequestDispatcher view = request.getRequestDispatcher("criarProjeto.jsp");
            view.forward(request, response);
            
        } else {
            request.setAttribute("aviso", "Você já lidera um projeto ativo.");
            RequestDispatcher view = request.getRequestDispatcher("aviso.jsp");
            view.forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        projeto = new Projeto();

        HttpSession session = request.getSession();

        request.setCharacterEncoding("UTF-8");
        projeto.setTitulo(request.getParameter("inputTitulo"));
        projeto.setArea(request.getParameter("inputArea"));
        projeto.setDescricao(request.getParameter("inputDesc"));
        projeto.setLider((String) session.getAttribute("nome"));
        projeto.setOrientador(request.getParameter("inputOrientador"));
        projeto.setMembros(request.getParameterValues("participantes"));

        enProjeto = new EnProjeto();
        if (enProjeto.criaProjeto(projeto)) {
            request.setAttribute("sucesso", "O projeto foi criado com sucesso!");
            RequestDispatcher view = request.getRequestDispatcher("sucesso.jsp");
            view.forward(request, response);
        } else {
            request.setAttribute("aviso", "Houve um erro ao criar o projeto");
            RequestDispatcher view = request.getRequestDispatcher("aviso.jsp");
            view.forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
