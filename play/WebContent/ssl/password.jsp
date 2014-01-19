<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress"%>
<%@ page trimDirectiveWhitespaces="true"%>

<compress:html enabled="false" removeComments="true" removeMultiSpaces="true" removeIntertagSpaces="true" compressJavaScript="true" compressCss="true" yuiJsDisableOptimizations="true">

<%
	response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
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

<title>7app Labs - Login</title>

<base href="${pageContext.request.scheme}://${pageContext.request.serverName}${pageContext.request.contextPath}/">

<script src="extras/jquery/jquery-1.8.2.js" type="text/javascript"></script>
<link href="extras/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="extras/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="extras/bootstrap/js/bootstrap.js"></script>
<script src="extras/validate.js" type="text/javascript"></script>

<style type="text/css">

/* Override some defaults */
html,body {
	height: 100%;
	background-color: #F5F5F5;
}

.frame123 {
	margin: 0px auto; 
	padding: 3px;
	width: 575px;"
	
	-webkit-border-radius: 10px 10px 10px 10px;
	-moz-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	/*
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
    */
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	box-shadow: 0px 1px 2px rgba(0, 0, 0, .2);

	background: white;

	/*
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	*/

	/*
    background: none repeat scroll 0% 0% padding-box rgb(255, 255, 255);
    */
}

.frame123 .content123 {
	display: block;
	height: 100%;
	-webkit-border-radius: 10px 10px 10px 10px;
	-moz-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	/*
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	*/
	background: #f3f3f3;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='$first', endColorstr='$second' );
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#f3f3f3) );
	background: -moz-linear-gradient(top, #fbfbfb, #f3f3f3) /*
	background: -moz-linear-gradient(center top , rgb(251, 251, 251), rgb(243, 243, 243)) repeat scroll 0% 0% transparent;
	*/
}

.margem123 {
	padding: 15px 50px 5px 50px;
}

.mensagem {
	margin: 10px 3px;
}

h2 {
	padding: 0px 10px 20px;
	font-size: 37px;
	letter-spacing: -1px;
	text-rendering: optimizelegibility;
	text-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2);
}

.nav-pills_ > li > a:hover {
  color: #ffffff;
  background-color: #0088cc;
}

.container1 {
	width: 500px;
}

.frame1 .content1 {
	background-color: #fff;
	padding: 20px;
	margin: 0 -20px;
	-webkit-border-radius: 10px 10px 10px 10px;
	-moz-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	/*
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
    */
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	box-shadow: 0px 1px 2px rgba(0, 0, 0, .2);
	background: -moz-linear-gradient(center top, rgb(251, 251, 251), rgb(243, 243, 243) ) repeat scroll 0% 0% transparent;
}

/*
.login-form {
	margin-left: 60px;
}

legend {
	margin-right: -50px;
	font-weight: bold;
	color: #404040;
}

div.LoginErro {
	position: relative;
	width: 200px;
	height: 128px;
	top: 10px;
	left: 53px;
	opacity: 0.0;
	background-image: url('../images/login_erro.png');
}

.board1 {
    margin-bottom: 25px;
    padding: 3px;
    border-radius: 4px 4px 4px 4px;
    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);    
    background: none repeat scroll 0% 0% padding-box rgb(255, 255, 255);    
}

.board1 .content1 {
    display: block;
    height: 100%;
    border-radius: 3px 3px 3px 3px;
    background: -moz-linear-gradient(center top , rgb(251, 251, 251), rgb(243, 243, 243)) repeat scroll 0% 0% transparent;
}

.pad {
    padding: 20px;
}

.div_form {
    margin: 0px 0px 18px;
}
*/
</style>

