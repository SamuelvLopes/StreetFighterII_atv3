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
        
        if(classe.equals("Lutador")){
            
            List<Lutador> listarLutadores = Repositoriolutador.getCurrentInstance().lerTudo();
            
            
            
        }else if(classe.equals("Local")){
            
        //    List<Local> listaLocais = RepositorioLocalMemo.getCurrentInstance().Tabela();
           
        
        }
    
    
    }
    
   
    
    public String getClasse(){
        return classe;
    }
    public void setClasse(String classe){
        this.classe = classe;
    }

    
    
    
    
}
