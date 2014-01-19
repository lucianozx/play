<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress"%>
<%@ page trimDirectiveWhitespaces="true"%>

<compress:html enabled="false" removeComments="true" removeMultiSpaces="true" removeIntertagSpaces="true" compressJavaScript="true" compressCss="true" yuiJsDisableOptimizations="true">

<c:if test="${!request.isSecure()}">
	<c:set var="url1" scope="page" value="'http://' + ${requestScope.getServerName()} + '/' + ${requestScope.getContextPath()}" />
	<c:redirect url=url1 />
	teste: ${url1}	
</c:if>


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

<base href="${pageContext.request.scheme}://${pageContext.request.serverName}${pageContext.request.contextPath}/">

<title>In Focus - Clientes</title>

<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
<script src="js/jquery.maskedinput-1.3.min.js" type="text/javascript"></script>
<!--
<script src="js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="js/clearbox.js"></script>
-->

<link href="js/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap/js/bootstrap.min.js"></script>

<script src="js/validate.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function()
	{

		jQuery(function($)
		{
			$("#data").mask("99/99/9999", {
				placeholder : " "
			});
			$("#cpf").mask("999.999.999-99", {
				placeholder : " "
			});
		});

		$("#save").click(function(e)
		{
			validateFields();
		});

		$("#voltar").click(function(e)
		{
			window.location.href = $("base").attr("href").replace('https://', 'http://');
		});
	});

	/*
	$("#consultar").hover(
		function () {
			$("#consultar").tooltip('show');
		},
		function () {
			$("#consultar").tooltip('hide');
		}
	);
	 */

	function validateFields()
	{

		$('#nome').val($.trim($('#nome').val()));
		$('#email').val($.trim($('#email').val()));
		$('#senha').val($.trim($('#senha').val()));
		$('#data').val($.trim($('#data').val()));

		var status = true, control = null;

		if (!isValidName($('#nome').val(), 3))
		{
			$('#div_nome').toggleClass("error", true);
			$('#div_msg_erro_nome').css("visibility", "visible");
			if (!control) control = $('#nome');
			status = false;
		}
		else
		{
			$('#div_nome').toggleClass("error", false);
			$('#div_msg_erro_nome').css("visibility", "hidden");
		}

		if (!isValidEmailAddress($('#email').val()))
		{
			$('#div_email').toggleClass("error", true);
			$('#div_msg_erro_email').css("visibility", "visible");
			if (!control) control = $('#email');
			status = false;
		}
		else
		{
			$('#div_email').toggleClass("error", false);
			$('#div_msg_erro_email').css("visibility", "hidden");
		}

		if (!isValidPassword($('#senha').val(), 5, 10))
		{
			$('#div_senha').toggleClass("error", true);
			$('#div_msg_erro_senha').css("visibility", "visible");
			if (!control) control = $('#senha');
			status = false;
		}
		else
		{
			$('#div_senha').toggleClass("error", false);
			$('#div_msg_erro_senha').css("visibility", "hidden");
		}

		if ($('#data').val())
		{
			if (!isDate($('#data').val()))
			{
				$('#div_data').toggleClass("error", true);
				$('#div_msg_erro_data').css("visibility", "visible");
				if (!control) control = $('#data');
				status = false;
			}
			else
			{
				$('#div_data').toggleClass("error", false);
				$('#div_msg_erro_data').css("visibility", "hidden");
			}
		}
		else
		{
			$('#div_data').toggleClass("error", false);
			$('#div_msg_erro_data').css("visibility", "hidden");
		}

		if (!status)
		{
			//$("#div_message").css("visibility", "visible");
			if (control) control.focus();
		}
		else
		{
			$("#dataForm").submit();
		}
	}
</script>

<style type="text/css" media="screen">
body,html {
	height: 100%;
}

body {
	margin: 0px;
	border: 0px;
	padding: 0px;
	/* font-family: Verdana, Geneva, sans-serif; */
}

.page_1 { #
	position: absolute; #
	top: 50%;
	display: table-cell;
	vertical-align: middle;
}

.page_2 { #
	position: relative; #
	top: -50%;
	margin-left: auto;
	margin-right: auto;
}

.page_container {
	position: relative;
	margin: 0px auto;
	width: 990px;
	height: 850px;
	/*border: 1px solid gray;*/
	background-image: url('images/users-add.jpg')
}

.texto_black {
	margin: 0px;
	border: 0px;
	padding: 0px;
	color: black;
	/*font-family: Arial, Helvetica, sans-serif;*/
}

.texto_orange {
	margin: 0px;
	border: 0px;
	padding: 0px;
	color: #FF5700;
	/*font-family: Arial, Helvetica, sans-serif;*/
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif;
	background-color: none;
}

.mensagem {
	color: blue;
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif;
}

.control-margin-left {
	margin-left: 390px;
}
</style>

</head>

