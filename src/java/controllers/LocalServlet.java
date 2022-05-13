/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import negocios.Local;
import repositorio.RepositorioLocalMemo;
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
 * @author ALUNO
 */
@WebServlet(name = "LocalServlet", urlPatterns = {"/LocalServlet"})
public class LocalServlet extends HttpServlet {

    

    
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
        
        String id = request.getParameter("id");
        
        if(id != null){
            
            int i = Integer.parseInt(id);
            
            Local l = RepositorioLocalMemo.
                    getCurrentInstance().ler(i);
          
            request.setAttribute("l", l);
           
            
        }
        
        List<Local> locais = RepositorioLocalMemo.
                getCurrentInstance().lerTudo();
        
        request.setAttribute("ls", locais);
        
        getServletContext()
                .getRequestDispatcher("/locais.jsp")
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
        String endereco = request.getParameter("endereco");
        int capacidade = Integer.parseInt(request.getParameter("capacidade"));
        
        Local l = new Local();
        
        
        l.setApelido(apelido);
        l.setEndereco(endereco);
        l.setCapacidade(capacidade);
        
        
        String atualiza = request.getParameter("altera");
        
        if(atualiza == null){
            RepositorioLocalMemo.getCurrentInstance().inserir(l);
        }else{
            
            int id  = Integer.parseInt(request.getParameter("id"));
            l.setId(id);
            RepositorioLocalMemo.getCurrentInstance().alterar(l);
        }
        
        HttpSession session = request.getSession();
        
        session.setAttribute("msg", "Local Cadastrado com sucesso");
        
        response.sendRedirect("LocalServlet");
        
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
        
        RepositorioLocalMemo.getCurrentInstance().remover(id);;
        
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
