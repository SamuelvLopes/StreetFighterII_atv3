<%-- 
    Document   : CadastroLutadorNovo.jsp
    Created on : 30 de abr. de 2022, 13:02:55
    Author     : samuel
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
        <h1>Cadastro Lutador</h1>
        
            <form class="form" method="post" action="LutadorServeletNovo">
            
            <table class="table">
                <tr>
                    <td>Nome:</td>
                    <td><input type="text" name="nome"> </td>
                </tr>
                
                <tr>
                    <td>Apelido:</td>
                    <td><input type="text" name="apelido"> </td>
                </tr>
                
                <tr>
                    <td>Senha:</td>
                    <td><input type="text" name="senha"> </td>
                </tr>
               
                 <tr>
                    <td>Peso:</td>
                    <td><input type="number" name="peso"> </td>
                </tr>
                
                <tr>
                    <td>Altura:</td>
                    <td><input type="number" name="altura"> </td>
                </tr>
             
                 <tr>
                    <td>destro:</td>
                    <td><input type="radio" name="destro" 
                   <%  Lutador l = new Lutador();
                     if(l.isDestro()){ %>
                     
                   checked <% } %> ><label for="true">Direito</label>
                   <input type="radio" name="destro" value="false" 
                          <% if(!l.isDestro()){ %> checked <% } %> 
                          ><label for="false">Esquerdo</label> 
                    </td>
                    
                 </tr><!-- isso aqui pode dar merda mas vamos tentar-->
                 
                  <tr>
                    <td>Curso:</td>
                    <td><input type="text" name="curso"> </td>
                </tr>
                
                 <tr>
                    <td>Arte Marcial:</td>
                    <td><input type="text" name="artmarcial"> </td>
                </tr>
                
                <tr>
                    <td>Contato de Emergencia:</td>
                    <td><input type="text" name="contatoemergencia"> </td>
                </tr>
                 <tr>
                    <td rowspan="2"> 
                        <input type="submit" class="btn btn-primary" value="cadastrar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
