<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Weather Forecast Dashboard</title>
	<!-- Include Tailwind CSS and Material UI styles -->
	<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" rel="stylesheet">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	<!-- Your custom CSS -->
	<style>
		body {
			font-family: 'Inter', sans-serif;
		}

		@media only screen and (max-width: 480px) {
			body {
				/* Adjust styles for screens up to 480px width */
			}
		}

		@media only screen and (min-width: 481px) and (max-width: 767px) {
			/* Styles for screens between 481px and 767px width */
		}

		@media only screen and (min-width: 768px) and (max-width: 991px) {
			/* Styles for screens between 768px and 991px width */
		}

		@media only screen and (min-width: 992px) and (max-width: 1199px) {
			/* Styles for screens between 992px and 1199px width */
		}

		@media only screen and (min-width: 1200px) and (max-width: 1399px) {
			/* Styles for screens between 1200px and 1399px width */
		}

		@media only screen and (min-width: 1400px) and (max-width: 1799px) {
			/* Styles for screens between 1400px and 1799px width */
		}

		@media only screen and (min-width: 1800px) {
			/* Styles for screens larger than 1800px width */
		}

		@media only screen and (min-width: 2560px) {
			/* Styles for 4K resolution screens */
		}


		.text-black {
			color: #000 !important;
		}

		.navbar {
			background-color: rgba(236, 236, 236, 1); /* Full opacity */
			border-bottom: 1px solid #dee2e6;
		}

		.card {
			border-radius: 15px;
			background-color: rgba(217, 217, 217, 0.75); /* 75% opacity */
			color: #000000; /* Set card text color to black */
		}

		.card-title {
			font-size: 20px;
			margin-bottom: 10px;
			color: #000000; /* Set card title color to black */
		}

		.card-text {
			font-size: 16px;
			color: #000000; /* Set card text color to black */
		}

		.btn {
			background-color: rgba(217, 217, 217, 1); /* Full opacity */
			color: #ffffff; /* Set button text color to white */
		}

		.card-body {
			padding: 20px; /* Adjust as needed for spacing between sections */
		}

		.card-body h4 {
			margin-bottom: 10px; /* Adjust as needed for spacing between elements */
		}

		#map {
			height: 400px;
		}
	</style>
</head>

<body class="bg-cover bg-center" style="background-image: url('/img/mian login 2 3.png'); color: #ffffff;">

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/">
		<!-- Your icon and description -->
		<img src="/img/img.png" width= class="d-inline-block align-top" alt="">
		OpenWeatherMap-API Provider
	</a>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a class="nav-link" href="#"><i class="fas fa-sign-in-alt"></i> Login</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#"><i class="fas fa-user-plus"></i> Sign Up</a>
			</li>
		</ul>
	</div>
</nav>

<!-- Main Content Area using Flexbox -->
<div class="container mx-auto py-8 flex">

	<!-- Left Side: 35% Width -->
	<div class="w-35 pr-8">

		<!-- First Huge Box {1} -->
		<div class="bg-gray-200 bg-opacity-75 rounded p-4 mb-4">
			<h1 class="text-2xl font-bold mb-2 text-black">Current Weather</h1>
			<p class="mb-2"><i class="fas fa-thermometer-half mr-2 text-black"></i> Temperature: ${weather.temperature} <span class="text-gray-600">&deg;C</span></p>
			<p class="mb-2"><i class="fas fa-cloud mr-2 text-black"></i> Description: <span id="weather-description">${weather.weather}</span></p>
			<p class="mb-2"><i class="far fa-clock mr-2 text-black"></i> Time: <span id="currentTime"></span></p>
			<p class="mb-2"><i class="far fa-calendar-alt mr-2 text-black"></i> Date: <span id="currentDate"></span></p>
			<p><i class="fas fa-map-marker-alt mr-2 text-black"></i> Location: <span id="location">${weather.country}, ${weather.city}</span></p>
		</div>

		<!-- Search Bar and Buttons -->
		<div class="mb-4">
			<div class="flex mb-2">
				<input class="w-1/2 mr-2 p-2 border border-gray-400" name="city" type="text" placeholder="Search City" required/>
				<input class="w-1/2 p-2 border border-gray-400" id="country" name="country" type="text" value="" placeholder="ISO code"/>
			</div>
		</div>

	</div>


	<!-- Right Side: 75% Width -->
	<div class="w-75 pl-8">

		<!-- Top Right Side {2} -->
		<div class="flex mb-4">

			<!-- Medium Boxes {2.1m, 2.2m} -->
			<div class="w-1/2 pr-4">
				<div class="bg-gray-200 bg-opacity-75 rounded p-4 mb-4">
					<p class="mb-2"><i class="fas fa-thermometer-half mr-2 text-black"></i> Temperature: ${weather.temperature} <span class="text-gray-600">&deg;C</span></p>
					<p class="mb-2"><i class="fas fa-tint mr-2 text-black"></i> Humidity: ${weather.humidity} <span class="text-gray-600">&nbsp;%</span></p>
					<p class="mb-2"><i class="fas fa-tachometer-alt mr-2 text-black"></i> Pressure: ${weather.pressure} hPa</p>
					<p class="mb-2"><i class="fas fa-compass mr-2 text-black"></i> Wind Degree: ${weather.deg}<span class="text-gray-600">&deg;</span></p>
					<p class="mb-2"><i class="fas fa-comment-alt mr-2 text-black"></i> Description: <span id="weather-description">${weather.weather}</span></p>
				</div>
			</div>

			<div class="w-1/2 pl-4">
				<div class="bg-gray-200 bg-opacity-75 rounded p-4 mb-4">
					<p class="mb-2"><i class="fas fa-temperature-high mr-2 text-black"></i> Maximum temperature: ${weather.tempMax} <span class="text-gray-600">&deg;C</span></p>
					<p class="mb-2"><i class="fas fa-temperature-low mr-2 text-black"></i> Minimum temperature: ${weather.tempMin} <span class="text-gray-600">&deg;C</span></p>
					<p><i class="fas fa-wind mr-2 text-black"></i> Wind speed: ${weather.wind} m/h</p>
				</div>
			</div>

			<!-- Map Container -->
			<div id="map"></div>

		</div>


		<!-- Low Right Side {3} -->
		<div class="bg-gray-200 bg-opacity-75 rounded p-4">
			<p class="mb-2"><i class="fas fa-smog mr-2 text-black"></i> PM2.5: <span id="pm25">${air.pm2_5}</span></p>
			<p class="mb-2"><i class="fas fa-cloud mr-2 text-black"></i> CO: <span>${air.co} </span></p>
			<p class="mb-2"><i class="fas fa-wind mr-2 text-black"></i> No2: <span> ${air.no2} </span></p>
			<p class="mb-2"><i class="fas fa-wind mr-2 text-black"></i> So2: <span> ${air.so2} </span></p>
			<p class="mb-2"><i class="fas fa-smog mr-2 text-black"></i> PM2.5: <span> ${air.pm2_5}</span></p>
			<p class="mb-2"><i class="fas fa-wind mr-2 text-black"></i> PM10: <span> ${air.pm10} </span></p>
			<p class="mb-2"><i class="fas fa-wind mr-2 text-black"></i> SUM AQI: <span> ${air.aqi} AQI </span></p>
			<p><i class="fas fa-wind mr-2 text-black"></i> Wind speed: <span id="so2">${weather.wind} m/h </span></p>
		</div>
	</div>

