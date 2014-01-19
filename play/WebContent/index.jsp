<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<%@ page trimDirectiveWhitespaces="true" %>

<compress:html enabled="false" removeComments="true" removeMultiSpaces="true" removeIntertagSpaces="true" compressJavaScript="true" compressCss="true" yuiJsDisableOptimizations="true">

<c:if test="${pageContext.request.secure}">
	<c:set var="url1" scope="page" value="http://${pageContext.request.serverName}/${pageContext.request.contextPath}" />
	<c:redirect url="${url1}" />
</c:if>

<!DOCTYPE html>
<!-- <html lang="en"> -->
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<fmt:setLocale value="pt_BR" scope="session" />
<fmt:setBundle basename="i18n.i18n" />

<!-- 
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
<meta http-equiv="Expires" content="-1">
-->

<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>7app Labs Software</title>

<base href="${pageContext.request.scheme}://${pageContext.request.serverName}${pageContext.request.contextPath}/">

<script src="extras/jquery/jquery-1.8.2.js"></script>
<script src="extras/bootstrap/js/bootstrap.js"></script>
<link href="extras/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="extras/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="extras/bootstrap/css/docs.css" rel="stylesheet">

<!-- 
<link href="./assets/css/bootstrap-responsive.css" rel="stylesheet">
 -->

<style type="text/css">
body {
	position: relative;
	padding-top: 40px;
	text-rendering: optimizelegibility;
}

body>.navbar {
	font-size: 14px;
}

/* Change the docs' brand */
body>.navbar .brand {
	padding-left: 0;
	margin-left: 10px; 1
	font-weight: bold;
	color: #ccc;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .1), 0 0 30px rgba(255, 255, 255, .125);
	-webkit-transition: all .2s linear;
	-moz-transition: all .2s linear;
	transition: all .2s linear;
}

body>.navbar-fixed-top .brand {
	padding-right: 0;
	float: left;
}

body>.navbar .brand:hover {
	text-decoration: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .1), 0 0 30px rgba(255, 255, 255, .4);
}

.jumbotron {
	position: relative; //
	padding: 40px 0px; //
	color: rgb(255, 255, 255);
	text-align: center;
	background: linear-gradient(45deg, rgb(0, 0, 50) 0%, rgb(0, 190, 255) 100% ) repeat scroll 0% 0% transparent;
	box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.2) inset, 0px -3px 7px rgba(0, 0, 0, 0.2) inset;
	text-shadow: 0px 1px 3px rgba(0, 0, 0, 0.4), 0px 0px 30px rgba(0, 0, 0, 0.075);
	padding: 70px 0px 50px;
	margin-bottom: 0px;
	color: rgb(255, 255, 255);
}

.h1 { 1
	color: rgb(0, 200, 255);
	font-weight: bold;
	font-family: 'Helvetica Neue', helvetica, sans-serif;
	text-rendering: optimizelegibility;
	font-size: 70px;
	letter-spacing: -1px;
	line-height: 1;
	text-shadow: 1px 1px 3px rgb(50, 50, 50);
}

