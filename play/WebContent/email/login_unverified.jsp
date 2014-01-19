<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress"%>
<%@ page trimDirectiveWhitespaces="true"%>

<compress:html enabled="false" removeComments="true" removeMultiSpaces="true" removeIntertagSpaces="true" compressJavaScript="true" compressCss="true" yuiJsDisableOptimizations="true">

<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", -1);
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
<meta http-equiv="Expires" content="-1">

<base href="${pageContext.request.contextPath}/">
 
<title>In Focus - Cadastro</title>

<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>

<link href="js/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		$("#send").click(function(e) {
			$("#dataForm").submit();
		});
		
		$("#voltar").click(function(e) {
			var temp = $("base").attr("href");
			window.location.href = "http://" + window.location.hostname + ((typeof temp !== "undefined") && (temp !== null) ? temp : "");
		});		
	});
	
</script>		

</head>

<body>

    <div class="modal">
    	<div class="modal-header">
    		<h3>Email ainda não verificado</h3>
    	</div>
    	<div class="modal-body">
    		<p style="color: blue;"><strong><c:out value="${requestScope.email}"/></strong></p>
    		<p>Esse email já está cadastrado, mas ainda não foi verificado.</p>
    		<p>Consulte o email e clique na mensagem recebida para validar o cadastro.</p>
    		<p>Se preferir, envie novamente o Link de Verificação.</p>
    	</div>
    	<div class="modal-footer">
    		<button id="send" class="btn btn-primary" type="button">Clique aqui para enviar novamente o Link de Verificação</button>
    		<br /><br />
    		<button id="voltar" class="btn" type="button"><i class="icon-home"></i>&nbsp;&nbsp;Voltar para a Página Inicial</button>
    	</div>
    </div>

	<form id="dataForm" class="form-horizontal" style="position: absolute; left: 115px; top: 194px;" method="post" action="SendEmailValidateLink" >
		<fieldset>
			<input type="hidden" name="email" value="<c:out value="${requestScope.email}"/>" />
		</fieldset>
	</form>

</body>
</html>

</compress:html>

