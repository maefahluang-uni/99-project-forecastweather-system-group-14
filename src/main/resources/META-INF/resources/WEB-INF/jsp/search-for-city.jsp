<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Weather Forecast Dashboard</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	<!-- Your custom CSS -->
	<style>
		/* Your custom styles go here */

		body {
			background: url('/img/mian login 2 3.png') no-repeat center center fixed;
			background-size: cover;
			color: #ffffff; /* Set default text color to white */
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

		.Current-weather {
			margin-right:10px;
		}

		#weather-icon {
			width: 100px; /* Set the width as needed */
			height: 100px; /* Set the height as needed */
			background-size: contain; /* Ensure the background image is contained within the element */
			background-repeat: no-repeat; /* Prevent the background image from repeating */
			background-position: center; /* Center the background image */
		}




		/* Add more styles as needed */

	</style>
</head>

<body>

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

<div class="container mt-4">

	<!-- First Big Box -->
	<div class="card mb-4">
		<div class="card-body">
			<!-- Temperature, weather description, time, date, location &nbsp;&nbsp;coordinates -->
			<h1>Current Weather</h1><br>
			<p class="Current-weather">&nbsp;&nbsp;<i class="fas fa-thermometer-half" style="margin-left: 5px;">&nbsp;&nbsp;</i> Temperature: ${weather.temperature} <span id="celsius">&deg;C</span></p>
			<p class="Current-weather">&nbsp;&nbsp;<i class="fas fa-comment-alt">&nbsp;&nbsp;</i> Description: <span id="weather-description">${weather.weather}</span></p>
			<p class="Current-weather">&nbsp;&nbsp;<i class="far fa-clock">&nbsp;&nbsp;</i> Time:&nbsp&nbsp<span id="currentTime"></span></p>
			<p class="Current-weather">&nbsp;&nbsp;<i class="far fa-calendar-alt">&nbsp;&nbsp;</i> Date:&nbsp <span id="currentDate"></span></p>
			<p class="Current-weather">&nbsp;&nbsp;<i class="fas fa-map-marker-alt">&nbsp;&nbsp;</i> Location:&nbsp <span id="location">${weather.country}, ${weather.city}</span></p>
		</div>
		<div id="hidden-weather-icon" style="display: none;">${weather.weatherIcon}</div>
		<div id="weather-icon"></div>

	</div>




	<!-- Second Big Box -->
	<div class="card mb-4">
		<div class="card-body">
			<h2 class="card-title">Today's Highlights</h2>
			<div class="row">
				<div class="col-md-6 mb-3">
					<div class="card">
						<div class="card-body">
							<p><i class="fas fa-thermometer-half"></i> Temperature: ${weather.temperature} <span id="celsius">&deg;C</span></p>
							<p><i class="fas fa-thermometer-half"></i> Feels Like: ${weather.tempFeelsLike} <span id="celsius">&deg;C</span></p>
							<p><i class="fas fa-thermometer-full"></i> Maximum temperature: ${weather.tempMax} <span id="celsius">&deg;C</span></p>
							<p><i class="fas fa-thermometer-empty"></i> Minimum temperature: ${weather.tempMin} <span id="celsius">&deg;C</span></p>
						</div>
					</div>
				</div>
				<!-- Small box for each like it should has each box contain on the big box for humidity, pressure, degree, description -->
				<div class="col-md-6 mb-3">
					<div class="card">
						<div class="card-body">
							<p><i class="fas fa-tint"></i> Humidity: <span id="humidity">${weather.humidity} &nbsp; %</span></p>
							<p><i class="fas fa-tachometer-alt"></i> Pressure: <span id="pressure">${weather.pressure}</span></p>
							<p><i class="fas fa-compass"></i> Degree: ${weather.deg}<span id="degree">&deg;C</span></p>
							<p><i class="fas fa-comment-alt"></i> Description: <span id="description">${weather.weatherDesc}</span></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Third Big Box -->
	<div class="card mb-4">
		<div class="card-body">
			<h2 class="card-title">Air Quality</h2>
			<div class="row">
				<div class="col-md-6 mb-3">
					<div class="card">
						<div class="card-body">
							<p><i class="fas fa-smog"></i> PM2.5: <span id="pm25">3.9</span></p>
							<p><i class="fas fa-wind"></i> Wind speed: <span id="so2">${weather.wind} &nbsp; m/h </span></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Search Input -->
	<div class="row">
		<div class="col-md-6 mb-3">
			<input class="form-control" name="city" type="text" placeholder="Search City" required/>
		</div>
		<div class="col-md-6 mb-3">
			<input class="form-control" id="country" name="country" type="text" value="" placeholder="Your country's ISO code (not required)"/>
		</div>
	</div>

	<!-- Search Buttons -->
	<div class="row">
		<div class="col-md-6 mb-3">
			<button type="submit" class="btn btn-primary" formaction="/current/weather" name="current" class="btn btn-success btn-sm">Current Weather</button>
		</div>
		<div class="col-md-6 mb-3">
			<button type="submit" class="btn btn-info" formaction="/five_day/forecast" name="five_day" class="btn btn-info btn-sm">Search Forecast</button>
		</div>
	</div>

</div>

<!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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

	function updateCurrentDay() {
		var currentDayElement = document.getElementById('currentDay');
		var currentDate = new Date();
		var day = currentDate.toLocaleDateString('en-US', { weekday: 'long' });

		// Set the content of the element
		currentDayElement.innerHTML = day;
	}

	// Call the function initially
	updateCurrentDay();

	// Update the current day every second (optional)
	// setInterval(updateCurrentDay, 1000);

	//Icon condition for changes as ICON Provide code to changes
	// Function to set the background image based on the icon code
	// Function to set the background image based on the icon code
	// Mapping of weather icon codes to Font Awesome classes
	const iconMapping = {
		'01d': 'fas fa-sun',
		'01n': 'fas fa-moon',
		'02d': 'fas fa-cloud-sun',
		'02n': 'fas fa-cloud-moon',
		'03d': 'fas fa-cloud',
		'03n': 'fas fa-cloud',
		'04d': 'fas fa-cloud',
		'04n': 'fas fa-cloud',
		// Add more mappings as needed
	};

	// Function to get Font Awesome class based on weather icon code
	function getWeatherIconClass(iconCode) {
		// Default to a generic icon if the code is not in the mapping
		return iconMapping[iconCode] || 'fas fa-question';
	}

	// Call the function with the actual weather.icon code
	var iconCode = "${weather.weatherIcon}";
	var iconClass = getWeatherIconClass(iconCode);

	// Function to set the background image based on the icon class
	// Function to set the weather icon based on the icon class
	function setWeatherIcon() {
		var iconElement = document.getElementById('weather-icon');
		// Set the innerHTML to the HTML code for the Font Awesome icon
		iconElement.innerHTML = `<i class="${iconClass}"></i>`;
	}

	// Call the function to set the weather icon
	setWeatherIcon();



</script>
</body>

</html>

