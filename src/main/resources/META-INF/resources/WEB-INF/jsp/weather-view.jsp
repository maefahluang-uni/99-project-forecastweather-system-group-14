<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="https://image.ibb.co/fOur3b/favicon.png"/>
	<meta name="theme-color" content="#1885ed">
	<title>Bricks.io - Weather - Homepage</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/scroll_behaviour.css">
	<style>
		html, body {
			margin: 0;
			padding: 0;
			font-family: 'Lato', sans-serif;
			color: #1f4568;
		}

		body {
			background-image: url("https://image.ibb.co/de6JzG/bitmap_1_1.png");
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
		}

		.container {
			background-color: #fff;
			border-radius: 8px;
			padding: 15px;
			max-width: 1140px;
			margin: 0 auto;
		}

		.tab-pane {
			padding: 15px;
		}

		.search-form {
			margin-top: 20px;
		}

		.login-banner {
			background-color: #15ffaa;
			text-align: center;
			padding: 10px;
			border-radius: 8px 8px 0 0;
		}

		.header {
			padding: 30px 25px;
		}

		.header__elenco {
			padding: 0;
			margin: 0;
			list-style: none;
		}

		.header__menu {
			float: right;
		}

		.header__el {
			display: block;
			padding: 10px 20px;
			border-top: 1px solid #ededed;
		}

		.header__el--blue{
			background-color:#3a9fff;
		}

		.header__img {
			display: inline-block;
			vertical-align: middle;
		}

		.header__menu {
			display: inline-block;
			vertical-align: middle;
		}

		.header__title {
			font-size: 18px;
			margin: 0;
			margin-left: 10px;
			display: inline-block;
			line-height: 18px;
			vertical-align: middle;
		}

		.header__light {
			color: #8198ae;
		}

		.header__link {
			color: #1f4568;
			font-size: 14px;
		}

		.header__link:hover {
			text-decoration: none;
			color: #3a9fff;
		}
	</style>
</head>
<body>
<header class="header">
	<div class="container header__container">
		<div class="header__logo"><img class="header__img" src="https://image.ibb.co/kcVou6/path3000.png"> <h1 class="header__title">Bricks<span class="header__light">.io</span></h1></div>
		<button type="button" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<div class="header__menu">
			<nav id="navbar" class="header__nav collapse">
				<ul class="header__elenco">
					<li class="header__el"><a href="/" class="header__link">Home</a></li>
					<li class="header__el"><a href="/current/weather" class="header__link">Current Weather</a></li>
					<li class="header__el header__el--blue"><a href="" class="btn btn--white">Sign In →</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<div class="container">
	<div class="login-banner">
		<h1>Welcome to Weather App!</h1>
		<p>Login to access more features.</p>
	</div>

	<div class="tab-content" id="myTabContent">
		<!-- Weather Search Tab -->
		<div class="tab-pane fade show active" id="weather" role="tabpanel" aria-labelledby="weather-tab">
			<div class="search-form">
				<form action="" method="get">
					<div class="input-group">
						<input class="form-control" name="city" type="text" placeholder="Your city" required/>
						<input class="form-control" id="country" name="country" type="text" value="" placeholder="Your country's ISO code (not required)"/>
						<div class="input-group-append">
							<button type="submit" formaction="/current/weather" name="current" class="btn btn-success btn-sm">Current Weather</button>
							<button type="submit" formaction="/five_day/forecast" name="five_day" class="btn btn-info btn-sm">5 Day Forecast</button>
						</div>
					</div>
				</form>
			</div>
			<c:if test="${error}">
				<p style="color: red; text-align: center;">Invalid entry.</p>
			</c:if>
		</div>
	</div>

	<!-- ISO codes -->
	<div id = "iso_codes" class = "card-body" align = "center">

		<h3 style = "text-decoration: underline;">Countries and their ISO codes</h3><br/>

		<p>To search for your country, hold 'Ctrl' and press 'F' and then enter your country</p>

		<table class = "table table-striped table-sm">

			<thead style = "background-color: #000000; color: #ffffff">
			<tr>
				<td>
					Country
				</td>
				<td>
					ISO Code
				</td>
			</tr>
			</thead>

			<tbody>
			<c:forEach items="${codes}" var="list">

				<tr>
					<td>
							${list.key}
					</td>
					<td>
						<a href = "#weather_search">
							<button id = "iso_code" class = "btn btn-outline-info btn-sm" value = "${list.value}" onclick = "addISOCode(value)">${list.value}</button>
						</a>
					</td>
				</tr>

			</c:forEach>
			</tbody>

		</table>

	</div>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	<script>
		//Inline JS
		function addISOCode(country){

		let addISO = document.getElementById("country");

		addISO.value = country;
	}
	</script>
</body>
</html>
