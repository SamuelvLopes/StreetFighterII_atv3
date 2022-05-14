<%-- 
    Document   : lutadores
    Created on : 30 de abr. de 2022, 14:41:02
    Author     : samuel
--%>
<%@page import="repositorio.Repositoriolutador"%>
<%@page import="negocios.Lutador"%>
<%@page import="java.util.List"%>
<%@taglib prefix="ifpetags"  uri="tag.carrega"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/bootstrap.min.css"/>

        <title>Cadastro de lutador </title>
    </head>
    <body>
        
        <h1>Lutadores Cadastrados</h1>
        
        <%  //tag um %>
        <ifpetags:carrega classe="Lutador" var='locs'/>
        <hr>
        ${locs.size()}
        <hr>
        <%  //tag um %>
        
        <%  //tag dois %>
        <ifpetags:carregaum classe="Lutador" var='locs' id='1'/>
        <hr>
       
        ${locs.nome}
        
         
        
        <hr>
        <%  //tag dois %>
        
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#localCad">cadastrar</button>
        <%
            String mensagem = (String) session.getAttribute("msg");

            List<Lutador> lutadores = (List) request.getAttribute("ls");

            Lutador l = (Lutador) request.getAttribute("l");
            
            String altera = request.getParameter("altera");
            

            if (mensagem != null) {
        %>
    <h2 id="saida"><%= mensagem%></h2>
    <%
                session.removeAttribute("msg");
            }
        %>
        
         <table class="table">
            <tr> <th>Nome</th> <th>Apelidio</th> <th>Senha</th> <th>Peso</th> <th>Altura</th> <th>Destro</th> <th>Curso</th> <th>Arte Marcial</th> <th>Contato de Emergencia</th> <th>Operações</th></tr>

            <%
                for (Lutador lAux : lutadores) {
            %>
            <tr>
                <td><%= lAux.getNome()%></td>
                <td><%= lAux.getApelido()%></td>
                <td> <%= lAux.getSenha()%> </td>
                <td><%= lAux.getPeso()%></td>
                <td><%= lAux.getAltura()%></td>
                <td><%= lAux.isDestro()%></td>
                <td><%= lAux.getCurso()%></td>
                <td><%= lAux.getArtMarcial()%></td>
                <td><%= lAux.getContatoEmergencia()%></td>

                <td><a href="LutadorServelet?id=<%= lAux.getId()%>">Visualizar</a>
                    <a href="LutadorServelet?id=<%= lAux.getId()%>&altera=">Alterar</a>
                    <a href="#" onclick="deletar(<%= lAux.getId() %>)">deletar</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

        <!-- Modal -->
        <div class="modal fade" id="localCad" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%
                            if(altera != null){
                        %>
                            <jsp:include page="cadlutador.jsp?id=<%= l.getId() %>"/>
                        <% 
                            }else{
                        %>
                            <jsp:include page="cadlutador.jsp"/>
                        <% 
                            }
                        %>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>
                    
        <script src="assets/bootstrap.min.js"></script>

        <%            
            if (altera != null) {
        %>
        <script>
            var myModal = new bootstrap.Modal(document.getElementById('localCad'), {
                keyboard: false
            })
            myModal.show()
        </script>
        <%          
            }
        %>

        

        <%
            if (l != null && altera == null) {
        %>

        <div class="modal fade show" id="modalVis" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table"> 
                            <tr>
                                <td>Nome:</td>
                                <td><%= l.getNome()%></td>
                            </tr>
                            
                            <tr>
                                <td>Apelido:</td>
                                <td><%= l.getApelido()%></td>
                            </tr>
                            
                            <tr>
                                <td>Senha:</td>
                                <td><%= l.getSenha()%></td>
                            </tr>
                            <tr>
                                <td>Peso:</td>
                                <td><%= l.getPeso()%></td>
                            </tr>
                             <tr>
                                <td>Altura:</td>
                                <td><%= l.getAltura()%></td>
                            </tr>
                            <tr>
                                <td>Destro:</td>
                                <td><%= l.isDestro()%></td>
                            </tr>
                            <tr>
                                <td>Curso:</td>
                                <td><%= l.getCurso()%></td>
                            </tr>
                            <tr>
                                <td>Arte Marcial:</td>
                                <td><%= l.getArtMarcial()%></td>
                            </tr>
                            <tr>
                                <td>Contato de Emergencia:</td>
                                <td><%= l.getContatoEmergencia()%></td>
                            </tr>

                            
                            
                        </table>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>

        <script>
                var myModal = new bootstrap.Modal(document.getElementById('modalVis'), {
                    keyboard: false
                })
                myModal.show()
        </script>
        <%
            }
        %>
        
        <script>
            
            function deletar(id){
                
                fetch('http://localhost:8089/StreetFightersII/LutadorServelet?id='+id,{ method: 'DELETE' })
                        .then(() => document.getElementById("saida").innerHTML="lutador deletado com sucesso!")
                
				
				 document.location.reload(true);
				 
            }
            
        </script>

        
      
        
        
        
    
    </body>
</html>
