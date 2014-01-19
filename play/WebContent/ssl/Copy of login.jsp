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
<!-- 
<link href="extras/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
-->
<script src="extras/bootstrap/js/bootstrap.js"></script>

<script src="extras/validate.js" type="text/javascript"></script>

<style type="text/css">

/* Override some defaults */
html,body {
	height: 100%;
	background-color: #F5F5F5;
}

.container {
	width: 500px;
}

/* The white background content wrapper */
.container>.content {
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

h2 {
	padding: 5px 10px;
	font-size: 24px;
	font-weight: normal;
	line-height: 36px;
	letter-spacing: -1px;
	text-rendering: optimizelegibility;
	text-shadow: 0px 1px 1px rgba(0, 0, 0, 0.2);
}

.board {
	margin-bottom: 25px;
	padding: 3px;
	border-radius: 4px 4px 4px 4px;
	box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);
	background: none repeat scroll 0% 0% padding-box rgb(255, 255, 255);
}

.board .content {
	display: block;
	height: 100%;
	border-radius: 3px 3px 3px 3px;
	background: -moz-linear-gradient(center top, rgb(251, 251, 251), rgb(243, 243, 243) ) repeat scroll 0% 0% transparent;
}

.pad {
	padding: 20px;
}

.div_form {
	margin: 0px 0px 18px;
}

.login-fields .field {
	margin-bottom: 1.25em;
}

.login-fields input {
	font-size: 13px;
	color: #8e8d8d;
	padding: 9px 15px 9px 50px;
	background-color: #fdfdfd;
	background-color: white;
	width: 255px;
	display: block;
	margin: 0;
	box-shadow: inset 2px 2px 4px #f1f1f1;
}

.username-field {
	background-image: url('../images/user.png') no-repeat;
}

.teste {
	background-image: url("images/user.png");
	background-repeat: no-repeat;
}

.login-fields .field .password-field {
	background-image: url(img/signin/password.png) no-repeat;
}
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
			var temp = $("base").attr("href");
			window.location.href = "http://" + window.location.hostname + ((typeof temp !== "undefined") && (temp !== null) ? temp : "");
		});

		function validateFields()
		{

			$('#email').val($.trim($('#email').val()));
			$('#senha').val($.trim($('#senha').val()));

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

			if (!isValidPassword($('#senha').val(), 5, 10))
			{
				$('#div_senha').toggleClass("error", true);
				if (!control) control = $('#senha');

				if (status)
				{
					$("#emailSenhaIncorretos").html("Senha deve ter de 5 a 10 caracteres");
					$("#emailSenhaIncorretos").stop(true);
					$("#emailSenhaIncorretos").fadeIn(300).fadeTo(2000, 1).fadeOut(500);
				}

				//if (status) display_message($("#emailSenhaIncorretos"), "Senha deve ter de 5 a 10 caracteres");
				status = false;
			}
			else
			{
				$('#div_senha').toggleClass("error", false);
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

	function email()
	{

		var request = $.ajax({
			url : "sendPassword",
			type : "POST",
			data : {
				email : $('#email').val()
			},
			dataType : "text"
		});

		$('#email').focus();
		$("#senhaLink").attr("disabled", "disabled");

		var texto = $("#senhaLink").html();
		$("#senhaLink").html("Enviando senha...");

		request.done(function(msg)
		{
			$("#senhaLink").html("Senha enviada");

			$('#alert_email_sended').stop(true);
			$('#alert_email_sended').fadeIn(300).fadeTo(5000, 1).fadeOut(500, function()
			{
				$("#senhaLink").html(texto);
				$("#senhaLink").removeAttr("disabled");
			});

			//display_div($('#alert_email_sended'));
			//var control = $("#senhaLink");
			//setTimeout( function() { enable(control); control = null; }, 5000);	
		});

		request.fail(function(jqXHR, textStatus)
		{
			$("#senhaLink").html("Senha não enviada");

			$('#alert_email_error').stop(true);
			$('#alert_email_error').fadeIn(300).fadeTo(5000, 1).fadeOut(500, function()
			{
				$("#senhaLink").html(texto);
				$("#senhaLink").removeAttr("disabled");
			});

			//display_div($('#alert_email_error'));
			//var control = $("#senhaLink");
			//setTimeout( function() { enable(control); control = null; }, 5000);	
		});

		/*
		function enable(control) {
			$('#alert_email_sended').fadeOut(500);
			control.html(texto);
			control.removeAttr("disabled");
		}
		 */
	}

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

		<div class="content" style="border: 1px solid green1;">
			<div class="row">
				<div class="login-form">
					<h2>7app Labs - Play!</h2>
					<br />
					<form id="dataForm" class="form-horizontal" method="post" action="ssl/login">
						<fieldset>
							<div id="div_email" class="control-group">
								<label class="control-label" style="width: 40px;" for="email"> <span>Email</span>
								</label>
								<div class="controls" style="margin-left: 50px;">
									<input id="email" class="span5" name="email" type="text" maxlength="30" value="admin@admin.com" rel="popover" data-animation="true" data-delay="delay: { show: 500, hide: 1000 }" data-trigger="manual" />
								</div>
							</div>

							<div id="div_senha" class="control-group">
								<label class="control-label" style="width: 40px;" for="senha"> <span>Senha</span>
								</label>
								<div class="controls" style="margin-left: 50px;">
									<input id="senha" class="span3" name="senha" type="password" maxlength="10" value="admin" rel="popover" data-animation="true" data-delay="delay: { show: 1000, hide: 1000 }" data-trigger="manual" />
									<button id="senhaLink" class="btn btn-link" style="width: 167px; text-align: right;" type="button">Esqueci minha senha</button>
								</div>
							</div>
							<!-- 						
							<div class="clearfix">
								<input id="email" name="email" type="text" placeholder="Email" value="">
							</div>
							<div class="clearfix">
								<input id="senha" name="senha" type="password" placeholder="Senha" value="">
							</div>
							-->

							<div class="login-fields">
								<p>Sign in using your registered account:</p>
								<div class="field">
									<input type="text" id="username" name="username" class="teste" value="" placeholder="Username" />
								</div>
								<div class="field">
									<input type="password" id="password" name="password" value="" placeholder="Password" class="password-field" />
								</div>
							</div>

						</fieldset>

						<div style="position: relative; top: 10px; height: 80px; width: 100%; background-color: orange1;">
							<div style="position: relative; left: 0px;">
								<button id="click" class="btn btn-primary" type="button">Login</button>
								<span id="emailSenhaIncorretos" style="display: none; position: absolute; right: 35px; top: 0px; color: red; background-color: orange1;"><strong></strong></span>
							</div>
							<br />
							<div style="position: relative; left: -55px; width: 530px; border-top: 1px solid #e1e1e1;"></div>
							<br />
							<div style="position: relative; left: 0px;">
								<button id="voltar" class="btn" type="button">
									<i class="icon-home"></i>&nbsp;&nbsp;Voltar para a Página Inicial
								</button>
							</div>
						</div>
						<br /> <br />
					</form>
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

