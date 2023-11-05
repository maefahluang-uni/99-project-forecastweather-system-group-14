<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${city}'s Five Day Forecast</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <style>
        body {
            background-color: #f5f5f5;
        }

        .container {
            background-color: #fff;
            margin-top: 20px;
            border-radius: 8px;
        }

        .header {
            background-color: #15ffaa;
            text-align: center;
            padding: 15px;
        }

        .header h1 {
            font-size: 30px;
        }

        .back-button {
            margin-bottom: 20px;
        }

        .day-button {
            width: 100%;
        }

        .day-button i {
            margin-right: 5px;
        }

        .table-striped td {
            vertical-align: middle;
        }

        .weather-icon {
            font-size: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>${city}'s Five Day Weather Forecast <i class="fas fa-sun"></i></h1>
        <a href="/" class="btn btn-link back-button">Return to Weather Search</a>
    </div>

    <table class="table table-hover table-sm">
        <tbody>
        <tr class="table-active">
            <td>
                <button class="btn btn-info btn-lg day-button" value="${days[0]}" onclick="showDay0(value)">
                    ${days[0]}<br>
                    <i class="fas fa-sun weather-icon"></i>
                    <p class="text-center">Today</p>
                </button>
            </td>
            <td>
                <button class="btn btn-info btn-lg day-button" value="${days[1]}" onclick="showDay1(value)">
                    ${days[1]}<br>
                    <i class="fas fa-cloud-sun weather-icon"></i>
                    <p class="text-center">Tomorrow</p>
                </button>
            </td>
            <td>
                <button class="btn btn-info btn-lg day-button" value="${days[2]}" onclick="showDay2(value)">
                    ${days[2]}<br>
                    <i class="fas fa-cloud weather-icon"></i>
                </button>
            </td>
            <td>
                <button class="btn btn-info btn-lg day-button" value="${days[3]}" onclick="showDay3(value)">
                    ${days[3]}<br>
                    <i class="fas fa-cloud-sun-rain weather-icon"></i>
                </button>
            </td>
            <td>
                <button class="btn btn-info btn-lg day-button" value="${days[4]}" onclick="showDay4(value)">
                    ${days[4]}<br>
                    <i class="fas fa-cloud-showers-heavy weather-icon"></i>
                </button>
            </td>
        </tr>
        </tbody>
    </table>

    <table class="table table-striped table-sm">
        <thead class="thead-dark">
        <tr>
            <td id="current_day">
                ${days[0]} (Today)
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
        </thead>
        <!-- Today -->
        <tbody id="day0">
        <c:forEach items="${weather_data[0]}" var="list">
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
        <tbody id="day1" style="display: none;">
        <c:forEach items="${weather_data[1]}" var="list">
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
        <tbody id="day2" style="display: none;">
        <c:forEach items="${weather_data[2]}" var="list">
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

<script src = "/public/js/forecast.js"></script>

</body>
</html>