.h2 { 1
	color: rgb(0, 0, 255); 1
	color: rgb(98, 199, 41);
	font-weight: bold;
	font-family: 'Helvetica Neue', helvetica, sans-serif;
	text-rendering: optimizelegibility;
	font-size: 85px;
	letter-spacing: -1px;
	line-height: 1;
	text-shadow: 1px 1px 2px rgb(0, 50, 100);
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<!-- 
<link rel="shortcut icon" href="./assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="./assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="./assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="./assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="./assets/ico/apple-touch-icon-57-precomposed.png">
 -->

<script>
	$(function()
	{
		// Setup drop down menu
		$('.dropdown-toggle').dropdown();

		// Fix input element click problem
		$('.dropdown input, .dropdown label').click(function(e)
		{
			e.stopPropagation();
		});
	});
</script>

</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">

				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>

				<a class="brand" style="font-size: 23px;" href="#">7app Labs</a>

				<!-- 
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></a>
				-->

				<div class="nav-collapse">
					<ul class="nav" style="margin-left: 15px">
						<li class="active"><a href="#">Início</a></li>
						<li><a href="./menu.jsp">Informações</a></li>
						<li><a href="#contact">Contato</a></li>
					</ul>
				</div>

				<!--/.nav-collapse -->

				<!--
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					<li>
						<button class="btn btn-primary" id="login">Login do Usuário</button>
					</li>
				</ul>
				-->

				<!-- 
				<ul class="nav pull-right">
					<li><a href="/users/sign_up">Sign Up</a></li>
					<li class="divider-vertical"></li>
					<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Sign In <strong class="caret"></strong></a>
						<div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">
							<form action="[YOUR ACTION]" method="post" accept-charset="UTF-8">
								<input id="user_username" style="margin-bottom: 15px;" type="text" name="user[username]" size="30" /> <input id="user_password" style="margin-bottom: 15px;" type="password" name="user[password]" size="30" /> <input id="user_remember_me" style="float: left; margin-right: 10px;" type="checkbox" name="user[remember_me]" value="1" /> <label class="string optional" for="user_remember_me"> Remember me</label> <input class="btn btn-primary" style="clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit" name="commit" value="Sign In" />
							</form>
						</div></li>
				</ul>
				-->


				<div class="btn-group pull-right">
					<a class="btn btn-success" href="./ssl/login"><i class="icon-star icon-white"></i>&nbsp;&nbsp;<fmt:message key="button.cadastrado" /></span></a>
				</div>

				<div class="btn-group pull-right"></div>

				<div class="btn-group pull-right">
					<a class="btn" href="./ssl/login"><i class="icon-user"></i>&nbsp;&nbsp;<fmt:message key="button.cadastrar" /></span></a>
				</div>

				<!-- 
				<div class="btn-group pull-right">
					<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"> <i class="icon-user icon-white"></i> Login do Usuário <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Profile</a></li>
						<li class="divider"></li>
						<li><a href="#">Sign Out</a></li>
					</ul>
				</div>
				-->

			</div>
		</div>
	</div>

	<div class="jumbotron">
		<div class="container">

			<div class="hero-unit" style="background-color: rgba(0, 0, 20, 0.7)">

				<span class="h1">7app Labs Software</span> <br /> <br /> <span class="h2">Play!&nbsp;&nbsp;Um player diferente</span> <br /> <br />
				<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn btn-primary btn-large">Learn more &raquo;</a>
				</p>
			</div>
		</div>
	</div>

	<div class="container">

		<div class="row">
			<div class="span12">

				<!-- Main hero unit for a primary marketing message or call to action -->
				<!-- 
				<div class="hero-unit jumbotron1">

					<span class="h">7app Labs Software</span> <br /> <br /> <span class="h1s" style="color: rgb(98, 199, 41);">Play!&nbsp;&nbsp;Um player diferente</span> <br /> <br />
					<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
					<p>
						<a class="btn btn-primary btn-large">Learn more &raquo;</a>
					</p>
				</div>
				-->

				<div class="row">
					<div class="span4">
						<h2>Heading</h2>
						
<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
<form target="pagseguro" action="https://pagseguro.uol.com.br/checkout/v2/cart.html?action=add" method="post">
<input type="hidden" name="itemCode" value="261E278631315D4884499FA838DE26F4" />
<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-pagar-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
</form>
<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
					
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<div class="span4">
						<h2>Heading</h2>
						
<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
<form target="pagseguro" action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post">
<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
<input type="hidden" name="code" value="0C6965B04040CCF774F9AF9E54520E8A" />
<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-pagar-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
</form>
<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
						
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<div class="span4">
						<h2>Heading</h2>
						
<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
<form target="pagseguro" action="https://pagseguro.uol.com.br/checkout/v2/cart.html?action=add" method="post">
<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
<input type="hidden" name="itemCode" value="65B4069CA7A7915EE470EF9D0C976084" />
<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-comprar-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
</form>
<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
						
						<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
				</div>

				<hr />
				<footer>
					<p>&copy; 7app Labs Inc. 2012 &nbsp; - &nbsp; Browser Locale: <b><c:out value="${pageContext.request.locale}"/></b></p>
				</footer>

			</div>
		</div>
	</div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- 
	<script src="./assets/js/jquery.js"></script>
	<script src="./assets/js/bootstrap-transition.js"></script>
	<script src="./assets/js/bootstrap-alert.js"></script>
	<script src="./assets/js/bootstrap-modal.js"></script>
	<script src="./assets/js/bootstrap-dropdown.js"></script>
	<script src="./assets/js/bootstrap-scrollspy.js"></script>
	<script src="./assets/js/bootstrap-tab.js"></script>
	<script src="./assets/js/bootstrap-tooltip.js"></script>
	<script src="./assets/js/bootstrap-popover.js"></script>
	<script src="./assets/js/bootstrap-button.js"></script>
	<script src="./assets/js/bootstrap-collapse.js"></script>
	<script src="./assets/js/bootstrap-carousel.js"></script>
	<script src="./assets/js/bootstrap-typeahead.js"></script>
 	-->

	<script>
		$('.controls').find('input').bind('click', function(event)
		{

			if ($(this).attr('id') === 'login')
			{
				alert($(this).attr('id'));
			}
			else
			{
				//... call some other function
			}

		});
	</script>
</body>
</html>

</compress:html>
