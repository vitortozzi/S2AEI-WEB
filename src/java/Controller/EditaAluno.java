/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Aluno;
import Model.Database.AlunoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vítor
 */
@WebServlet(name = "EditaAluno", urlPatterns = {"/editAluno"})
public class EditaAluno extends HttpServlet {
    
    Aluno a;
    AlunoDAO dao;
    
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
            out.println("<title>Servlet EditaAluno</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditaAluno at " + request.getContextPath() + "</h1>");
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
        
        a = new Aluno();
        
        
        request.setCharacterEncoding("UTF-8");
        a.setNome(request.getParameter("inputNome"));
        a.setCurso(request.getParameter("inputCurso"));
        a.setPeriodo(Integer.valueOf(request.getParameter("inputPeriodo")));
        a.setStatus(request.getParameter("inputStatus"));
        a.setEmail(request.getParameter("inputEmail"));
        
        dao = new AlunoDAO();
        boolean ok = dao.updateAluno(a);
        if (ok) {
            request.setAttribute("sucesso", "O aluno foi editado com sucesso!");
            RequestDispatcher view = request.getRequestDispatcher("sucesso.jsp");
            view.forward(request, response);
        } else {
            request.setAttribute("aviso", "Houve um erro ao editar o aluno");
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
