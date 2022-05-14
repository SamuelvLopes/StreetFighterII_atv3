<%-- 
    Document   : locais
    Created on : 06/04/2022, 19:30:33
    Author     : ALUNO
--%>

<%@page import="repositorio.RepositorioLocalMemo"%>
<%@page import="negocios.Local"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ifpe"  uri="controllers.tags"%>
<%@taglib prefix="ifpetags"  uri="tag.carrega"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/bootstrap.min.css"/>

        <title>JSP Page</title>
    </head>
    <body>
        <h1>Locais Cadastrados</h1>
        
        
      
      <%  //Tag um %>
        <ifpetags:carrega classe="Local" var='locs'/>
        <hr>
        ${locs.size()}
      <hr>  
      <%  //tag um %>
        
        
        
        
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#localCad">cadastrar</button>
        <%
            

            List<Local> locais = (List) request.getAttribute("ls");

            Local l = (Local) request.getAttribute("l");
            
            String altera = request.getParameter("altera");
            
            
        %>

        <h2 id="saida">${sessionScope.msg}</h2>
        <h3>${param.id}</h3>

        <%
                session.removeAttribute("msg");
            
        %>

        <table class="table">
            <tr><th>Apelidio</th><th>Endereço</th><th>Capacidade</th><th>Operações</th></tr>

            <%
                for (Local lAux : locais) {
                    
                    pageContext.setAttribute("porcaria", lAux);
            %>
            <tr>
                <td>${porcaria.apelido}</td>
                <td><% out.println(lAux.getEndereco());%></td>
                <td><%= lAux.getCapacidade()%></td>
                <td><a href="LocalServlet?id=<%= lAux.getId()%>">Visualizar</a>
                    <a href="LocalServlet?id=<%= lAux.getId()%>&altera=">Alterar</a>
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
                        
                        <jsp:include page="${(requestScope.l ne null)?'cadLocal.jsp?id='+=requestScope.l.id:'cadLocal.jsp'}"/>
                        
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
                                <td>Apelido:</td>
                                <td><%= l.getApelido()%></td>
                            </tr>
                            <tr>
                                <td>Endereço:</td>
                                <td><%= l.getEndereco()%></td>
                            </tr>
                            <tr>
                                <td>Capacidade:</td>
                                <td><%= l.getCapacidade()%></td>
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
                
                fetch('http://localhost:8080/StreetIFighterII/LocalServlet?id='+id,{ method: 'DELETE' })
                        .then(() => document.getElementById("saida").innerHTML="local deletado com sucesso!")
                
            }
            
        </script>
    </body>
</html>
