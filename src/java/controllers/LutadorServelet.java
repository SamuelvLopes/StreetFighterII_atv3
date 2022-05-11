/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import negocios.Lutador;
import repositorio.Repositoriolutador;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author samuel
 */
@WebServlet(name = "LutadorServelet", urlPatterns = {"/LutadorServelet"})
public class LutadorServelet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        
        if(id != null){
            
            int i = Integer.parseInt(id);
            
            Lutador l = Repositoriolutador.getCurrentInstance().ler(i);
          
            request.setAttribute("l", l);
           
            
        }
        
        List<Lutador> lutadores = Repositoriolutador.getCurrentInstance().lerTudo();
        
        request.setAttribute("ls", lutadores);
        
        getServletContext()
                .getRequestDispatcher("/lutadores.jsp")
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
        
       
        
        
        String atualiza = request.getParameter("altera");
        
        if(atualiza == null){
            Repositoriolutador.getCurrentInstance().inserir(l);
        }else{
            
            int id  = Integer.parseInt(request.getParameter("id"));
            l.setId(id);
            Repositoriolutador.getCurrentInstance().alterar(l);
        }
        
        HttpSession session = request.getSession();
        
        session.setAttribute("msg", "Local Cadastrado com sucesso");
        
        response.sendRedirect("LutadorServelet");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(request, resp); //To change body of generated methods, choose Tools | Templates.
    
        int id = Integer.parseInt(request.getParameter("id"));
        
        Repositoriolutador.getCurrentInstance().remover(id);
        
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPut(request, response); //To change body of generated methods, choose Tools | Templates.
        
        
    
    }
    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    } // </editor-fold>

}

    
    
    
