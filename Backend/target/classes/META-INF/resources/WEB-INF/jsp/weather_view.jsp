<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Weather API</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/scroll_behaviour.css">
	<style>
		body {
			background-color: #f5f5f5;
		}

		.container {
			background-color: #fff;
			border-radius: 8px;
			margin-top: 20px;
			padding: 15px;
		}

		.navbar {
			margin-bottom: 20px;
		}

		.tab-pane {
			padding: 15px;
		}

		.login-banner {
			background-color: #15ffaa;
			text-align: center;
			padding: 10px;
			border-radius: 8px 8px 0 0;
		}

		.search-form {
			margin-top: 20px;
		}

		.iso-codes {
			background-color: #f5f5f5;
			border-radius: 8px;
			padding: 10px;
			margin-top: 20px;
		}
	</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="#">Weather App</a>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" id="weather-tab" data-toggle="tab" href="#weather" role="tab" aria-controls="weather" aria-selected="true">Weather</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="false">Login</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="registration-tab" data-toggle="tab" href="#registration" role="tab" aria-controls="registration" aria-selected="false">Registration</a>
			</li>
		</ul>
	</div>
</nav>

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

	<script>
		//Inline JS
		function addISOCode(country){

		let addISO = document.getElementById("country");

		addISO.value = country;
	}</script>
</body>
</html>
