<%-- 
    Document   : cadLocal
    Created on : 06/04/2022, 19:06:12
    Author     : ALUNO
--%>

<%@page import="repositorio.RepositorioLocalMemo"%>
<%@page import="negocios.Local"%>
<%
    String stringId = request.getParameter("id");
    
    
    Local lo = null;
    
    if(stringId != null){
        
        int id = Integer.parseInt(stringId);
            
        lo = RepositorioLocalMemo.getCurrentInstance().ler(id);
    
        pageContext.setAttribute("local", lo);
        
        session.removeAttribute("lo");
    }
    
%>

        <h1>Cadastro de Local de briga</h1>
        <form class="form" method="post"  action="LocalServlet">
            
            <%= (lo!=null)?"<input type='hidden' name='altera' value='alguma coisa'/>":""%> 
            <%= (lo!=null)?"<input type='hidden' name='id' value='"+lo.getId()+"'/>":""%>
            
            <table class="table">
                <tr>
                    <td>
                        Apelidio: 
                    </td>
                    <td>
                        <input type="text" name="apelido" value="${(pageScope.local ne null)?pageScope.local.apelido:''}" /> 
                    </td>
                </tr>
                <tr>
                    <td>
                        Endereço: 
                    </td>
                    <td>
                        <input type="text" name="endereco" <%= (lo!=null)? "value=\""+lo.getEndereco()+"\"":"" %> /> 
                    </td>
                </tr>
                <tr>
                    <td>
                        Capacidade: 
                    </td>
                    <td>
                        <input type="text" name="capacidade" <%= (lo!=null)? "value=\""+lo.getCapacidade()+"\"":"" %> /> 
                    </td>
                </tr>
                <tr>
                    <td rowspan="2"> 
                        <input type="submit" class="btn btn-primary" value= <%= (lo!=null)? "Alterar": "Cadastrar"%> />
                    </td>
                </tr>
            </table> 
        </form>

