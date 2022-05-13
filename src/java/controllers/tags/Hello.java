/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.tags;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author ALUNO
 */
public class Hello extends SimpleTagSupport{

    private String  atributo;
    private String outroAtributo;
    
    @Override
    public void doTag() throws JspException, IOException {
        super.doTag(); //To change body of generated methods, choose Tools | Templates.
    
        getJspContext().getOut().write("<h3>Hello woolshdg "+
                this.atributo+"</h3> "+this.outroAtributo);
        
    }

    public String getAtributo() {
        return atributo;
    }

    public void setAtributo(String atributo) {
        this.atributo = atributo;
    }

    public String getOutroAtributo() {
        return outroAtributo;
    }

    public void setOutroAtributo(String outroAtributo) {
        this.outroAtributo = outroAtributo;
    }
    
    
    
}
