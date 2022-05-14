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
public class CarregaLista extends SimpleTagSupport
{
    private String classe;
    private String var;
    
    @Override
    public void doTag() throws JspException, IOException{
        
        //getJspContext().getOut().write("<h1>teste</h1>");
        if(classe.equals("Lutador")){
            
            List<Lutador> listarLutadores = Repositoriolutador.getCurrentInstance().lerTudo();
            enviarLista(listarLutadores,listarLutadores.getClass());      
            
        }else if(classe.equals("Local")){
            
            List<Local> listaLocais = RepositorioLocalMemo.getCurrentInstance().lerTudo();
            enviarLista(listaLocais,listaLocais.getClass());
        
        }
    
    
    }
    
    public void enviarLista(Object objeto,Class classe){
        getJspContext().setAttribute(var,classe.cast(objeto),PageContext.PAGE_SCOPE);
    }
    
    public String getClasse(){
        return classe;
    }
    public void setClasse(String classe){
        this.classe = classe;
    }
    public String getVar(){
        return var;
    }
    public void setVar(String var){
        this.var = var;
    }
    
    
    
    
}
