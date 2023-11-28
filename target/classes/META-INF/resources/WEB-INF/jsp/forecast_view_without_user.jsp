<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous">
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
        width: 10%;
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

    .first-bar-show-city{
        height: 60px;
        margin: 25px 120px 0px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .left-side-box {
        width: 30%;
        height: 100%;
        display: flex;
        align-items: end;
    }

    .lsb-sb-main-text{
        margin-left: 10px;
    }

    .lsb-sb-main-text p{
        color : #FFFF;
        font-size: 24px;
    }

    .lsb-sb-sub-text {
        display: flex;
        margin-left: 15px;
    }

    .lsb-sb-sub-text p{
        color : #FFFF;
        margin-left: 10px;
        font-size: 16px;
        font-weight: 500;
    }

    .right-side-box {
        width: 35%;
        height: 100%;
    }

    .right-side-box {
        width: 35%;
        height: 100%;
        display: flex;
        align-items: end;
        justify-content: end;
    }

    .rsb-text-box p{
        color:#ffffff;
        font-size: 16px;
        font-weight: 500;
    }

    .rsb-logo-box{
        margin-right: 3%;
    }

    .f-line{
        height: 3px;
        background-color: #ffffff;
        margin: 5px 120px;
    }

    .button-line-main{
        height: 80px;
        margin: 60px 240px;
        display: flex;
        align-items: center;
        justify-content: space-around;
    }

    .button-line-main button{
        background-color: rgb(217, 217, 217,0.25);
        color: white;
        border-style: none;
        border-radius: 30px;
        width: 15%;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-around;
    }

    .btn-day-line .box-wrapper {
        width: 75%;
        height: 90%;
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    .btn-day-line .box-wrapper .top-text{
        width: 100%;
        height: 50%;
        display: flex;
        align-items: center;
        justify-content: space-around;
        font-size: 18px;
        font-weight: 300;
    }

    .btn-day-line .box-wrapper .buttom-text{
        width: 100%;
        height: 50%;
        display: flex;
        align-items: center;
        justify-content: space-around;
        font-size: 14px;
        font-weight: 300;
    }

    .table-box-wrapper{
        height: 480px;
        margin: 60px 320px;
        display: flex;
        flex-direction: column;
        align-items: start;
        background-color: rgb(122, 122, 122,0.5);
        border-radius: 30px;
        overflow-y: scroll;
    }



    .table-box-wrapper table {
        position: relative;
        margin: 1%;
        height: 100%;
        font-size: 18px;
        font-weight: 500;
        text-align: center;
        align-items: center;
        color : #ffffff;
    }

    .table-box-wrapper td {
        width: 100%;
        height: 100%;
        padding:10px 40px;
    }

    .table-box-wrapper td {
        height: 100%;
    }


    .table-box-wrapper tbody {
        width: 100%;
        height: 100%;
    }

    ::-webkit-scrollbar{
        display: none;
    }

    .table-box-wrapper::-webkit-scrollbar{
        display: none;
    }



</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SEEZ Forecast Weather</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sarabun:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/without_user">
        <!-- Your icon and description -->
        <img src="/img/img.png" width= class="d-inline-block align-top" alt="">
        OpenWeatherMap-API Provider
    </a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/login"><i class="fas fa-sign-in-alt"></i> Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/register"><i class="fas fa-user-plus"></i> Sign Up</a>
            </li>
        </ul>
    </div>
</nav>
<div class="first-bar-show-city">
    <div class="left-side-box">
        <div class="lsb-sb-main-text">
            <p><span id="location">${city}</span></p>
        </div>
        <div class="lsb-sb-sub-text">
            <p>/</p>
            <p>Monday</p>
        </div>
    </div>
    <div class="right-side-box">
        <div class="rsb-logo-box">
            <img src="https://raw.githubusercontent.com/maefahluang-uni/99-project-forecastweather-system-group-14/main/src/main/resources/static/img/openweathermap%201.png" alt="">
        </div>
        <div class="rsb-text-box">
            <p>OpenWeatherMap-API Provider</p>
        </div>
    </div>
</div>
<div class="f-line"></div>
<table class = "table table-hover table-sm" style = "table-layout: fixed; width: 100%;">

    <tbody>
    <tr>
        <td>
            <button class = "btn btn-info btn-lg" style = "width: 100%;" value = "${days[0]}" onclick = "showDay0(value)">
                ${days[0]}
                <p>Today</p>
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
<div class ="table-box-wrapper">
    <table class = "table table-striped table-sm" style = "table-layout: fixed; width: 100%;">

        <thead>
        <tr style = "background-color: #000000; color: #ffffff;">
            <td id = "current_day" style = "background-color: #15ffaa; color: #150015">
                ${days[0]} (Today)
            </td>
            <td>Temperature (&#176;C)</td>
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
                <td>${list.temperature}</td>
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
                <td>${list.temperature}</td>
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
                <td>${list.temperature}</td>
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
                <td>${list.temperature}</td>
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
                <td>${list.temperature}</td>
                <td>${list.weather}</td>
                <td>${list.weatherDesc}</td>
                <td>${list.pressure}</td>
                <td>${list.humidity}</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
</div>
</body>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
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
}
</script>
</html>