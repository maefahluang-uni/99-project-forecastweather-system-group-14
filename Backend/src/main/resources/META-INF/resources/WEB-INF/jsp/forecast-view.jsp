<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>${city}'s Five Day Forecast</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		  crossorigin="anonymous">

</head>
<body>

<header style = "background-color: #15ffaa; text-align: center;">
	<strong style = "font-size: 30px;">${city}'s five day weather forecast</strong><br/>
	<a href = "/" class = "btn btn-link">Return to weather search</a>
</header>

<div class = "card-body">

	<table class = "table table-hover table-sm" style = "table-layout: fixed; width: 100%;">

		<tbody>
		<tr>
			<td>
				<button class = "btn btn-info btn-lg" style = "width: 100%;" value = "${days[0]}" onclick = "showDay0(value)">
					${days[0]}
					<p style = "text-align: center; font-size: 15px; padding-top: 5px; padding-bottom: 5px;">Today</p>
				</button>
			</td>
			<td>
				<button class = "btn btn-info btn-lg" style = "width: 100%;" value = "${days[1]}" onclick = "showDay1(value)">
					${days[1]}
					<p style = "text-align: center; font-size: 15px; padding-top: 5px; padding-bottom: 5px;">Tomorrow</p>
				</button>
			</td>
			<td>
				<button class = "btn btn-info btn-lg" style = "width: 100%;" value = "${days[2]}" onclick = "showDay2(value)">
					${days[2]}
						<p style = "text-align: center; font-size: 15px; padding-top: 5px; padding-bottom: 5px;"></p>
				</button>
			</td>
			<td>
				<button class = "btn btn-info btn-lg" style = "width: 100%;" value = "${days[3]}" onclick = "showDay3(value)">
					${days[3]}
						<p style = "text-align: center; font-size: 15px; padding-top: 5px; padding-bottom: 5px;"></p>
				</button>
			</td>
			<td>
				<button class = "btn btn-info btn-lg" style = "width: 100%;" value = "${days[4]}" onclick = "showDay4(value)">
					${days[4]}
						<p style = "text-align: center; font-size: 15px; padding-top: 5px; padding-bottom: 5px;"></p>
				</button>
			</td>
		</tr>
		</tbody>

	</table>

	<table class = "table table-striped table-sm" style = "table-layout: fixed; width: 100%;">

		<thead>
		<tr style = "background-color: #000000; color: #ffffff;">
			<td id = "current_day" style = "background-color: #15ffaa; color: #150015">
				${days[0]} (Today)
			</td>
			<td>Country</td>
			<td>Country (ISO code)</td>
			<td>Temperature (&#176;C)</td>
			<td>Minimum temperature (&#176;C)</td>
			<td>Maximum temperature (&#176;C)</td>
			<td>Weather</td>
			<td>Weather description</td>
			<td>Pressure</td>
			<td>Humidity</td>
		</tr>
		</thead>

		<!-- Today -->
		<tbody id = "day0">
		<c:forEach items = "${weather_data[0]}" var = "list">
			<tr>
				<td>${list.time}</td>
				<td>${list.country}</td>
				<td>${list.countryISOCode}</td>
				<td>${list.temperature}</td>
				<td>${list.tempMin}</td>
				<td>${list.tempMax}</td>
				<td>${list.weather}</td>
				<td>${list.weatherDesc}</td>
				<td>${list.pressure}</td>
				<td>${list.humidity}</td>
			</tr>
		</c:forEach>
		</tbody>

		<!-- Tomorrow -->
		<tbody id = "day1" style = "visibility: collapse">
		<c:forEach items = "${weather_data[1]}" var = "list">
			<tr>
				<td>${list.time}</td>
				<td>${list.country}</td>
				<td>${list.countryISOCode}</td>
				<td>${list.temperature}</td>
				<td>${list.tempMin}</td>
				<td>${list.tempMax}</td>
				<td>${list.weather}</td>
				<td>${list.weatherDesc}</td>
				<td>${list.pressure}</td>
				<td>${list.humidity}</td>
			</tr>
		</c:forEach>
		</tbody>

		<!-- 3rd day -->
		<tbody id = "day2" style = "visibility: collapse">
		<c:forEach items = "${weather_data[2]}" var = "list">
			<tr>
				<td>${list.time}</td>
				<td>${list.country}</td>
				<td>${list.countryISOCode}</td>
				<td>${list.temperature}</td>
				<td>${list.tempMin}</td>
				<td>${list.tempMax}</td>
				<td>${list.weather}</td>
				<td>${list.weatherDesc}</td>
				<td>${list.pressure}</td>
				<td>${list.humidity}</td>
			</tr>
		</c:forEach>
		</tbody>

		<!-- 4th day -->
		<tbody id = "day3" style = "visibility: collapse">
		<c:forEach items = "${weather_data[3]}" var = "list">
			<tr>
				<td>${list.time}</td>
				<td>${list.country}</td>
				<td>${list.countryISOCode}</td>
				<td>${list.temperature}</td>
				<td>${list.tempMin}</td>
				<td>${list.tempMax}</td>
				<td>${list.weather}</td>
				<td>${list.weatherDesc}</td>
				<td>${list.pressure}</td>
				<td>${list.humidity}</td>
			</tr>
		</c:forEach>
		</tbody>

		<!-- 5th day -->
		<tbody id = "day4" style = "visibility: collapse">
		<c:forEach items = "${weather_data[4]}" var = "list">
			<tr>
				<td>${list.time}</td>
				<td>${list.country}</td>
				<td>${list.countryISOCode}</td>
				<td>${list.temperature}</td>
				<td>${list.tempMin}</td>
				<td>${list.tempMax}</td>
				<td>${list.weather}</td>
				<td>${list.weatherDesc}</td>
				<td>${list.pressure}</td>
				<td>${list.humidity}</td>
			</tr>
		</c:forEach>
		</tbody>

	</table>

</div>

<script>/**
 *
 */
function showDay0(day){
	document.getElementById("current_day").innerHTML = day + " (Today)";
	document.getElementById("day0").style.visibility = "";
	document.getElementById("day1").style.visibility = "collapse";
	document.getElementById("day2").style.visibility = "collapse";
	document.getElementById("day3").style.visibility = "collapse";
	document.getElementById("day4").style.visibility = "collapse";
}

function showDay1(day){
	document.getElementById("current_day").innerHTML = day + " (Tomorrow)";
	document.getElementById("day0").style.visibility = "collapse";
	document.getElementById("day1").style.visibility = "";
	document.getElementById("day2").style.visibility = "collapse";
	document.getElementById("day3").style.visibility = "collapse";
	document.getElementById("day4").style.visibility = "collapse";
}

function showDay2(day){
	document.getElementById("current_day").innerHTML = day;
	document.getElementById("day0").style.visibility = "collapse";
	document.getElementById("day1").style.visibility = "collapse";
	document.getElementById("day2").style.visibility = "";
	document.getElementById("day3").style.visibility = "collapse";
	document.getElementById("day4").style.visibility = "collapse";
}

function showDay3(day){
	document.getElementById("current_day").innerHTML = day;
	document.getElementById("day0").style.visibility = "collapse";
	document.getElementById("day1").style.visibility = "collapse";
	document.getElementById("day2").style.visibility = "collapse";
	document.getElementById("day3").style.visibility = "";
	document.getElementById("day4").style.visibility = "collapse";
}

function showDay4(day){
	document.getElementById("current_day").innerHTML = day;
	document.getElementById("day0").style.visibility = "collapse";
	document.getElementById("day1").style.visibility = "collapse";
	document.getElementById("day2").style.visibility = "collapse";
	document.getElementById("day3").style.visibility = "collapse";
	document.getElementById("day4").style.visibility = "";
}</script>

</body>
</html>