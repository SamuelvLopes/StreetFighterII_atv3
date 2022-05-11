/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import negocios.Lutador;
import repositorio.Repositoriolutador;
import java.io.IOException;
import java.util.List;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author samuel
 */
@WebServlet(name = "LutadorServeletNovo", urlPatterns = {"/LutadorServeletNovo"})
public class LutadorServeletNovo extends HttpServlet {
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
        
        String operacao = request.getParameter("op");
        
        if(operacao != null && operacao.equals("update")){
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            Lutador l = Repositoriolutador.getCurrentInstance().ler(id);
            
            request.setAttribute("local", l);
            
            request.getRequestDispatcher("/AtualizarLutadores.jsp").forward(request, response);
            
            return;
            
        }
        
        if(operacao!=null && operacao.equals("delete")){
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            Repositoriolutador.getCurrentInstance().remover(id);
            
        }
        
        List<Lutador> lutadores = Repositoriolutador.getCurrentInstance().lerTudo();
        
        request.setAttribute("lutadores", lutadores);
        
        request.getRequestDispatcher("/LutadoresNovo.jsp")
                .forward(request, response);
        
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
        
        String apelido = request.getParameter("apelido");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        float peso = Float.parseFloat(request.getParameter("peso"));
        float  altura = Float.parseFloat(request.getParameter("altura"));
        boolean destro = Boolean.parseBoolean(request.getParameter("destro"));
        String curso = request.getParameter("curso");
        String artmarcial = request.getParameter("artmarcial");
        String contatoemergencia = request.getParameter("contatoemergencia");
        
        Lutador l = new Lutador();
        
        l.setApelido(apelido);
        l.setNome(nome);
        l.setSenha(senha);
        l.setDestro(destro);
        l.setPeso(peso);
        l.setAltura(altura);
        l.setCurso(curso);
        l.setArtMarcial(artmarcial);
        l.setContatoEmergencia(contatoemergencia);

        
        String operacao = request.getParameter("op");
        
        if(operacao != null && operacao.equals("update")){
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            l.setId(id);
            
            Repositoriolutador.getCurrentInstance().alterar(l);
            
            response.sendRedirect("LutadorServeletNovo?msg=Local%20"+nome+"%20alterado%20com%20sucesso!");
            
            return;
            
        }
        
        Repositoriolutador.getCurrentInstance().inserir(l);
        
        request.setAttribute("msg", "Lutador "+nome+" cadastrado com sucesso!");
        
        response.sendRedirect("LutadorServeletNovo?msg=Lutador%20"+nome+"%20cadastrado%20com%20sucesso!");
        
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
