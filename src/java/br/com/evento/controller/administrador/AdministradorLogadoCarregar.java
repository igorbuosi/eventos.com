/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.evento.controller.administrador;

import br.com.evento.dao.AdministradorDAO;
import br.com.evento.dao.EstadoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bruno
 */
@WebServlet(name = "AdministradorLogadoCarregar", urlPatterns = {"/AdministradorLogadoCarregar"})
public class AdministradorLogadoCarregar extends HttpServlet {

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
        response.setContentType("text/html;charset=iso-8859-1");
        try {
            int idAdministrador = Integer.parseInt(request.getParameter("idAdministrador"));

            HttpSession sessao = request.getSession();
            int idUsuario = Integer.parseInt(sessao.getAttribute("idusuario").toString());
            String tipoUsuario = sessao.getAttribute("tipousuario").toString();

            if (idAdministrador == idUsuario) {
                AdministradorDAO oAdministradorDAO = new AdministradorDAO();
                request.setAttribute("administrador", oAdministradorDAO.carregar(idAdministrador));

                EstadoDAO oEstadoDAO = new EstadoDAO();
                request.setAttribute("estados", oEstadoDAO.listar());

                request.getRequestDispatcher("/painel/cadastros/administrador/administradorCadastrar.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/Painel").forward(request, response);
            }
        } catch (Exception ex) {
            System.out.println("Erro no Servlet ao carregar AdministradorLogado " + ex.getMessage());
            ex.printStackTrace();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
