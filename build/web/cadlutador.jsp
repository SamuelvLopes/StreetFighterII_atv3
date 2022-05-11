<%-- 
    Document   : lutadores
    Created on : 30 de abr. de 2022, 14:41:02
    Author     : danylosilva
--%>
<%@page import="repositorio.Repositoriolutador"%>
<%@page import="negocios.Lutador"%>
<%@page import="java.util.List"%>
<%
    String stringId = request.getParameter("id");
    
    
    Lutador lo = null;
    
    if(stringId != null){
        
        int id = Integer.parseInt(stringId);
            
        lo = Repositoriolutador.getCurrentInstance().ler(id);
    
        session.removeAttribute("lo");
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/bootstrap.min.css"/>

        <title>Cadastro de lutador </title>
    </head>
    <body>
        <h1>Cadastro de lutador </h1>
        
        <form class="form" method="post"  action="LutadorServlet">
            
            <%= (lo!=null)?"<input type='hidden' name='altera' value='alguma coisa'/>":""%> 
            <%= (lo!=null)?"<input type='hidden' name='id' value='"+lo.getId()+"'/>":""%>
            
            <table class="table">
                <tr>
                    <td>
                        Apelidio: 
                    </td>
                    <td>
                        <input type="text" name="apelido" <% if(lo!=null){ out.println("value=\""+lo.getApelido()+"\"");} %> /> 
                    </td>
                </tr>
                
            
                <tr>
                    <td>
                        Nome: 
                    </td>
                    <td>
                        <input type="text" name="nome" <% if(lo!=null){ out.println("value=\""+lo.getNome()+"\"");} %> /> 
                    </td>
                </tr>
                
      
                <tr>
                    <td>
                        Senha: 
                    </td>
                    <td>
                        <input type="text" name="senha" <% if(lo!=null){ out.println("value=\""+lo.getSenha()+"\"");} %> /> 
                    </td>
                </tr><!-- comment -->
                
                
    
                <tr>
                    <td>
                        Peso: 
                    </td>
                    <td>
                        <input type="number" name="peso" <% if(lo!=null){ out.println("value=\""+lo.getPeso()+"\"");} %> /> 
                    </td>
                </tr>
                
                
         
                <tr>
                    <td>
                        Altura: 
                    </td>
                    <td>
                        <input type="number" name="altura" <% if(lo!=null){ out.println("value=\""+lo.getAltura()+"\"");} %> /> 
                    </td>
                </tr><!-- comment -->
                
            
                <tr>
                    <td>
                        Destro: 
                    </td>
                    <td>
                        <input type="radio" name="destro" <% if(lo!=null){ out.println("value=\""+lo.isDestro()+"\"");} %> ><label for="true">Direito</label>
                   <input type="radio" name="destro" value="false" ><label for="false">Esquerdo</label>  /> 
                    </td>
                </tr>
                
                
                
             
                <tr>
                    <td>
                  Curso: 
                    </td>
                    <td>
                        <input type="text" name="curso" <% if(lo!=null){ out.println("value=\""+lo.getCurso()+"\"");} %> /> 
                    </td>
                </tr>
                
                <tr>
                    <td>
                  Arte Marcial: 
                    </td>
                    <td>
                        <input type="text" name="artmarcial" <% if(lo!=null){ out.println("value=\""+lo.getArtMarcial()+"\"");} %> /> 
                    </td>
                </tr>
                
                <tr>
                    <td>
                  Contato de Emergencia: 
                    </td>
                    <td>
                        <input type="text" name="contatoemergencia" <% if(lo!=null){ out.println("value=\""+lo.getContatoEmergencia()+"\"");} %> /> 
                    </td>
                </tr>
                
                
                
                
                
               
               
                
                <tr>
                    <td rowspan="2"> 
                        <input type="submit" class="btn btn-primary" value= <%= (lo!=null)? "Alterar": "Cadastrar"%> />
                    </td>
                </tr>
            </table> 
        </form>
        
    </body>
</html>
