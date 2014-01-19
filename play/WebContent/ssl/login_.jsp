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

<base href="${pageContext.request.contextPath}/">

<title>7app Labs - Login</title>

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
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .15);
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
    background: -moz-linear-gradient(center top , rgb(251, 251, 251), rgb(243, 243, 243)) repeat scroll 0% 0% transparent;
}

.pad {
    padding: 20px;
}

.div_form {
    margin: 0px 0px 18px;
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
				setTimeout("$('#email').popover('hide')", 3000);
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
				control.html(texto);
				control.removeAttr("disabled");
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
				control.html(texto);
				control.removeAttr("disabled");
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

	<!-- 
	<div class="container" style="border: 1px solid gray; width: 100px;"></div>
	-->	
	<div class="container">
	<div class="row">
		<div class="span6">
			<h2>Sign in</h2>
			<div class="board">
				<div class="content">
					<div class="pad">
						<!-- 
						<form accept-charset="UTF-8" action="/users/sign_in" class="simple_form form-inline" id="new_user" method="post" novalidate="novalidate">
						 -->
						 <div class="div_form">
							<div style="margin: 0; padding: 0; display: inline">
								<input name="utf8" value="✓" type="hidden">
								<input name="authenticity_token" value="0bbEG9MU13uvebGiigPonNLX+fSITwgpFx38GCx6U8o=" type="hidden">
							</div>
							<div class="control-group string optional">
								<label class="string optional control-label" for="user_login"> Login</label>
								<div class="controls">
									<input autofocus="autofocus" class="string optional span5" id="user_login" name="user[login]" size="50" type="text">
								</div>
							</div>
							<div class="control-group password optional">
								<label class="password optional control-label" for="user_password"> Password</label>
								<div class="controls">
									<input class="password optional span5" id="user_password" name="user[password]" size="50" type="password">
								</div>
							</div>
							<div class="control-group boolean optional">
								<label class="boolean optional control-label" for="user_remember_me"> Remember me</label>
								<div class="controls">
									<input name="user[remember_me]" value="0" type="hidden"><label class="checkbox"><input class="boolean optional" id="user_remember_me" name="user[remember_me]" value="1" type="checkbox"></label>
								</div>
							</div>
							<div>
								<input class="btn btn-primary" name="commit" value="Sign in" type="submit">
							</div>
						</div>
						<!-- 
						</form>
						 -->
						<a href="/users/password/new">Forgot your password?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<c:if test="${sessionScope.erro}">

		<c:set var="erro" scope="session" value="false" />

		<script type="text/javascript">
			$("#emailSenhaIncorretos").html("Email ou Senha incorretos");
			$("#emailSenhaIncorretos").fadeIn(300).delay(3000).fadeOut(500);
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