</div>

</div>

<!-- Include Bootstrap JS and dependencies (Popper.js and jQuery) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Google Maps API Script -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0nrwhMXXr7BfFCNk4RQ2aiplH9QJgmVo&callback=initMap"
		async defer></script>

<!-- Your custom JavaScript or link to external scripts -->
<script src="path/to/your/custom.js"></script>

<script>
	// Function to update the current time
	function updateCurrentTime() {
		var currentTimeElement = document.getElementById('currentTime');
		var currentTime = new Date();
		var hours = currentTime.getHours();
		var minutes = currentTime.getMinutes();
		var seconds = currentTime.getSeconds();

		// Add leading zero if needed
		hours = (hours < 10 ? "0" : "") + hours;
		minutes = (minutes < 10 ? "0" : "") + minutes;
		seconds = (seconds < 10 ? "0" : "") + seconds;

		// Format the time as HH:MM:SS
		var formattedTime = hours + ":" + minutes + ":" + seconds;

		// Set the content of the element
		currentTimeElement.innerHTML = formattedTime;
	}

	// Call the function initially
	updateCurrentTime();

	// Update the current time every second
	setInterval(updateCurrentTime, 1000);

	// Function to update the current date
	function updateCurrentDate() {
		var currentDateElement = document.getElementById('currentDate');
		var currentDate = new Date();
		var date = currentDate.getDate();
		var month = currentDate.getMonth() + 1; // Months are 0-based
		var year = currentDate.getFullYear();

		// Add leading zero if needed
		date = (date < 10 ? "0" : "") + date;
		month = (month < 10 ? "0" : "") + month;

		// Format the date
		var formattedDate = date + '/' + month + '/' + year;

		// Set the content of the element
		currentDateElement.innerHTML = formattedDate;
	}

	// Call the function initially
	updateCurrentDate();

	// Update the current date every second
	setInterval(updateCurrentDate, 1000);

	//Google map geolocation
	var map;

	function initMap(latitude, longitude) {
		map = new google.maps.Map(document.getElementById('map'), {
			center: { lat: latitude, lng: longitude },
			zoom: 12
		});
	}

	// Fetch weather data and then initialize the map
	function fetchDataAndInitializeMap() {
		// Assuming you have a function to fetch weather data, replace it with your actual implementation
		// For demonstration purposes, I'm using a placeholder function `fetchWeatherData`
		fetchWeatherData().then(weatherData => {
			// Extract latitude and longitude from the weather data
			var latitude = weatherData.lat;
			var longitude = weatherData.lon;

			// Call initMap with the obtained coordinates
			initMap(latitude, longitude);
		});
	}

	// Call the function to fetch data and initialize the map
	fetchDataAndInitializeMap();

	// Function to fetch weather data (replace it with your actual implementation)
	function fetchWeatherData() {
		// Simulating asynchronous fetch using a Promise
		return new Promise(resolve => {
			// Replace the setTimeout with your actual API call
			setTimeout(() => {
				// Sample weather data (replace it with actual API response)
				var weatherData = {
					lat: ${weather.lat},
					lon: ${weather.lon}
				};
				resolve(weatherData);
			}, 1000); // Simulating a 1-second delay
		});
	}
</script>

</body>

</html>
