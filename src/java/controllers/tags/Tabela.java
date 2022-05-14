/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.tags;
import java.io.IOException;
import static java.lang.reflect.Array.get;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import negocios.Lutador;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import negocios.Local;
import repositorio.RepositorioLocalMemo;
import repositorio.Repositoriolutador;

/**
 *
 * @author samue
 */
public class Tabela extends SimpleTagSupport
{
    private String classe;
    
    @Override
    public void doTag() throws JspException, IOException{
         getJspContext().getOut().write(" <table class=\"table\">"); 
        if(classe.equals("Lutador")){
            
            List<Lutador> listarLutadores = Repositoriolutador.getCurrentInstance().lerTudo();
             getJspContext().getOut().write(
"            <tbody><tr> <th>Nome</th> <th>Apelidio</th> <th>Senha</th> <th>Peso</th> <th>Altura</th> <th>Destro</th> <th>Curso</th> <th>Arte Marcial</th> <th>Contato de Emergencia</th> <th>Operações</th></tr>\n" +
"\n" +
"            \n"); 
             
             for(Lutador lAux:listarLutadores){
             
                  getJspContext().getOut().write(""
                          + " <tr>\n" +
"                <td>"+lAux.getNome()+"</td>\n" +
"                <td>"+ lAux.getApelido()+"</td>\n" +
"                <td>"+ lAux.getSenha()+"</td>\n" +
"                <td>"+ lAux.getPeso()+"</td>\n" +
"                <td>"+ lAux.getAltura()+"</td>\n" +
"                <td>"+ lAux.isDestro()+"</td>\n" +
"                <td>"+ lAux.getCurso()+"</td>\n" +
"                <td>"+ lAux.getArtMarcial()+"</td>\n" +
"                <td>"+ lAux.getContatoEmergencia()+"</td>\n" +
"\n" +
"                <td><a href=\"LutadorServelet?id="+lAux.getId()+"\">Visualizar</a>\n" +
"                    <a href=\"LutadorServelet?id=<"+ lAux.getId()+"&altera=\">Alterar</a>\n" +
"                    <a href=\"#\" onclick=\"deletar("+ lAux.getId()+")\">deletar</a>\n" +
"                </td>\n" +
"            </tr>"
                          + "");
                 
                 
             }
             
             
             
          
            
        }else if(classe.equals("Local")){
            
            List<Local> listaLocais = RepositorioLocalMemo.getCurrentInstance().lerTudo();
           getJspContext().getOut().write(" <tr><th>Apelidio</th><th>Endereço</th><th>Capacidade</th><th>Operações</th></tr>");
             for (Local local : listaLocais) {
              getJspContext().getOut().write(
                      
"                <tr><td>"+local.getApelido()+"</td>\n" +
"                <td>"+local.getEndereco()+"</td>\n" +
"                <td>"+local.getCapacidade()+"</td>\n" +
"                <td><a href=\"LocalServlet?id="+local.getId()+"\">Visualizar</a>\n" +
"                    <a href=\"LocalServlet?id="+local.getId()+"&altera=\">Alterar</a>\n" +
"                    <a href=\"#\" onclick=\"deletar("+ local.getId()+")\">deletar</a>\n" +
"                </td><tr>");
             
             }
            
            getJspContext().getOut().write(" </table>");
        
        }
    
    
    }
    
    
    
    
   
    
    public String getClasse(){
        return classe;
    }
    public void setClasse(String classe){
        this.classe = classe;
    }

    
    
    
    
}
