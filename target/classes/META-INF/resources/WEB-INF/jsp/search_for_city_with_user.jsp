<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sarabun:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>SEEZ Current Weather</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            font-family: 'Sarabun', sans-serif;
        }

        body {
            background-image: url('https://raw.githubusercontent.com/maefahluang-uni/99-project-forecastweather-system-group-14/main/src/main/resources/META-INF/resources/WEB-INF/jsp/img/mian%20login%202%203.png');
            background-repeat: no-repeat;
            background-size: cover;
            width: 100%;
            height: 100%;
        }

        .nav-bar-top{
            background-color: rgb(236, 236, 236, 0.8);
            width: 100%;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .nav-bar-logo{
            width: 28%;
            height: 85%;
            margin-left: 10px;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }

        .nav-bar-profile{
            width: 15%;
            height: 85%;
            margin-right: 10px;
            justify-content: space-around;
            display: flex;
            align-items: center;
        }

        .profile-box{
            height: 55px;
            width: 55px;
            border-radius: 50%;
            overflow: hidden;
        }

        .profile-box-pop-up{
            width: 175px;
            height: 125px;
            position: absolute;
            right: 3.3%;
            top: 1%;
            visibility: hidden;
        }

        .profile-box-pop-up:hover p{
            visibility: visible;
        }

        .profile-box-pop-up p{
            visibility: hidden;
        }

        .profile-box-pop-up:hover{
            background-color: rgb(255, 255, 255, 0.95);
            width: 175px;
            height: 125px;
            position: absolute;
            border-radius: 16px;
            right: 3.3%;
            top: 10%;
            transition: 0.48s;
            visibility: visible;
        }

        .profile-box-pop-up-box-wrapper {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-around;
            visibility: visible;
            transition: 0.48s;
        }

        .profile-box-pop-up-box-wrapper::after{
            visibility: hidden;
        }

        .profile-box-pop-up-box-wrapper a{
            text-decoration: none;
        }

        .popup-customizeacc p {
            font-size: 16px;
            color: black;

        }

        .popup-logout p {
            font-size: 16px;
            color: #0066FF;
        }

        .profile-box img {
            width: 100%;
            height: 100%;
            position: relative;
        }

        .main-box {
            height: 720px;
            margin: 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .mb-left-contain {
            width: 30%;
            height: 100%;
            display: flex;
            justify-content: space-around;
        }

        .mb-lc-status{
            background-color: rgb(217, 217, 217, 0.75);
            width: 85%;
            height: 60%;
            border-radius: 30px;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }

        .mb-lc-s-inner-box{
            width: 95%;
            height: 95%;
        }

        .ib-top-text{
            font-size: 20px;
            font-weight: 600;
            margin: 20px 35px 0px;
        }

        .ib-middle-box-wrapper{
            margin: 0px 35px 0px;
            height: 20%;
            display: flex;
            align-items: center;
        }

        .ib-middle-cloud{
            margin-left: 20%;
        }

        .ib-middle-cloud img{
            width: 120px;
            height: 100px;
        }

        .ib-middle-result p{
            font-size: 30px;
            font-weight: 300;
        }

        .ib-bottom-status-text{
            margin: 10px 35px 0px;
        }

        .ib-bottom-status-text p{
            font-size: 18px;
            font-weight: 500;
        }

        .line{
            background-color: black;
            height: 0.2%;
            margin: 30px 35px 0px;
        }

        .ib-under-line-box{
            height: 42%;
            margin: 15px 35px 0px;
        }

        .ib-ulb-contrain{
            width: 100%;
            height: 33.33%;
            display: flex;
            align-items: center;
        }

        .ib-ulb-contrain box-icon{
            width: 40px;
            height: 40px;
            margin-right: 20px;
        }

        .mb-right-contain {
            width: 68%;
            height: 100%;
        }

        .mb-rc-box-wrapper{
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .inner-upper-box-contain{
            background-color: rgb(217, 217, 217,0.75);
            width: 100%;
            height: 54%;
            border-radius: 30px;
        }

        .iubc-top-text{
            font-size: 20px;
            font-weight: 600;
            margin: 25px 35px;
            color: rgb(52, 52, 52);
        }

        .iubc-inner-upper-box-contain{
            height: 38%;
            margin: 0px 35px 0px;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }

        .iubc-ibc-long-contain{
            background-color: rgb(217, 217, 217);
            width: 46%;
            height: 90%;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }

        .iubc-ibc-lc-box{
            width: 38%;
            height: 85%;
        }

        .iubc-ibc-lc-box .lc-b-text p {
            font-size: 14px;
            font-weight: 300;
            color: rgb(74, 66, 66);
        }

        .lc-b-result{
            width: 100%;
            height: 90%;
            display: flex;
            align-items: center;
        }

        .lc-b-r-logo box-icon {
            width: 60px;
            height: 60px;
            color: rgb(62, 61, 61);
        }

        .lc-b-r-result-text p {
            font-size: 20px;
            font-weight: 600;
            margin-left: 50%;
            color: rgb(62, 61, 61);
        }

        .iubc-inner-bottom-box-contain{
            height: 38%;
            margin: 0px 35px 0px;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }

        .iubc-ibbc-long-contain{
            width: 46%;
            height: 90%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .iubc-ibbc-small-contain{
            width: 48%;
            height: 100%;
            background-color: rgb(217, 217, 217);
            border-radius: 20px;
        }

        .inner-lower-box-contain {
            background-color: rgb(217, 217, 217,0.75);
            width: 100%;
            height: 42%;
            border-radius: 30px;
        }

        .ibbc-sc-text{
            margin: 20px 35px 0px;
        }

        .ibbc-sc-text p {
            font-size: 14px;
            font-weight: 300;
            color: rgb(74, 66, 66);
        }

        .ibbc-sc-result{
            height: 56%;
            margin: 10px 35px 10px;
            display: flex;
            align-items: center;
        }

        .ibbc-sc-r-logo box-icon {
            width: 60px;
            height: 60px;
        }

        .ibbc-sc-r-text p {
            font-size: 20px;
            font-weight: 600;
            margin-left: 30%;
            color: rgb(62, 61, 61);
            text-align: center;
        }

        .ilbc-box-wrapper{
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .ilbc-bw-top-text p {
            font-size: 20px;
            font-weight: 600;
            margin: 25px 35px;
            color: rgb(52, 52, 52);
        }

        .ilbc-bw-long-contain {
            height: 60%;
            margin: 0px 35px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .ilbc-bw-lc-left{
            width: 68%;
            height: 100%;
            background-color: rgb(217, 217, 217);
            border-radius: 20px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .ilbc-bw-lc-right{
            width: 28%;
            height: 100%;
            background-color: rgb(217, 217, 217);
            border-radius: 20px;
        }

        .ilbc-bw-lc-l-box {
            width: 12%;
            height: 60%;
        }

        .ilbc-bw-lc-l-b-text p {
            color: rgb(74, 66, 66);
            text-align: center;
            font-size: 14px;
            font-weight: medium;
        }

        .ilbc-bw-lc-l-b-result-text p {
            text-align: center;
            color: rgb(62, 61, 61);
            font-size: 20px;
            font-weight: 400;
            margin-top: 50px;
        }

        .ilbc-bw-lc-right-text p {
            font-size: 16px;
            font-weight: 500;
            margin: 20px 30px 0px;
            color: rgb(74, 66, 66);
        }

        .ilbc-bw-lc-right-box{
            margin: 20px 30px 0px;
            height: 58%;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }

        .ilbc-bw-lc-rb-logo box-icon {
            width: 60px;
            height: 60px;
        }

        .ilbc-bw-lc-rb-text {
            display: flex;
            align-items: center;
        }

        .ilbc-bw-lc-rb-text p{
            margin-left: 10px;
            font-size: 30px;
            font-weight: 500;
        }

        .inner-nav-bar-open {
            display: flex;
            align-items: center;
        }

        .inner-nav-bar-open-text p {
            font-size: 20px;
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="nav-bar-top">
    <div class="nav-bar-logo">
        <a href="/with_user">
            <img src="https://raw.githubusercontent.com/maefahluang-uni/99-project-forecastweather-system-group-14/main/src/main/resources/META-INF/resources/WEB-INF/jsp/img/img.png" alt="">
        </a>
        <div class="inner-nav-bar-open">
            <div class="inner-nav-bar-open-logo">
                <img src="https://raw.githubusercontent.com/maefahluang-uni/99-project-forecastweather-system-group-14/main/src/main/resources/static/img/openweathermap%201.png">
            </div>
            <div class="inner-nav-bar-open-text">
                <p>OpenWeatherMap-API Provider</p>
            </div>
        </div>
    </div>
    <div class="nav-bar-profile">
        <div class="profile-box">
            <img src="https://raw.githubusercontent.com/maefahluang-uni/99-project-forecastweather-system-group-14/main/src/main/resources/static/img/Group%2036977.png" alt="">
            <div class="profile-box-pop-up">
                <div class="profile-box-pop-up-box-wrapper">
                    <div class="popup-customizeacc">
                        <a href="/account">
                            <p>Customize Acc.</p>
                        </a>
                    </div>
                    <div class="popup-logout">
                        <a href="/logout">
                            <p>Log Out</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="main-box">
    <div class="mb-left-contain">
        <div class="mb-lc-status">
            <div class="mb-lc-s-inner-box">
                <div class="ib-top-text">
                    <p>Now</p>
                </div>
                <div class="ib-middle-box-wrapper">
                    <div class="ib-middle-result">
                        <p><span>${weather.temperature}</span><span>&deg;c</span></p>
                    </div>
                    <div class="ib-middle-cloud">
                        <img src="https://raw.githubusercontent.com/maefahluang-uni/99-project-forecastweather-system-group-14/main/src/main/resources/static/img/cloud%201.png" alt="">
                    </div>
                </div>
                <div class="ib-bottom-status-text">
                    <p><span id="weather-description">${weather.weather}</span></p>
                </div>
                <div class="line"></div>
                <div class="ib-under-line-box">
                    <div class="ib-ulb-contrain">
                        <box-icon name='time-five' ></box-icon>
                        <div class="ib-ulb-c-text">
                            <p><span id="currentTime"></span></p>
                        </div>
                    </div>
                    <div class="ib-ulb-contrain">
                        <box-icon name='calendar' ></box-icon>
                        <div class="ib-ulb-c-text">
                            <p><span id="currentDate"></span></p>
                        </div>
                    </div>
                    <div class="ib-ulb-contrain">
                        <box-icon name='map' type='solid' ></box-icon>
                        <div class="ib-ulb-c-text">
                            <p><span id="location">${weather.country}, ${weather.city}</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mb-right-contain">
        <div class="mb-rc-box-wrapper">
            <div class="inner-upper-box-contain">
                <div class="iubc-top-text">
                    <p>Todays Highlights</p>
                </div>
                <div class="iubc-inner-upper-box-contain">
                    <div class="iubc-ibc-long-contain">
                        <div class="iubc-ibc-lc-box">
                            <div class="lc-b-text">
                                <p>Temperature</p>
                            </div>
                            <div class="lc-b-result">
                                <div class="lc-b-r-logo">
                                    <box-icon name='thermometer' type='solid' ></box-icon>
                                </div>
                                <div class="lc-b-r-result-text">
                                    <p>${weather.temperature}°c</p>
                                </div>
                            </div>
                        </div>
                        <div class="iubc-ibc-lc-box">
                            <div class="lc-b-text">
                                <p>Feels like</p>
                            </div>
                            <div class="lc-b-result">
                                <div class="lc-b-r-logo">
                                    <box-icon name='like' ></box-icon>
                                </div>
                                <div class="lc-b-r-result-text">
                                    <p><span>${weather.tempFeelsLike}°c</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="iubc-ibc-long-contain">
                        <div class="iubc-ibc-lc-box">
                            <div class="lc-b-text">
                                <p>Min. temperature</p>
                            </div>
                            <div class="lc-b-result">
                                <div class="lc-b-r-logo">
                                    <box-icon name='chevrons-down' ></box-icon>
                                </div>
                                <div class="lc-b-r-result-text">
                                    <p><span>${weather.tempMin}°c</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="iubc-ibc-lc-box">
                            <div class="lc-b-text">
                                <p>Max. temperature</p>
                            </div>
                            <div class="lc-b-result">
                                <div class="lc-b-r-logo">
                                    <box-icon name='chevrons-up' type='solid' ></box-icon>
                                </div>
                                <div class="lc-b-r-result-text">
                                    <p><span>${weather.tempMax}°c</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="iubc-inner-bottom-box-contain">
                    <div class="iubc-ibbc-long-contain">
                        <div class="iubc-ibbc-small-contain">
                            <div class="ibbc-sc-text">
                                <p>Humidity</p>
                            </div>
                            <div class="ibbc-sc-result">
                                <div class="ibbc-sc-r-logo">
                                    <box-icon name='droplet'></box-icon>
                                </div>
                                <div class="ibbc-sc-r-text">
                                    <p><span>${weather.humidity}</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="iubc-ibbc-small-contain">
                            <div class="ibbc-sc-text">
                                <p>Pressure</p>
                            </div>
                            <div class="ibbc-sc-result">
                                <div class="ibbc-sc-r-logo">
                                    <box-icon name='water' ></box-icon>
                                </div>
                                <div class="ibbc-sc-r-text">
                                    <p><span>${weather.pressure}</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="iubc-ibbc-long-contain">
                        <div class="iubc-ibbc-small-contain">
                            <div class="ibbc-sc-text">
                                <p>Degree</p>
                            </div>
                            <div class="ibbc-sc-result">
                                <div class="ibbc-sc-r-logo">
                                    <box-icon name='compass' type='solid' ></box-icon>
                                </div>
                                <div class="ibbc-sc-r-text">
                                    <p><span>${weather.deg}</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="iubc-ibbc-small-contain">
                            <div class="ibbc-sc-text">
                                <p>Description</p>
                            </div>
                            <div class="ibbc-sc-result">
                                <div class="ibbc-sc-r-logo">
                                    <box-icon name='cloud' ></box-icon>
                                </div>
                                <div class="ibbc-sc-r-text">
                                    <p><span id="weather-description">${weather.weather}</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="inner-lower-box-contain">
                <div class="ilbc-box-wrapper">
                    <div class="ilbc-bw-top-text">
                        <p>Air Quality</p>
                    </div>
                    <div class="ilbc-bw-long-contain">
                        <div class="ilbc-bw-lc-left">
                            <div class="ilbc-bw-lc-l-box">
                                <div class="ilbc-bw-lc-l-b-text">
                                    <p>PM2.5</p>
                                </div>
                                <div class="ilbc-bw-lc-l-b-result-text">
                                    <p><span id="pm25">${air.pm2_5}</span></p>
                                </div>
                            </div>
                            <div class="ilbc-bw-lc-l-box">
                                <div class="ilbc-bw-lc-l-b-text">
                                    <p>PM10</p>
                                </div>
                                <div class="ilbc-bw-lc-l-b-result-text">
                                    <p><span> ${air.pm10} </span></p>
                                </div>
                            </div>
                            <div class="ilbc-bw-lc-l-box">
                                <div class="ilbc-bw-lc-l-b-text">
                                    <p>CO</p>
                                </div>
                                <div class="ilbc-bw-lc-l-b-result-text">
                                    <p><span>${air.co} </span></p>
                                </div>
                            </div>
                            <div class="ilbc-bw-lc-l-box">
                                <div class="ilbc-bw-lc-l-b-text">
                                    <p>NO2</p>
                                </div>
                                <div class="ilbc-bw-lc-l-b-result-text">
                                    <p><span> ${air.no2} </span></p>
                                </div>
                            </div>
                            <div class="ilbc-bw-lc-l-box">
                                <div class="ilbc-bw-lc-l-b-text">
                                    <p>SO2</p>
                                </div>
                                <div class="ilbc-bw-lc-l-b-result-text">
                                    <p><span> ${air.so2} </span></p>
                                </div>
                            </div>
                            <div class="ilbc-bw-lc-l-box">
                                <div class="ilbc-bw-lc-l-b-text">
                                    <p>AQI</p>
                                </div>
                                <div class="ilbc-bw-lc-l-b-result-text">
                                    <p><span> ${air.aqi} AQI </span></p>
                                </div>
                            </div>
                        </div>
                        <div class="ilbc-bw-lc-right">
                            <div class="ilbc-bw-lc-right-text">
                                <p>Wind speed</p>
                            </div>
                            <div class="ilbc-bw-lc-right-box">
                                <div class="ilbc-bw-lc-rb-logo">
                                    <box-icon name='wind' ></box-icon>
                                </div>
                                <div class="ilbc-bw-lc-rb-text">
                                    <p><span id="so2">${weather.wind}</span></p>
                                    <p>M/h</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
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

</html>