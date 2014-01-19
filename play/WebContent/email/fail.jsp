<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="false"%>
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
		
	});
	
</script>		

</head>

<body>

    <div class="modal">
    	<div class="modal-header">
    		<h3>Falha na verificação do Email</h3>
    	</div>
    	<div class="modal-body">
    		<p>O Link para Verificação não é mais válido.</p>
    		<p>Entre em contato com o Site.</p>
    	</div>
    	<div class="modal-footer">
    		<button id="send" class="btn btn-primary" type="button">Voltar para o Site</button>
    	</div>
    </div>
	
</body>
</html>

</compress:html>