<body>

	<div id="fb-root"></div>
	<script type="text/javascript" charset="utf-8" src="js/script.js"></script>

	<div id="div_info_geo" style="position: fixed; top: 30px; right: 30px; width: 130px;"></div>
	<div id="div_info_facebook" style="position: fixed; top: 30px; left: 30px; width: 300px;"></div>

	<div style="display: table; width: 100%; height: 100%; # position: relative;">

		<!-- 
		<div style="#position: absolute; #top: 50%; display: table-cell; vertical-align: middle;">
			<div style="#position: relative; #top: -50%; margin-left: auto; margin-right: auto;">
-->

		<div class="page_1">
			<div class="page_2">
				<div class="page_container">
					<img style="position: absolute; left: 365px; top: 17px; width:" alt="Cadastre-se" src="images/logo.png"> <span style="position: absolute; left: 519px; top: 35px; font-size: 38px; font-family: Arial, Helvetica, sans-serif; font-style: italic;">Cadastre-se!</span> <span style="position: absolute; left: 554px; top: 58px; font-size: 12px; font-family: Arial, Helvetica, sans-serif;">Assim podemos chegar até você</span> <span style="position: absolute; left: 525px; top: 80px; color: #FF5700; font-size: 12px; font-family: Arial, Helvetica, sans-serif;">sign up so we can reach you!</span> <span
						style="position: absolute; left: 525px; top: 95px; color: #FF5700; font-size: 12px; font-family: Arial, Helvetica, sans-serif;"
					>inscribirse para que podamos alcanzar!</span>

					<div id="div_facebook" style="position: absolute; right: 30px; top: 30px; width: 150px; height: 100px; background-color: yellow1; visibility: hidden;">
						<button id="consultar" style="position: relative; left: 15px; top: 10px; width: 120px; height: 40px;" type="button" class="btn btn-primary">Consultar</button>
						<div style="position: relative; left: 10px; top: 15px; width: 130px; color: black; text-align: center; line-height: 15px; font-family: Arial, Helvetica, sans-serif; font-size: 13px; background-color: green1;">buscar meus dados no Facebook</div>
					</div>

					<!--
					<div class="control-group" style="margin-bottom: 15px; ">
						<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px;"></label>
						<div class="controls" style="margin-left: 290px;">
							<button type="button" id="consultar" class="btn btn-primary">Facebook</button>&nbsp;&nbsp;&nbsp;<span class="mensagem">Clique aqui para preencher com as informações do Facebook</span>
						</div>
					</div>
					-->

					<form id="dataForm" class="form-horizontal" style="position: absolute; left: 115px; top: 194px;" method="post" action="saveUserInformations">
						<fieldset>

							<span id="div_msg_erro_nome" class="label label-important" style="position: absolute; padding: 8px; left: 680px; top: 0px; visibility: hidden;">Digite seu nome (3 ou mais caracteres)</span> <span id="div_msg_erro_email" class="label label-important" style="position: absolute; padding: 8px; left: 680px; top: 80px; visibility: hidden;">Digite seu email</span> <span id="div_msg_erro_senha" class="label label-important" style="position: absolute; padding: 8px; left: 520px; top: 120px; visibility: hidden;">Informe uma senha (5 a 10 caracteres)</span> <span id="div_msg_erro_data" class="label label-important"
								style="position: absolute; padding: 8px; left: 840px; top: 320px; visibility: hidden;"
							>Data inválida</span>

							<div id="div_nome" class="control-group" style="margin-bottom: 7px; width: 150px;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="nome"> <span class="texto_black">Nome</span><br /> <span class="texto_orange">Name / Nombre</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<input id="nome" class="span5" name="nome" type="text" maxlength="50" />
								</div>
							</div>

							<div id="div_sobrenome" class="control-group" style="margin-bottom: 7px;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="sobrenome"> <span class="texto_black">Sobrenome</span><br /> <span class="texto_orange">Surname / Apelido</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<input id="sobrenome" class="span5" name="sobrenome" type="text" maxlength="50" />
								</div>
							</div>

							<div id="div_email" class="control-group" style="margin-bottom: 9px;">
								<label class="control-label" style="width: 280px;" for="email"> <span class="texto_black">Email</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<input id="email" class="span5" name="email" type="text" maxlength="30" />
								</div>
							</div>

							<div id="div_senha" class="control-group" style="margin-bottom: 7px;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="senha"> <span class="texto_black">Senha</span><br /> <span class="texto_orange">Password / Contraseña</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<input id="senha" class="span3" name="senha" type="password" maxlength="20" />
								</div>
							</div>

							<div id="div_endereco" class="control-group" style="margin-bottom: 7px;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="endereco"> <span class="texto_black">Endereço</span><br /> <span class="texto_orange">Address / Dirección</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<input id="endereco" class="span7" name="endereco" type="text" maxlength="100" />
								</div>
							</div>

							<div id="div_cidade" class="control-group" style="float: left; margin-bottom: 7px; width: 520px; background-color: yellow1;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="city"> <span class="texto_black">Cidade</span><br /> <span class="texto_orange">City / Ciudad</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<!-- 
									<select id="City" class="span3" name="City">
										<option selected="selected"></option>
										<option>Abaetetuba</option><option>Águas Lindas de Goiás</option><option>Alegrete</option><option>Almirante Tamandaré</option><option>Altamira</option><option>Alvorada</option><option>Americana</option><option>Amparo</option><option>Ananindeua</option><option>Anápolis</option><option>Angra dos Reis</option><option>Aparecida de Goiânia</option><option>Apucarana</option><option>Aracaju</option><option>Araguari</option><option>Araguaína</option><option>Arapongas</option><option>Araraquara</option><option>Araras</option><option>Araruama</option><option>Araucária</option><option>Araçatuba</option><option>Araxá</option><option>Ariquemes</option><option>Arujá</option><option>Assis</option><option>Atibaia</option><option>Avaré</option><option>Bagé</option><option>Balneário Camboriú</option><option>Barbacena</option><option>Barra Mansa</option><option>Barra do Garças</option><option>Barretos</option><option>Barueri</option><option>Bauru</option><option>Bebedouro</option><option>Belford Roxo</option><option>Belo Horizonte</option><option>Belém</option><option>Bento Gonçalves</option><option>Betim</option><option>Biguaçu</option><option>Birigui</option><option>Blumenau</option><option>Boa Vista</option><option>Bom Despacho</option><option>Botucatu</option><option>Bragança</option><option>Bragança Paulista</option><option>Brasília</option><option>Brusque</option><option>Cabedelo</option><option>Cabo Frio</option><option>Cáceres</option><option>Cachoeira do Sul</option><option>Cachoeirinha</option><option>Cachoeiro de Itapemirim</option><option>Cacoal</option><option>Caldas Novas</option><option>Cambé</option><option>Campina Grande</option><option>Campinas</option><option>Campo Bom</option><option>Campo Grande</option><option>Campo Largo</option><option>Campo Magro</option><option>Campo Mourão</option><option>Campos dos Goytacazes</option><option>Canoas</option><option>Caraguatatuba</option><option>Carapicuíba</option><option>Carazinho</option><option>Cariacica</option><option>Caruaru</option><option>Cascavel</option><option>Castanhal</option><option>Catalão</option><option>Catanduva</option><option>Caxias do Sul</option><option>Caçapava</option><option>Chapecó</option><option>Cianorte</option><option>Colatina</option><option>Colombo</option><option>Conselheiro Lafaiete</option><option>Contagem</option><option>Coronel Fabriciano</option><option>Corumbá</option><option>Cruz Alta</option><option>Cruzeiro</option><option>Cuiabá</option><option>Curitiba</option><option>Diadema</option><option>Dourados</option><option>Duque de Caxias</option><option>Embu</option><option>Erechim</option><option>Esteio</option><option>Fazenda Rio Grande</option><option>Feira de Santana</option><option>Ferraz de Vasconcelos</option><option>Florianópolis</option><option>Formosa</option><option>Fortaleza</option><option>Foz do Iguaçu</option><option>Franca</option><option>Francisco Morato</option><option>Franco da Rocha</option><option>Goiânia</option><option>Governador Valadares</option><option>Gravataí</option><option>Guajará-Mirim</option><option>Guarapari</option><option>Guarapuava</option><option>Guaratinguetá</option><option>Guarujá</option><option>Guarulhos</option><option>Guaíba</option><option>Hortolândia</option><option>Ibirité</option><option>Ijuí</option><option>Imbituba</option><option>Imperatriz</option><option>Indaiatuba</option><option>Inhumas</option><option>Ipatinga</option><option>Itabira</option><option>Itaboraí</option><option>Itacoatiara</option><option>Itaguaí</option><option>Itaituba</option><option>Itajaí</option><option>Itajubá</option><option>Itanhaém</option><option>Itaperuna</option><option>Itapetininga</option><option>Itapevi</option><option>Itaquaquecetuba</option><option>Itaúna</option><option>Itu</option><option>Ituiutaba</option><option>Itumbiara</option><option>Içara</option><option>Jaboatão dos Guararapes</option><option>Jacareí</option><option>Jandira</option><option>Japeri</option><option>Jaraguá do Sul</option><option>Jataí</option><option>Jaú</option><option>Ji-Paraná</option><option>João Pessoa</option><option>Joinville</option><option>Juazeiro do Norte</option><option>Juiz de Fora</option><option>Jundiaí</option><option>Lages</option><option>Lajeado</option><option>Lavras</option><option>Leme</option><option>Limeira</option><option>Linhares</option><option>Londrina</option><option>Lorena</option><option>Luziânia</option><option>Macaé</option><option>Macapá</option><option>Maceió</option><option>Magé</option><option>Manaus</option><option>Marabá</option><option>Maracanaú</option><option>Maringá</option><option>Marituba</option><option>Marília</option><option>Matão</option><option>Mauá</option><option>Mogi Guaçu</option><option>Mogi das Cruzes</option><option>Moji-Mirim</option><option>Montes Claros</option><option>Mossoró</option><option>Muriaé</option><option>Natal</option><option>Nilópolis</option><option>Niterói</option><option>Nova Friburgo</option><option>Nova Iguaçu</option><option>Nova Odessa</option><option>Novo Gama</option><option>Novo Hamburgo</option><option>Olinda</option><option>Osasco</option><option>Ourinhos</option><option>Palhoça</option><option>Palmas</option><option>Paragominas</option><option>Paranaguá</option><option>Parauapebas</option><option>Parintins</option><option>Parnamirim</option><option>Parnaíba</option><option>Passo Fundo</option><option>Passos</option><option>Patos de Minas</option><option>Paulista</option><option>Paço do Lumiar</option><option>Pelotas</option><option>Petrolina</option><option>Petrópolis</option><option>Pimenta Bueno</option><option>Pindamonhangaba</option><option>Pinhais</option><option>Piracicaba</option><option>Planaltina</option><option>Ponta Grossa</option><option>Ponta Porã</option><option>Porto Alegre</option><option>Porto Velho</option><option>Pouso Alegre</option><option>Poá</option><option>Poços de Caldas</option><option>Praia Grande</option><option>Presidente Prudente</option><option>Queimados</option><option>Recife</option><option>Redenção</option><option>Resende</option><option>Ribeirão Preto</option><option>Ribeirão das Neves</option><option>Rio Branco</option><option>Rio Claro</option><option>Rio Grande</option><option>Rio Verde</option><option>Rio de Janeiro</option><option>Rio do Sul</option><option>Rolim de Moura</option><option>Rondonópolis</option><option>Sabará</option><option>Salto</option><option>Salvador</option><option>Santa Bárbara dOeste</option><option>Santa Cruz do Sul</option><option>Santa Luzia</option><option>Santa Maria</option><option>Santana</option><option>Santana de Parnaíba</option><option>Santana do Livramento</option><option>Santarém</option><option>Santo André</option><option>Santo Antônio do Descober</option><option>Santos</option><option>Santo Ângelo</option><option>Sapiranga</option><option>Sapucaia do Sul</option><option>Sarandi</option><option>Sarzedo</option><option>Senador Canedo</option><option>Serra</option><option>Sertãozinho</option><option>Sete Lagoas</option><option>Sinop</option><option>Sorocaba</option><option>Sorriso</option><option>Sumaré</option><option>Suzano</option><option>São Bento do Sul</option><option>São Bernardo do Campo</option><option>São Borja</option><option>São Caetano do Sul</option><option>São Carlos</option><option>São Gonçalo</option><option>São João da Boa Vista</option><option>São João de Meriti</option><option>São João del Rei</option><option>São José</option><option>São José de Ribamar</option><option>São José do Rio Preto</option><option>São José dos Campos</option><option>São José dos Pinhais</option><option>São Leopoldo</option><option>São Luís</option><option>São Paulo</option><option>São Vicente</option><option>Tabapuã</option><option>Taboão da Serra</option><option>Tangará da Serra</option><option>Tatuí</option><option>Taubaté</option><option>Tefé</option><option>Telêmaco Borba</option><option>Teófilo Otoni</option><option>Teresina</option><option>Teresópolis</option><option>Timon</option><option>Timóteo</option><option>Toledo</option><option>Três Lagoas</option><option>Trindade</option><option>Tubarão</option><option>Tucuruí</option><option>Uberaba</option><option>Uberlândia</option><option>Ubá</option><option>Umuarama</option><option>Uruguaiana</option><option>Valinhos</option><option>Valparaíso de Goiás</option><option>Varginha</option><option>Vespasiano</option><option>Viamão</option><option>Vila Velha</option><option>Vilhena</option><option>Vinhedo</option><option>Vitória</option><option>Vitória da Conquista</option><option>Volta Redonda</option><option>Votorantim</option><option>Várzea Grande</option><option>Várzea Paulista</option><option>Xangri-lá</option><option>Xanxerê</option>
										<option>Outra Cidade / Other City</option>			
									</select>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
									 -->
									<input id="city" class="span3" style="margin: 0 auto;" name="city" type="text" maxlength="50" data-provide="typeahead" data-items="15"
										data-source='["São Paulo", "Brasília", "Rio de Janeiro", "Curitiba", "Belo Horizonte", "Goiânia", "Campinas", "Manaus", "Fortaleza", "Guarulhos", "Porto Alegre", "Salvador", "São Luís", "Campo Grande", "Aparecida de Goiânia", "Uberlândia", "Ribeirão Preto", "Cuiabá", "Belém", "Recife", "Londrina", "São José do Rio Preto", "Joinville", "Teresina", "Natal", "Contagem", "Nova Iguaçu", "Canoas", "São José dos Campos", "São Gonçalo", "João Pessoa", "Maceió", "São Bernardo do Campo", "Sorocaba", "Duque de Caxias", "Serra", "Várzea Grande", "Uberaba", "Betim", "Feira de Santana", "Itaquaquecetuba", "Ananindeua", "Bauru", "Juiz de Fora", "Caxias do Sul", "Santo André", "Belford Roxo", "Foz do Iguaçu", "Osasco", "Cascavel", "Barueri", "Mogi das Cruzes", "Vila Velha", "Maringá", "Anápolis", "Vitória", "Novo Hamburgo", "Jundiaí", "Americana", "Passo Fundo", "Mauá", "Aracaju", "Pelotas", "Ribeirão das Neves", "São Leopoldo", "São José de Ribamar", "Rio Branco", "Santa Maria", "Blumenau", "Santa Bárbara dOeste", "Campina Grande", "Santos", "Suzano", "Porto Velho", "Cariacica", "Dourados", "Gravataí", "Campos dos Goytacazes", "Palmas", "Itanhaém", "Araraquara", "Montes Claros", "Rondonópolis", "Colombo", "Luziânia", "Imbituba", "Chapecó", "Sumaré", "Ponta Grossa", "São João de Meriti", "Sete Lagoas", "Santa Luzia", "São Carlos", "São José dos Pinhais", "Itaboraí", "Alvorada", "Macapá", "São José", "Florianópolis", "Rio Grande", "Piracicaba", "Guarapuava", "Marabá", "Ibirité", "Santarém", "Campo Magro", "Olinda", "Formosa", "Jacareí", "Rio Claro", "Valinhos", "Boa Vista", "Diadema", "Arujá", "Volta Redonda", "Paço do Lumiar", "Franca", "Nova Odessa", "Pinhais", "Carapicuíba", "Taubaté", "Guarujá", "Poços de Caldas", "Hortolândia", "Petrolina", "Águas Lindas de Goiás", "Governador Valadares", "Esteio", "Vitória da Conquista", "Cruz Alta", "Valparaíso de Goiás", "Jaboatão dos Guararapes", "Ji-Paraná", "Catalão", "Marília", "Ipatinga", "Patos de Minas", "Sapucaia do Sul", "Magé", "Praia Grande", "Corumbá", "Cambé", "Petrópolis", "Itajaí", "Varginha", "Rio Verde", "Taboão da Serra", "Araguaína", "Itapevi", "São Vicente", "Angra dos Reis", "Parnamirim", "Araucária", "Teófilo Otoni", "Trindade", "Araçatuba", "Viamão", "Palhoça", "Itumbiara", "Uruguaiana", "Três Lagoas", "Novo Gama", "Cachoeirinha", "Castanhal", "Indaiatuba", "Planaltina", "Rolim de Moura", "Apucarana", "Jataí", "Carazinho", "Itu", "Campo Bom", "Sinop", "Bagé", "Cachoeiro de Itapemirim", "Paulista", "Cacoal", "Cáceres", "Jaraguá do Sul", "Tabapuã", "Caruaru", "Presidente Prudente", "Barra Mansa", "Queimados", "Santa Cruz do Sul", "Linhares", "Paranaguá", "Almirante Tamandaré", "Guaíba", "Lages", "Ferraz de Vasconcelos", "Bragança Paulista", "Poá", "Rio do Sul", "Santo Ângelo", "Pindamonhangaba", "Santana", "Cabedelo", "Imperatriz", "Santana de Parnaíba", "São Caetano do Sul", "Parnaíba", "Mogi Guaçu", "Itaituba", "Francisco Morato", "Embu", "Toledo", "Itapetininga", "Abaetetuba", "Santana do Livramento", "Catanduva", "Barbacena", "Niterói", "Guajará-Mirim", "Sapiranga", "Umuarama", "Arapongas", "Cabo Frio", "Erechim", "Botucatu", "Cachoeira do Sul", "Maracanaú", "Ponta Porã", "Conselheiro Lafaiete", "Barretos", "Campo Largo", "Guaratinguetá", "Votorantim", "Araras", "Pouso Alegre", "Sabará", "Atibaia", "Alegrete", "Altamira", "Coronel Fabriciano", "Resende", "Campo Mourão", "Marituba", "Nova Friburgo", "Tangará da Serra", "Jaú", "Tucuruí", "Balneário Camboriú", "Brusque", "Macaé", "Araguari", "Caçapava", "Juazeiro do Norte", "Pimenta Bueno", "Senador Canedo", "Colatina", "Parauapebas", "Redenção", "Salto", "Birigui", "Franco da Rocha", "Limeira", "Sertãozinho", "Itabira", "Jandira", "Ourinhos", "Paragominas", "Parintins", "Passos", "Biguaçu", "Santo Antônio do Descober", "Tubarão", "Bragança", "Sarandi", "Várzea Paulista", "Barra do Garças", "Caldas Novas", "Içara", "Tatuí", "Xangri-lá", "Ariquemes", "Ijuí", "Assis", "Ituiutaba", "Japeri", "Xanxerê", "Bento Gonçalves", "Guarapari", "Mossoró", "Nilópolis", "Timon", "Teresópolis", "Itaguaí", "Leme", "Araxá", "Itaperuna", "Sorriso", "Vilhena", "Cianorte", "Itajubá", "Ubá", "Amparo", "São Bento do Sul", "Araruama", "Caraguatatuba", "Cruzeiro", "Lorena", "Sarzedo", "Lajeado", "Lavras", "São João del Rei", "Vespasiano", "Moji-Mirim", "Avaré", "Fazenda Rio Grande", "Tefé", "Itaúna", "São João da Boa Vista", "Telêmaco Borba", "Timóteo", "Itacoatiara", "Bebedouro", "Inhumas", "São Borja", "Vinhedo", "Bom Despacho", "Matão", "Muriaé"]'
									/>
								</div>
							</div>

							<!-- 
							<div id="div_pais" class="control-group" style="position: relative; left: 520px; top: -40px; width: 340px; margin-bottom: 7px; background-color: yellow1;">
							 -->

							<div id="div_pais" class="control-group" style="float: left; margin-bottom: 7px; width: 340px; background-color: yellow1;">
								<label class="control-label" style="padding: 0px; width: 100px; line-height: 14px; background-color: yellow1;" for="country"> <span class="texto_black">País</span><br /> <span class="texto_orange">Country / País</span>
								</label>
								<div class="controls" style="margin-left: 110px;">
									<!-- 
									<select id="Country" class="span3" name="Country">
										<option selected="selected"></option>
										<option>Afghanistan</option><option>Åland Islands</option><option>Albania</option><option>Algeria</option><option>American Samoa</option><option>Andorra</option><option>Angola</option><option>Anguilla</option><option>Antarctica</option><option>Antigua And Barbuda</option><option>Argentina</option><option>Armenia</option><option>Aruba</option><option>Australia</option><option>Austria</option><option>Azerbaijan</option><option>Bahamas</option><option>Bahrain</option><option>Bangladesh</option><option>Barbados</option><option>Belarus</option><option>Belgium</option><option>Belize</option><option>Benin</option><option>Bermuda</option><option>Bhutan</option><option>Bolivia</option><option>Bonaire, Sint Eustatius and Saba</option><option>Bosnia and Herzegovina</option><option>Botswana</option><option>Bouvet Island</option><option>Brasil</option><option>British Indian Ocean Territory</option><option>Brunei Darussalam</option><option>Bulgaria</option><option>Burkina Faso</option><option>Burundi</option><option>Cambodia</option><option>Cameroon</option><option>Canada</option><option>Cape Verde</option><option>Cayman Islands</option><option>Central African Republic</option><option>Chad</option><option>Chile</option><option>China</option><option>Christmas Island</option><option>Cocos (Keeling) Islands</option><option>Colombia</option><option>Comoros</option><option>Congo</option><option>Congo, the Democratic Republic of the</option><option>Cook Islands</option><option>Costa Rica</option><option>Côte d'Ivoire</option><option>Croatia</option><option>Cuba</option><option>Curaçao</option><option>Cyprus</option><option>Czech Republic</option><option>Denmark</option><option>Djibouti</option><option>Dominica</option><option>Dominican Republic</option><option>Ecuador</option><option>Egypt</option><option>El Salvador</option><option>Equatorial Guinea</option><option>Eritrea</option><option>Estonia</option><option>Ethiopia</option><option>Falkland Islands (Malvinas)</option><option>Faroe Islands</option><option>Fiji</option><option>Finland</option><option>France</option><option>French Guiana</option><option>French Polynesia</option><option>French Southern Territories</option><option>Gabon</option><option>Gambia</option><option>Georgia</option><option>Germany</option><option>Ghana</option><option>Gibraltar</option><option>Greece</option><option>Greenland</option><option>Grenada</option><option>Guadeloupe</option><option>Guam</option><option>Guatemala</option><option>Guernsey</option><option>Guinea</option><option>Guinea-Bissau</option><option>Guyana</option><option>Haiti</option><option>Heard Island and McDonald Islands</option><option>Holy See (Vatican City State)</option><option>Honduras</option><option>Hong Kong</option><option>Hungary</option><option>Iceland</option><option>India</option><option>Indonesia</option><option>Iran, Islamic Republic of</option><option>Iraq</option><option>Ireland</option><option>Isle of Man</option><option>Israel</option><option>Italy</option><option>Jamaica</option><option>Japan</option><option>Jersey</option><option>Jordan</option><option>Kazakhstan</option><option>Kenya</option><option>Kiribati</option><option>Korea, Democratic People's Republic of</option><option>Korea, Republic of</option><option>Kuwait</option><option>Kyrgyzstan</option><option>Lao People's Democratic Republic</option><option>Latvia</option><option>Lebanon</option><option>Lesotho</option><option>Liberia</option><option>Libyan Arab Jamahiriya</option><option>Liechtenstein</option><option>Lithuania</option><option>Luxembourg</option><option>Macao</option><option>Macedonia, The Former Yugoslav Republic Of</option><option>Madagascar</option><option>Malawi</option><option>Malaysia</option><option>Maldives</option><option>Mali</option><option>Malta</option><option>Marshall Islands</option><option>Martinique</option><option>Mauritania</option><option>Mauritius</option><option>Mayotte</option><option>Mexico</option><option>Micronesia, Federated States of</option><option>Moldova, Republic of</option><option>Monaco</option><option>Mongolia</option><option>Montenegro</option><option>Montserrat</option><option>Morocco</option><option>Mozambique</option><option>Myanmar</option><option>Namibia</option><option>Nauru</option><option>Nepal</option><option>Netherlands</option><option>New Caledonia</option><option>New Zealand</option><option>Nicaragua</option><option>Niger</option><option>Nigeria</option><option>Niue</option><option>Norfolk Island</option><option>Northern Mariana Islands</option><option>Norway</option><option>Oman</option><option>Pakistan</option><option>Palau</option><option>Palestinian Territory, Occupied</option><option>Panama</option><option>Papua New Guinea</option><option>Paraguay</option><option>Peru</option><option>Philippines</option><option>Pitcairn</option><option>Poland</option><option>Portugal</option><option>Puerto Rico</option><option>Qatar</option><option>Réunion</option><option>Romania</option><option>Russian Federation</option><option>Rwanda</option><option>Saint Barthélemy</option><option>Saint Helena</option><option>Saint Kitts and Nevis</option><option>Saint Lucia</option><option>Saint Martin (French Part)</option><option>Saint Pierre and Miquelon</option><option>Saint Vincent and the Grenadines</option><option>Samoa</option><option>San Marino</option><option>Sao Tome and Principe</option><option>Saudi Arabia</option><option>Senegal</option><option>Serbia</option><option>Seychelles</option><option>Sierra Leone</option><option>Singapore</option><option>Sint Maarten (Dutch Part)</option><option>Slovakia</option><option>Slovenia</option><option>Solomon Islands</option><option>Somalia</option><option>South Africa</option><option>South Georgia and the South Sandwich Islands</option><option>South Sudan</option><option>Spain</option><option>Sri Lanka</option><option>Sudan</option><option>Suriname</option><option>Svalbard and Jan Mayen</option><option>Swaziland</option><option>Sweden</option><option>Switzerland</option><option>Syrian Arab Republic</option><option>Taiwan, Province of China</option><option>Tajikistan</option><option>Tanzania, United Republic of</option><option>Thailand</option><option>Timor-Leste</option><option>Togo</option><option>Tokelau</option><option>Tonga</option><option>Trinidad and Tobago</option><option>Tunisia</option><option>Turkey</option><option>Turkmenistan</option><option>Turks and Caicos Islands</option><option>Tuvalu</option><option>Uganda</option><option>Ukraine</option><option>United Arab Emirates</option><option>United Kingdom</option><option>United States</option><option>United States Minor Outlying Islands</option><option>Uruguay</option><option>Uzbekistan</option><option>Vanuatu</option><option>Venezuela</option><option>Vietnam</option><option>Virgin Islands, British</option><option>Virgin Islands, U.S.</option><option>Wallis and Futuna</option><option>Western Sahara</option><option>Yemen</option><option>Zambia</option><option>Zimbabwe</option>
										<option>Outro País/ Other Country</option>
									</select>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
									 -->
									<input id="country" style="margin: 0 auto; width: 185px;" name="country" type="text" maxlength="50" data-provide="typeahead" data-items="15"
										data-source='["Afghanistan", "Åland Islands", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua And Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bonaire, Sint Eustatius and Saba", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brasil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Côte dIvoire", "Croatia", "Cuba", "Curaçao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran, Islamic Republic of", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic Peoples Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao Peoples Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao", "Macedonia, The Former Yugoslav Republic Of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Palestinian Territory, Occupied", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Réunion", "Romania", "Russian Federation", "Rwanda", "Saint Barthélemy", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Martin (French Part)", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Sint Maarten (Dutch Part)", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard and Jan Mayen", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Timor-Leste", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands, British", "Virgin Islands, U.S.", "Wallis and Futuna", "Western Sahara", "Yemen", "Zambia", "Zimbabwe"]'
									/>
								</div>
							</div>

							<div id="div_formacao" class="control-group" style="float: none; margin-bottom: 7px;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="formacao"> <span class="texto_black">Formação</span><br /> <span class="texto_orange">Academic Training / Formación Academica</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<select id="formacao" class="span5" name="formacao">
										<option selected="selected"></option>
										<option>1. Grau</option>
										<option>2. Grau</option>
										<option>Curso Superior</option>
										<option>Mestrado</option>
										<option>Doutorado</option>
									</select>
								</div>
							</div>

							<div id="div_especialidade" class="control-group" style="margin-bottom: 7px;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="especialidade"> <span class="texto_black">Especialidade</span><br /> <span class="texto_orange">Speciality / Especialidad</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<select id="especialidade" class="span6" name="especialidade">
										<option selected="selected"></option>
										<option>Reabilitação Oral</option>
										<option>Cirurgia</option>
										<option>Pediodontia</option>
										<option>Implantodontia</option>
									</select>
								</div>
							</div>

							<div id="div_genero" class="control-group" style="float: left; margin-bottom: 7px; background-color: orange1;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="genero"> <span class="texto_black">Sexo</span><br /> <span class="texto_orange">Sex / Sexo</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<select id="genero" style="width: 130px;" name="genero">
										<option selected="selected"></option>
										<option>Masculino</option>
										<option>Feminino</option>
									</select>

								</div>
							</div>

							<div id="div_data" class="control-group" style="float: left; margin-bottom: 7px; background-color: green1;">
								<label class="control-label" style="padding: 0px; width: 246px; line-height: 14px; background-color: none;" for="data"> <span class="texto_black">Data de Nascimento</span><br /> <span class="texto_orange">Birth Date / Fecha de Nacimiento</span>
								</label>
								<div class="controls" style="margin-left: 256px;">
									<input id="data" style="width: 140px;" name="data" type="text" placeholder="DD/MM/YYYY">
								</div>
							</div>

							<div id="div_cpf" class="control-group" style="float: left; margin-bottom: 7px; background-color: yellow1;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="cpf"> <span class="texto_black">CPF</span><br /> <span class="texto_orange">Social Security / Identificatión Tributaria</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<input id="cpf" style="width: 116px;" name="cpf" type="text">
								</div>
							</div>

							<div id="div_rg" class="control-group" style="float: left; margin-bottom: 7px;">
								<label class="control-label" style="padding: 0px; width: 246px; line-height: 14px; background-color: none;" for="rg"> <span class="texto_black">RG</span><br /> <span class="texto_orange">Drive License / Documento Identidad</span>
								</label>
								<div class="controls" style="margin-left: 256px;">
									<input id="rg" style="width: 140px;" name="rg" type="text" maxlength="20" />
								</div>
							</div>


							<div id="div_texto" class="control-group" style="margin-bottom: 7px;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;" for="texto"> <span class="texto_black">Comentário</span><br /> <span class="texto_orange">Comment / Comentario</span>
								</label>
								<div class="controls" style="margin-left: 290px;">
									<textarea id="texto" class="span7" style="height: 70px;" name="texto" maxlength="250"></textarea>
								</div>
							</div>

							<div id="div_info" class="control-group" style="margin-bottom: 15px;">
								<label class="control-label" style="padding: 0px; width: 280px; line-height: 14px; background-color: none;"></label>
								<div class="controls" style="margin-left: 290px;">
									<label class="checkbox"> <input id="info" name="info" type="checkbox" checked="checked" />Quero receber informações da In Focus <span class="texto_orange" style="position: relative; top: -6px; font-size: 11px; font-family: Arial, Helvetica, sans-serif;"><br />I want to receive information from In Focus / Quiero recibir información de In Focus</span>
									</label> <label class="checkbox"> <input id="infoparceiros" name="infoparceiros" type="checkbox" checked="checked" />Quero receber informações de parceiros da In Focus <span class="texto_orange" style="position: relative; top: -6px; font-size: 11px; font-family: Arial, Helvetica, sans-serif;"><br />I want to receive information from partnes In Focus / Quiero recibir información de los socios In Focus</span>
									</label>
								</div>
							</div>

							<input type="hidden" name="geo_city" value=""> <input type="hidden" name="geo_region" value=""> <input type="hidden" name="geo_country" value=""> <input type="hidden" name="geo_country_code" value=""> <input type="hidden" name="facebook" value="">

						</fieldset>
					</form>

					<div style="position: absolute; bottom: 50px; width: 100%;">
						<div class="controls" style="position: absolute; left: 50px;">
							<button id="voltar" class="btn" type="button">
								<i class="icon-home"></i>&nbsp;&nbsp;Voltar para a Página Inicial
							</button>
						</div>
						<div class="controls" style="position: absolute; right: 50px;">
							<button id="save" class="btn btn-primary" type="button">Enviar Informações</button>
						</div>
					</div>

					<!-- 
					<div id="div_message" class="alert alert-error" style="position: absolute; left: 500px; top: 770px; visibility: hidden;">
						<h4>Atenção!</h4>
						Por favor, informe seu Nome, Email e Senha
					</div>
					-->

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="//j.maxmind.com/app/geoip.js"></script>
	<script>
		(function()
		{
			$("#dataForm input[name='geo_city']").val(geoip_city());
			$("#dataForm input[name='geo_region']").val(geoip_region_name());
			$("#dataForm input[name='geo_country']").val(geoip_country_name());
			$("#dataForm input[name='geo_country_code']").val(geoip_country_code());

			document.getElementById('div_info_geo').innerHTML += "<span style='color: blue;'>Geo Localização</span><br />";
			document.getElementById('div_info_geo').innerHTML += "<span style='color: blue;'>Cidade: </span>" + geoip_city() + "<br />";
			document.getElementById('div_info_geo').innerHTML += "<span style='color: blue;'>Estado: </span>" + geoip_region_name() + "<br />";
			document.getElementById('div_info_geo').innerHTML += "<span style='color: blue;'>País: </span>" + geoip_country_name() + " - " + geoip_country_code();
		})();
	</script>

</body>
</html>

</compress:html>
