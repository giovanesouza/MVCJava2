<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- PERMITE O USO DA TAG LIB DO FORM DE EXIBIÇÃO DA LISTA -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agenda</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

</head>
<body>

	<div class="container mt-3">
	
		<h3>Cadastro contato</h3>
		
		<form action="Inserir" method="post" class="form-control">
		
			<fieldset>
		
				<legend>Dados do Contato</legend>

				<p>
					<label for="nome">Nome:</label> 
					<input type="text" id="nome" name="nome" size="40" class="form-control" required>
				</p>

				<p>
					<label for="telefone">Idade:</label> 
					<input type="number" id="idade" min="0" step="1" name="idade" size="15" class="form-control" required>
				</p>

				<p>
					<input type="submit" value="Cadastrar Cliente"
						class="btn btn-primary">
				</p>
			</fieldset>
		</form>
		
		
		<!-- LISTA DOS CONTATOS -->
		<table class="table mt-3">
        <thead>
            <tr>
                <th>Nome</th>
                <th>Idade</th>
                <th>Data cadastro</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <jstl:forEach items="${listaContatos}" var="contato">
                <tr>
                    <td>${contato.nome}</td>
                    <td>${contato.idade}</td>
                    <td>${contato.dataCadastro}</td>
                    <td>
                        <a href="editar?id=${contato.id}" class="btn btn-success">Editar</a>  
                        <a href="excluir?id=${contato.id}" onclick="return confirm('Deseja Excluir?')" class="btn btn-danger">Excluir</a>
                    </td>
                </tr>
            </jstl:forEach>
            
        </tbody>
    </table>
		
		
	</div>
	
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
</body>
</html>