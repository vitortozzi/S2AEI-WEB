/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Negocio.EnProjeto;
import Model.Tabelas.Projeto;
import Utils.XMLParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jdom2.JDOMException;

/**
 *
 * @author Vítor
 */
@WebServlet(name = "VisualizaProjeto", urlPatterns = {"/visualizaProjeto"})
public class VisualizaProjeto extends HttpServlet {

    EnProjeto enProjeto;
    ArrayList<Projeto> projetos;
    Projeto p;

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
            out.println("<title>Servlet VisualizaProjeto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VisualizaProjeto at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();

        projetos = new ArrayList<>();
        enProjeto = new EnProjeto();

        String papel = (String) session.getAttribute("papel");
        String nome = (String) session.getAttribute("nome");

        projetos = enProjeto.getProjetoPorEntidade(papel, nome);

        request.setAttribute("projetos", projetos);
        RequestDispatcher view = request.getRequestDispatcher("visualizarProjetos.jsp");
        view.forward(request, response);

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

        p = new Projeto();
        enProjeto = new EnProjeto();

        ArrayList<String> titulos = new ArrayList<>();
        ArrayList<String> questoes = new ArrayList<>();

        int id = Integer.parseInt(request.getParameter("param"));
        p = enProjeto.getProjetoPorID(id);
        p.setId(id);
        p.setRespostas(enProjeto.getRespostas(p.getId()));

         if (p.getRespostas().size() > 0) {
            XMLParser xml = new XMLParser();
            try {
                titulos = xml.getTitulos();
                questoes = xml.getQuestoes();
            } catch (JDOMException ex) {
                Logger.getLogger(PreencheProjeto.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("dadosProjeto", p);
            request.setAttribute("listaTitulos", titulos);
            request.setAttribute("listaQuestoes", questoes);
            RequestDispatcher view = request.getRequestDispatcher("projetoDetalhes.jsp");
            view.forward(request, response);
        } else {
            request.setAttribute("aviso", "Não há projetos aos quais você tem relação para exibir.");
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
