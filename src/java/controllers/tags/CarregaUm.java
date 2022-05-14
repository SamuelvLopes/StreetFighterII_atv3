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
public class CarregaUm extends SimpleTagSupport
{
    private String classe;
    private String var;
    private int id;
    
    @Override
    public void doTag() throws JspException, IOException{
        
        //getJspContext().getOut().write("<h1>teste</h1>");
        if(classe.equals("Lutador")){
            
            Lutador lutador = Repositoriolutador.getCurrentInstance().ler(id);
            enviarLista(lutador);      
            
        }else if(classe.equals("Local")){
            
            Local local = RepositorioLocalMemo.getCurrentInstance().ler(id);
            enviarLista(local);
        
        }
    
    
    }
    
    public void enviarLista(Object objeto) throws IOException{
        if(objeto==null){
            getJspContext().getOut().write("<h1>Não existe</h1>");
            getJspContext().setAttribute(var,null,PageContext.PAGE_SCOPE);
        }else{
        getJspContext().setAttribute(var,objeto,PageContext.PAGE_SCOPE);
        }
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
    
}