<script type="text/javascript">
	$(document).ready(function()
	{

		$(".close").click(function()
		{
			$(".close").parent().clearQueue();
			$(".close").parent().css("display", "none");
		});

		$("#senhaLink").tooltip();

		$("#senhaLink").click(function()
		{
			if (!isValidEmailAddress($('#email').val()))
			{
				$('#div_email').toggleClass("error", true);

				$('#email').popover({
					title : 'Informe seu email',
					content : 'Sua senha será enviada para o seu email.'
				});

				$('#email').popover('show');
				setTimeout("$('#email').popover('hide')", 10000);

				$('#email').focus();
				status = false;
			}
			else
			{
				$('#div_email').toggleClass("error", false);
				email();
			}
		});

		$("#click").click(function()
		{
			validateFields();
		});

		$("#voltar").click(function(e)
		{
			window.location.href = $("base").attr("href").replace('https://', 'http://');
		});

		function validateFields()
		{

			$('#email').val($.trim($('#email').val()));

			var status = true, control = null;

			if (!isValidEmailAddress($('#email').val()))
			{
				$('#div_email').toggleClass("error", true);
				if (!control) control = $('#email');

				if (status)
				{
					$("#emailSenhaIncorretos").html("Email incorreto");
					$("#emailSenhaIncorretos").stop(true);
					$("#emailSenhaIncorretos").fadeIn(300).fadeTo(2000, 1).fadeOut(500);
				}

				//if (status) display_message($("#emailSenhaIncorretos"), "Email incorreto");
				status = false;
			}
			else
			{
				$('#div_email').toggleClass("error", false);
			}

			if (!status)
			{
				if (control) control.focus();
			}
			else
			{
				$("#dataForm").submit();
			}
		}
	});

	/*
	function display_message(msgType, message) {
		var mb = $('#ur_messagebox')
				 .addClass(msgType === 'confirm' ? 'msg_confirm' : 'msg_error')
		         .html(message)
		         .stop(true, true).fadeIn();
		if(mb.data('delay')) clearTimeout(mb.data('delay'));
		mb.data('delay', setTimeout(function() { mb.fadeOut(1000); }, 5000));
	}
	 */

	/*
	function display_message(control, message) {
	  var mb = control.html(message).stop(true, true).fadeIn(500);
	  if(mb.data('delay')) clearTimeout(mb.data('delay'));
	  mb.data('delay', setTimeout(function() { mb.fadeOut(500); }, 3000));
	}
	 */

	function display_div(control)
	{
		var mb = control.stop(true, true).fadeIn(500);
		if (mb.data('delay')) clearTimeout(mb.data('delay'));
		mb.data('delay', setTimeout(function()
		{
			mb.fadeOut(2000);
		}, 5000));
	}
</script>

</head>

<body>
	<div style="position: absolute; width: 100%; background-color: yellow1;">
		<div id="alert_email_sended" class="alert alert-info" style="text-align: center; display: none;">
			<button type="button" class="close">×</button>
			<strong>Sua senha foi enviada. Consulte seu email.</strong>
		</div>
		<div id="alert_email_error" class="alert alert-error" style="text-align: center; display: none;">
			<button type="button" class="close">×</button>
			<strong>Falha na comunicação com o servidor. Sua senha não foi enviada.</strong>
		</div>
	</div>

	<div class="container">

		<c:choose>
			<c:when test="${sessionScope.email_ok}">

				<div style="height: 50px;"></div>
				<div class="container" style="top: 10p; width: 500px; height: 100px;">
					<div class="alert alert-success alert-block">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Email verificado com sucesso</strong>
						<p>Seu acesso está liberado.</p>
					</div>
				</div>
				<c:remove var="email_ok" scope="session" />

				<script type="text/javascript">
					$(document).ready(function()
					{
						$('#senha').focus();
					});
				</script>

			</c:when>
			<c:otherwise>

				<div style="height: 150px;"></div>

				<script type="text/javascript">
					$(document).ready(function()
					{
						$('#email').focus();
					});
				</script>

			</c:otherwise>
		</c:choose>

		<div class="row">

			<div class="frame123">
				<div class="content123">
					<div class="margem123">

						<h2 style="border: 0px solid green;">Play!</h2>
						<form id="dataForm" class="form-horizontal" method="post" action="ssl/sendPassword" style="border: 0px solid green;">
							<fieldset>
								<div id="div_email" class="control-group">
									<div class="controls input-prepend" style="margin-left: 0px;">
										<span class="add-on"><i class="icon-envelope"></i></span>
										<input id="email" class="span3" name="email" type="text" maxlength="30" value="" placeholder="Email" />
									</div>
									<span id="emailSenhaIncorretos" style="display: none; margin-left: 15px; color: red;"></span>
								</div>
								<div class="mensagem">Informe seu email.<br />Nós lhe enviaremos um link com a senha e instruções para acessar o site.</div>								
							</fieldset>

							<div style="position: relative; top: 10px; width: 100%; background-color: orange1;">
								<div style="position: relative; left: 0px;">
									<button id="click" class="btn btn-primary" type="button">Enviar Senha</button>
								</div>
								<div style="position: relative; margin-top: 25px; left: -45px; width: 565px; border-top: 1px solid #e1e1e1;"></div>
							</div>
						</form>

						<!-- 
						<button id="voltar" class="btn" type="button">
							<i class="icon-home"></i>&nbsp;&nbsp;Voltar para a Página Inicial
						</button>
						-->
						
						<ul class="nav nav-pills nav-pills_">
							<li><a href="#">Voltar para o site</a></li>
						</ul>

					</div>
				</div>
			</div>

		</div>

		<div id="LoginErro" class="LoginErro"></div>
	</div>

	<c:if test="${sessionScope.erro}">

		<c:set var="erro" scope="session" value="false" />

		<script type="text/javascript">
			$('#div_email').toggleClass("error", true);
			$('#div_senha').toggleClass("error", true);
			$("#emailSenhaIncorretos").html("Email ou Senha incorretos");
			$("#emailSenhaIncorretos").fadeIn(300).delay(5000).fadeOut(500);
			/*
			$('#LoginErro').animate({
				opacity : 1
			}, 1000, 'linear').delay(1500).animate({
				opacity : 0
			}, 600, 'linear');
			 */
		</script>

	</c:if>
</body>
</html>

</compress:html>

