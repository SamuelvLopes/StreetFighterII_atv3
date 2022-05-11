<%-- 
    Document   : LutadoresNovo
    Created on : 30 de abr. de 2022, 14:53:06
    Author     : samuel
--%>
<%@page import="repositorio.Repositoriolutador"%>
<%@page import="negocios.Lutador"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lutadores Cadastrados</h1>
        <%
            String mensagem = request.getParameter("msg");
            
            if(mensagem != null){
        %>
        
        <h3><%= mensagem %></h3>
        <%
            }    
        %>
        
        <%
            List<Lutador> lutadores = (List)request.getAttribute("lutadores");
        %>
        
        <table border="1">
            <tr>
           <th>Nome</th> <th>Apelidio</th> <th>Senha</th> <th>Peso</th> <th>Altura</th> <th>Destro</th> <th>Curso</th> <th>Arte Marcial</th> <th>Contato de Emergencia</th> <th>Operações</th></tr>
            </tr>
            
            <% 
                for(Lutador lAux: lutadores){
            %>
            
                <tr>
                    <td><%= lAux.getId() %></td>
                    <td><%= lAux.getNome()%></td>
                <td><%= lAux.getApelido()%></td>
                <td> <%= lAux.getSenha()%> </td>
                <td><%= lAux.getPeso()%></td>
                <td><%= lAux.getAltura()%></td>
                <td><%= lAux.isDestro()%></td>
                <td><%= lAux.getCurso()%></td>
                <td><%= lAux.getArtMarcial()%></td>
                <td><%= lAux.getContatoEmergencia()%></td><!-- comment -->
                
                    
                    
                    <td><a href="LutadorServeletNovo?id=<%= lAux.getId() %>&op=update">alterar </a>
                        <a href="LutadorServeletNovo?id=<%= lAux.getId() %>&op=delete">deletar</a></td>
                </tr>
            
            
            <% 
                }
            %>
        </table>
    </body>
</html>
