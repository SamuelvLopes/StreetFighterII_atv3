<%-- 
    Document   : AtualizarLutadores
    Created on : 30 de abr. de 2022, 14:48:41
    Author     : danylosilva
--%>

<%@page import="negocios.Lutador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Atualizar Lutadoes</h1>
        <% 
            Lutador Lutador = (Lutador)request.getAttribute("Lutador");
        %>
       
        <form class="form" method="post" action="LutadorServeletNovo">
       <input type="hidden" name="id" value="<%= Lutador.getId() %>"/>
         <input type="hidden" name="op" value="update"/>
            
         <table class="form">
             
             <tr>
                  <td>Nome:</td>
                    <td>
                        <input type="text" name="nome" value="<%= Lutador.getNome() %>" /> 
                    </td>
                </tr>
             
             
              <tr>
                  <td>Apelidio:</td>
                    <td>
                        <input type="text" name="apelido" value="<%= Lutador.getApelido()%>" /> 
                    </td>
                </tr>
             
             <tr>
                  <td>senha:</td>
                    <td>
                        <input type="text" name="senha" value="<%= Lutador.getSenha() %>" /> 
                    </td>
                </tr>
             <tr>
                  <td>Peso:</td>
                    <td>
                        <input type="text" name="peso" value="<%= Lutador.getPeso() %>" /> 
                    </td>
                </tr>
             
                <tr>
                  <td>Altura:</td>
                    <td>
                        <input type="number" name="altura" value="<%= Lutador.getAltura() %>" /> 
                    </td>
                </tr>
                
                <tr>
                  <td>Destro:</td>
                    <td>
                        <input type="text" name="nome" 
                         <%  Lutador l = new Lutador();
                     if(l.isDestro()){ %>   
                   checked <% } %> ><label for="true">Direito</label>
                   <input type="radio" name="destro" value="false" 
                          <% if(!l.isDestro()){ %> checked <% } %> 
                          ><label for="false">Esquerdo</label> 
                   
                               value="<%= Lutador.isDestro() %>" /> 
                    </td>
                </tr>
                
                
                <tr>
                  <td>Curso:</td>
                    <td>
                        <input type="text" name="curso" value="<%= Lutador.getCurso() %>" /> 
                    </td>
                </tr><!-- comment -->
                
                
                <tr>
                  <td>Arte Marcial:</td>
                    <td>
                        <input type="text" name="artmarcial" value="<%= Lutador.getArtMarcial() %>" /> 
                    </td>
                </tr>
                
                <tr>
                  <td>Contato de Emergencia:</td>
                    <td>
                        <input type="text" name="contatoemergencia" value="<%= Lutador.getContatoEmergencia() %>" /> 
                    </td>
                </tr><!-- comment -->
                
               
               <tr>
                    <td rowspan="2"> 
                        <input type="submit" class="btn btn-primary" value="atualizar"/>
                    </td>
                </tr> 
         </table>
            
       
        </form>
    </body>
</html>
