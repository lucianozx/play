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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
<meta http-equiv="Expires" content="-1">

<title>7app Labs - Manager</title>

<base href="${pageContext.request.scheme}://${pageContext.request.serverName}${pageContext.request.contextPath}/">

<script src="extras/jquery/jquery-1.8.2.js"></script>
<script src="extras/bootstrap/js/bootstrap.js"></script>
<script src="extras/bootstrap/js/application.js"></script>


<!-- 
<script src="extras/jquery/jquery-1.8.2.js" type="text/javascript"></script>
-->

<link href="extras/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="extras/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<!-- 
<script src="extras/bootstrap/js/bootstrap.js"></script>
 -->

<link href="extras/bootstrap/css/docs.css" rel="stylesheet">

<style type="text/css">
.bs-docs-sidenav>li>a:hover {
	color: rgb(255, 255, 255);
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.2);
	background-color: rgb(0, 136, 204);
}

/*
.bs-docs-sidenav .active .icon-chevron-right,
.bs-docs-sidenav .active a:hover .icon-chevron-right {
  background-image: url(../img/glyphicons-halflings-white.png);
  opacity: 1;
}
*/
.bs-docs-sidenav a:hover .icon-chevron-right {
	background-image: url("extras/bootstrap/img/glyphicons-halflings-white.png");
	opacity: 1;
}

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
	position: relative;
	text-align: left;
	background: linear-gradient(45deg, rgb(0, 0, 50) 0%, rgb(0, 190, 255) 100% ) repeat scroll 0% 0% transparent;
	box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.2) inset, 0px -3px 7px rgba(0, 0, 0, 0.2) inset;
	text-shadow: 0px 1px 3px rgba(0, 0, 0, 0.4), 0px 0px 30px rgba(0, 0, 0, 0.075);
	padding: 40px 0px;
	margin-bottom: 0px;
	color: rgb(255, 255, 255);
}

</style>

</head>

<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
			
				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			
				<a class="brand" style="font-size: 23px;" href="#">7app Labs</a>

				<div class="nav-collapse collapse">
					<ul class="nav" style="margin-left: 15px">
						<li><a href="#">Início</a></li>
						<li class="active"><a href="/menu.jsp">Informações</a></li>
						<li><a href="#contact">Contato</a></li>
					</ul>
				</div>
			
				<div class="btn-group pull-right">
					<a class="btn btn-success" href="./ssl/login"><i class="icon-star icon-white"></i>&nbsp;&nbsp;Já sou Cadastrado</span></a>
				</div>

				<div class="btn-group pull-right"></div>

				<div class="btn-group pull-right">
					<a class="btn" href="./ssl/login"><i class="icon-user"></i>&nbsp;&nbsp;Cadastrar</span></a>
				</div>
			</div>
		</div>
	</div>


	<!-- 
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="brand" href="./index.html">Play! - 7app Labs</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class=""><a href="index.jsp">Home</a></li>
						<li class=""><a href="./getting-started.html">Library</a></li>
						<li class=""><a href="./scaffolding.html">Scaffolding</a></li>
						<li class=""><a href="./base-css.html">Base CSS</a></li>
						<li class=""><a href="./components.html">Components</a></li>
						<li class="active"><a href="./javascript.html">JavaScript</a></li>
						<li class=""><a href="./customize.html">Customize</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
 	-->	

	<header class="jumbotron subhead">
		<div class="container">
			<h1>Estatísticas de uso</h1>
			<p class="lead">Arquivos: 123 - Espaço utilizado: 1.3 GB</p>
		</div>
	</header>

	<div class="container">
		<div class="row">

			<div class="span3 bs-docs-sidebar">
				<ul class="nav nav-list bs-docs-sidenav">
					<li><a href="#overview"><i class="icon-chevron-right"></i> Overview</a></li>
					<li><a href="#transitions"><i class="icon-chevron-right"></i> Transitions</a></li>
					<li><a href="#modals"><i class="icon-chevron-right"></i> Modal</a></li>
					<li><a href="#dropdowns"><i class="icon-chevron-right"></i> Dropdown</a></li>
					<li><a href="#scrollspy"><i class="icon-chevron-right"></i> Scrollspy</a></li>
					<li><a href="#tabs"><i class="icon-chevron-right"></i> Tab</a></li>
					<li><a href="#tooltips"><i class="icon-chevron-right"></i> Tooltip</a></li>
					<li><a href="#popovers"><i class="icon-chevron-right"></i> Popover</a></li>
					<li><a href="#alerts"><i class="icon-chevron-right"></i> Alert</a></li>
					<li><a href="#buttons"><i class="icon-chevron-right"></i> Button</a></li>
					<li><a href="#collapse"><i class="icon-chevron-right"></i> Collapse</a></li>
					<li><a href="#carousel"><i class="icon-chevron-right"></i> Carousel</a></li>
					<li><a href="#typeahead"><i class="icon-chevron-right"></i> Typeahead</a></li>
					<li><a href="#affix"><i class="icon-chevron-right"></i> Affix</a></li>
				</ul>
			</div>

			<div class="span9">

				<div class="row">
					<div class="span9">
						<ul class="navbar nav bs-docs-nav">
							<li>
								<div class="navbar-inner">
									<div class="btn-group pull-left">
										<button id="upload" class="btn btn-primary">
											<i class="icon-plus icon-white"></i>&nbsp;&nbsp;&nbsp;Upload&nbsp;&nbsp;&nbsp;
										</button>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>

				<div class="row-fluid" style="margin-top: 100px;">
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>

				<div class="row-fluid">
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<div class="row-fluid">
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->

				<div class="row-fluid">
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<div class="row-fluid">
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->

				<div class="row-fluid">
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<div class="row-fluid">
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->

			</div>
		</div>

	</div>



	<footer class="footer">
		<div class="container">
			<p class="pull-right">
				<a href="#">Back to top</a>
			</p>
			<p>
				Designed and built with all the love in the world by <a href="http://twitter.com/mdo" target="_blank">@mdo</a> and <a href="http://twitter.com/fat" target="_blank">@fat</a>.
			</p>
			<p>
				Code licensed under <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License v2.0</a>, documentation under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.
			</p>
			<p>
				<a href="http://glyphicons.com">Glyphicons Free</a> licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.
			</p>
			<ul class="footer-links">
				<li><a href="http://blog.getbootstrap.com">Blog</a></li>
				<li class="muted">&middot;</li>
				<li><a href="https://github.com/twitter/bootstrap/issues?state=open">Issues</a></li>
				<li class="muted">&middot;</li>
				<li><a href="https://github.com/twitter/bootstrap/wiki">Roadmap and changelog</a></li>
			</ul>
		</div>
	</footer>

</body>
</html>

</compress:html>
