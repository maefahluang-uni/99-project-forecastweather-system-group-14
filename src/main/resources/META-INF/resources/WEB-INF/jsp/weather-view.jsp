<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Sarabun:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet">
	<title>SEEZ - Weather - Homepage</title>
	<style>
		@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css");
		@import "//netdna.bootstrapcdn.com/font-awesome/3.0/css/font-awesome.css";
		@import url('https://fonts.googleapis.com/css2?family=Sarabun:wght@100;200;300;400;500;600;700;800&display=swap');

		* {
			margin: 0;
			padding: 0;
			font-family: 'Sarabun', sans-serif;
		}

		body {
			background-image: url('/img/mian login 2 3.png');
			background-size: cover;
			background-repeat: no-repeat;
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
		}

		/* Add media queries for responsiveness */
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



		.button-box {
			display: flex;
			justify-content: space-between;
			width: 9.8%;
			margin-right: 3%;
		}

		.MainBoard {
			background-color: rgb(255, 255, 255, 0.8);
			justify-content: space-around;
			align-items: center;
			text-align: center;
			padding: 3em;
		}

		.iso-warpper {
			padding-top: 5em;
			display: flex;
			align-items: center;
			justify-content: space-around;
		}

		.iso-box {
			background-color: rgb(255, 255, 255 , 0.85);
			border-radius: 2.5em;
			padding: 3em;
		}


		.line{
			background-color: black;
			margin-bottom: 10px;
			padding: 0.5px;
		}

		.topbarbox{
			background-color: rgb(255, 255, 255, 0.8);
			height: 7rem;
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 2em;
		}

		.logo-text {
			color: black;
			text-align: center;
			font-size: 18px;
			font-weight: 600;
		}

		.logo-text:hover {
			color: black;
			text-align: center;
			font-size: 18px;
			font-weight: 600;
			text-decoration: none;
		}

		.log-button {
			border-radius: 1.5em;
			background-color: #323232;
			padding: 12px 50px;
			filter: drop-shadow(4px 4px 4px rgb(130, 130, 130));
		}

		.log-text {
			color: rgb(255,255,255);
			text-align: center;
			font-size: 16px;
			font-weight: 200;
		}

		.log-text:hover {
			color: rgb(255,255,255);
			text-align: center;
			font-size: 16px;
			font-weight: 200;
			text-decoration: none;
		}

		.reg-button {
			border-radius: 1.5em;
			background-color: #323232;
			padding: 12px 40px;
			filter: drop-shadow(4px 4px 4px rgb(130, 130, 130));
		}

		.reg-text {
			color: rgb(255,255,255);
			text-align: center;
			font-size: 16px;
			font-weight: 200;
		}

		.reg-text:hover {
			color: rgb(255,255,255);
			text-align: center;
			font-size: 16px;
			font-weight: 200;
			text-decoration: none;
		}

		.log-reg-box {
			width: 16%;
			margin-right: 2em;
			display: flex;
			justify-content: space-between;
		}

		.formbox {
			display: flex;
			justify-content: space-between;
			width: 100%;
			align-items: center;
		}
		.sub-btn-box {
			width: 17em;
			height: 8em;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		.form-btn-box {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin: 4rem 8rem;
			width: 80%;
		}
		.logolayer{
			margin-left: 2em;
		}
		.buttom-main-text {
			text-align: center;
			color: black;
			font-size: 16px;
			font-weight: 500;
		}

		.buttom-main-text:hover {
			text-align: center;
			color: black;
			font-size: 16px;
			font-weight: 200;
			text-decoration: none;
		}

		.middle-logo {
			margin-top: 1.5em;
		}

		.buttom-main {
			margin-top: 1.5em;
		}

		.search-form {
			padding: 8px 4em 8px 8px;
			border-radius: 0.8em;
			font-size: 16px;
			font-family: 'FontAwesome';
			border-color: none;
			outline: none;
		}
		.search-form:focus{
			outline: none;
		}

		.iso-form {
			padding: 8px 3em 8px 8px;
			border-radius: 0.8em;
			font-size: 16px;
			font-family: 'FontAwesome';
			border-color: none;
			outline: none;
		}
		.iso-form:focus{
			outline: none;
		}

		.main-btn-box{
			width: 20rem;
		}

		.btn-current {
			border-radius: 0.8em;
			padding: 8px;
			background-color: #F1EB90;
			font-weight:400;
		}

		.btn-5dfc{
			padding: 8px;
			border-radius: 0.8em;
			background-color: #CBF29D;
			font-weight:400;
		}

		.btn-current:focus{
			outline: none;
		}

		.btn-5dfc:focus{
			outline: none;
		}

		.logobox {
			display: flex;
			justify-content: space-between;
			width: 27%;
			text-align: center;
			align-items: center;
		}

		.logoopenweathermap {
			justify-content: space-between;
			display: flex;
			align-items: center;
			text-align: center;
			width: 17em;
			font-size: 20px;
		}

		.top-table2 {
			text-align: center;
			justify-content: space-between;
			display: flex;
			width: 50em;
			padding: 0 2em 0 2em;
		}

		.info-box {
			overflow: hidden;
			height: 20rem;
			overflow-y: auto;
		}

		html {
			/* width */
			::-webkit-scrollbar {
				width: 8px;
			}

			/* Handle */
			::-webkit-scrollbar-thumb {
				background: rgba(100, 100, 100, 0.8);
				border-radius: 10px;
			}

			::-webkit-scrollbar-track{
				display: none;
				background-color: rgb(255, 255, 255, 0.0);
			}

			scroll-behavior: smooth;
		}

		.info-box{
			display: flex;
			justify-content: space-between;
			text-align: left;
			font-size: 16px;
			font-weight: 600;
		}
		ul {
			list-style-type: none;
		}
		li{
			margin-bottom: 0.5em;
		}
		.countrybox {
			margin-left: 2em;
		}
		.isobox {
			margin-right: 1.6em;
		}

		.top-main {
			font-size: 36px;
			font-weight: 600;
		}

		.formlayer {
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
	</style>
</head>
<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/">
			<img src="/img/img.png" alt="Logo">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="/login">Login</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/register">Sign Up</a>
				</li>
			</ul>
		</div>
	</nav>
</header>
<body>

<div class="form-btn-box">
	<!-- Content here -->
	<form class="formlayer" action="" method="get">
		<div class="formbox">
			<input class="search-form" name="city" type="text" placeholder="&#xf002; Search location" required/>
		</div>
		<div class="formbox">
			<input class="iso-form" id="country" name="country" type="text" value="" placeholder="Put the ISO code Here"/>
		</div>
		<div class="main-btn-box">
			<div class="sub-btn-box">
				<button type="submit" formaction="/current/weather" name="current" class="btn-current">Current Weather</button>
				<button type="submit" formaction="/five_day/forecast" name="five_day" class="btn-5dfc">5 Day Forecast</button>
			</div>
		</div>
		<div class="logolayer">
			<img src="rcd1white.png" width="120" alt="">
		</div>
	</form>
</div>

<div class="MainBoard">
	<div class="top-main">
		Welcome to “SEEZ” Forecast Weather App!
	</div>
	<div class="middle-logo">
		<img src="/img/img (1).png" width="140" alt="">
	</div>
	<div class="buttom-main">
		<!-- Sign in to access more features. -->
		<a class="buttom-main-text" href="/">
			Sign in to access more features.
		</a>
	</div>
</div>

<div class="iso-warpper">
	<div class="iso-box">
		<div class="top-table2">
			<h4><strong>Country</strong></h4>
			<h4><strong>ISO</strong></h4>
		</div>
		<div class="line"></div>
		<div class="info-box">
			<div class="countrybox">
				<ul>
					<li>Andorra</li><li>United Arab Emirates</li><li>Afghanistan</li><li>Antigua & Barbuda</li><li>Anguilla</li><li>Albania</li><li>Armenia</li><li>Angola</li><li>Antarctica</li><li>Argentina</li><li>American Samoa</li><li>Austria</li><li>Australia</li><li>Aruba</li><li>Åland Islands</li><li>Azerbaijan</li><li>Bosnia & Herzegovina</li><li>Barbados</li><li>Bangladesh</li><li>Belgium</li><li>Burkina Faso</li><li>Bulgaria</li><li>Bahrain</li><li>Burundi</li><li>Benin</li><li>St. Barthélemy</li><li>Bermuda</li><li>Brunei</li><li>Bolivia</li><li>Caribbean Netherlands</li><li>Brazil</li><li>Bahamas</li><li>Bhutan</li><li>Bouvet Island</li><li>Botswana</li><li>Belarus</li><li>Belize</li><li>Canada</li><li>Cocos (Keeling) Islands</li><li>Congo - Kinshasa</li><li>Central African Republic</li><li>Congo - Brazzaville</li><li>Switzerland</li><li>Côte d’Ivoire</li><li>Cook Islands</li><li>Chile</li><li>Cameroon</li><li>China</li><li>Colombia</li><li>Costa Rica</li><li>Cuba</li><li>Cape Verde</li><li>Curaçao</li><li>Christmas Island</li><li>Cyprus</li><li>Czechia</li><li>Germany</li><li>Djibouti</li><li>Denmark</li><li>Dominica</li><li>Dominican Republic</li><li>Algeria</li><li>Ecuador</li><li>Estonia</li><li>Egypt</li><li>Western Sahara</li><li>Eritrea</li><li>Spain</li><li>Ethiopia</li><li>Finland</li><li>Fiji</li><li>Falkland Islands</li>
					<li>Micronesia</li><li>Faroe Islands</li><li>France</li><li>Gabon</li><li>United Kingdom</li><li>Grenada</li><li>Georgia</li><li>French Guiana</li><li>Guernsey</li><li>Ghana</li><li>Gibraltar</li><li>Greenland</li><li>Gambia</li><li>Guinea</li><li>Guadeloupe</li><li>Equatorial Guinea</li><li>Greece</li><li>South Georgia & South Sandwich Islands</li><li>Guatemala</li><li>Guam</li><li>Guinea-Bissau</li><li>Guyana</li><li>Hong Kong SAR China</li><li>Heard & McDonald Islands</li><li>Honduras</li><li>Croatia</li><li>Haiti</li><li>Hungary</li><li>Indonesia</li><li>Ireland</li><li>Israel</li><li>Isle of Man</li><li>India</li><li>British Indian Ocean Territory</li><li>Iraq</li><li>Iran</li><li>Iceland</li><li>Italy</li><li>Jersey</li><li>Jamaica</li><li>Jordan</li><li>Japan</li><li>Kenya</li><li>Kyrgyzstan</li><li>Cambodia</li><li>Kiribati</li><li>Comoros</li><li>St. Kitts & Nevis</li><li>North Korea</li><li>South Korea</li><li>Kuwait</li><li>Cayman Islands</li><li>Kazakhstan</li><li>Laos</li><li>Lebanon</li><li>St. Lucia</li><li>Liechtenstein</li><li>Sri Lanka</li><li>Liberia</li><li>Lesotho</li><li>Lithuania</li><li>Luxembourg</li><li>Latvia</li><li>Libya</li><li>Morocco</li><li>Monaco</li><li>Moldova</li><li>Montenegro</li>
					<li>St. Martin</li><li>Madagascar</li><li>Marshall Islands</li><li>North Macedonia</li><li>Mali</li><li>Myanmar (Burma)</li><li>Mongolia</li><li>Macao SAR China</li><li>Northern Mariana Islands</li><li>Martinique</li><li>Mauritania</li><li>Montserrat</li><li>Malta</li><li>Mauritius</li><li>Maldives</li><li>Malawi</li><li>Mexico</li><li>Malaysia</li><li>Mozambique</li><li>Namibia</li><li>New Caledonia</li><li>Niger</li><li>Norfolk Island</li><li>Nigeria</li><li>Nicaragua</li><li>Netherlands</li><li>Norway</li><li>Nepal</li><li>Nauru</li><li>Niue</li><li>New Zealand</li><li>Oman</li>
					<li>Panama</li><li>Peru</li><li>French Polynesia</li><li>Papua New Guinea</li><li>Philippines</li><li>Pakistan</li><li>Poland</li><li>St. Pierre & Miquelon</li><li>Pitcairn Islands</li><li>Puerto Rico</li><li>Palestinian Territories</li><li>Portugal</li><li>Palau</li><li>Paraguay</li><li>Qatar</li><li>Réunion</li><li>Romania</li><li>Serbia</li><li>Russia</li><li>Rwanda</li><li>Saudi Arabia</li><li>Solomon Islands</li><li>Seychelles</li><li>Sudan</li><li>Sweden</li><li>Singapore</li><li>St. Helena</li><li>Slovenia</li><li>Svalbard & Jan Mayen</li><li>Slovakia</li><li>Sierra Leone</li><li>San Marino</li><li>Senegal</li><li>Somalia</li><li>Suriname</li><li>South Sudan</li><li>São Tomé & Príncipe</li><li>El Salvador</li><li>Sint Maarten</li><li>Syria</li><li>Eswatini</li><li>Turks & Caicos Islands</li><li>Chad</li><li>French Southern Territories</li><li>Togo</li>
					<li>Thailand</li><li>Tajikistan</li><li>Tokelau</li><li>Timor-Leste</li><li>Turkmenistan</li><li>Tunisia</li><li>Tonga</li><li>Turkey</li><li>Trinidad & Tobago</li><li>Tuvalu</li><li>Taiwan</li><li>Tanzania</li><li>Ukraine</li><li>Uganda</li><li>U.S. Outlying Islands</li><li>United States</li><li>Uruguay</li><li>Uzbekistan</li><li>Vatican City</li><li>St. Vincent & Grenadines</li><li>Venezuela</li><li>British Virgin Islands</li><li>U.S. Virgin Islands</li>
					<li>Vietnam</li><li>Vanuatu</li><li>Wallis & Futuna</li><li>Samoa</li><li>Yemen</li><li>Mayotte</li><li>South Africa</li><li>Zambia</li><li>Zimbabwe</li>
				</ul>
			</div>
			<div class="isobox">
				<ul>
					<li>AD</li><li>AE</li><li>AF</li><li>AG</li><li>AI</li><li>AL</li><li>AM</li><li>AO</li><li>AQ</li><li>AR</li><li>AS</li><li>AT</li><li>AU</li><li>AW</li><li>AX</li><li>AZ</li><li>BA</li><li>BB</li><li>BD</li><li>BE</li><li>BF</li><li>BG</li><li>BH</li><li>BI</li><li>BJ</li>
					<li>BL</li><li>BM</li><li>BN</li><li>BO</li><li>BQ</li><li>BR</li><li>BS</li><li>BT</li><li>BV</li><li>BW</li><li>BY</li><li>BZ</li><li>CA</li><li>CC</li><li>CD</li><li>CF</li><li>CG</li><li>CH</li><li>CI</li><li>CK</li>
					<li>CL</li><li>CM</li><li>CN</li><li>CO</li><li>CR</li><li>CU</li><li>CV</li><li>CW</li><li>CX</li><li>CY</li><li>CZ</li><li>DE</li><li>DJ</li><li>DK</li><li>DM</li><li>DO</li><li>DZ</li><li>EC</li><li>EE</li><li>EG</li><li>EH</li><li>ER</li><li>ES</li><li>ET</li><li>FI</li><li>FJ</li><li>FK</li><li>FM</li><li>FO</li><li>FR</li><li>GA</li><li>GB</li><li>GD</li><li>GE</li><li>GF</li><li>GG</li><li>GH</li><li>GI</li><li>GL</li><li>GM</li><li>GN</li><li>GP</li><li>GQ</li><li>GR</li><li>GS</li><li>GT</li><li>GU</li><li>GW</li><li>GY</li>
					<li>HK</li><li>HM</li><li>HN</li><li>HR</li><li>HT</li><li>HU</li><li>ID</li><li>IE</li><li>IL</li><li>IM</li><li>IN</li><li>IO</li><li>IQ</li><li>IR</li><li>IS</li><li>IT</li><li>JE</li><li>JM</li><li>JO</li><li>JP</li>
					<li>KE</li><li>KG</li><li>KH</li><li>KI</li><li>KM</li><li>KN</li><li>KP</li><li>KR</li><li>KW</li><li>KY</li><li>KZ</li><li>LA</li><li>LB</li><li>LC</li><li>LI</li><li>LK</li><li>LR</li><li>LS</li><li>LT</li><li>LU</li><li>LV</li><li>LY</li><li>MA</li><li>MC</li><li>MD</li><li>ME</li><li>MF</li><li>MG</li><li>MH</li><li>MK</li><li>ML</li><li>MM</li><li>MN</li>
					<li>MO</li><li>MP</li><li>MQ</li><li>MR</li><li>MS</li><li>MT</li><li>MU</li><li>MV</li><li>MW</li><li>MX</li><li>MY</li><li>MZ</li><li>NA</li><li>NC</li><li>NE</li><li>NF</li><li>NG</li><li>NI</li><li>NL</li><li>NO</li>
					<li>NP</li><li>NR</li><li>NU</li><li>NZ</li><li>OM</li><li>PA</li><li>PE</li><li>PF</li><li>PG</li><li>PH</li><li>PK</li><li>PL</li><li>PM</li><li>PN</li><li>PR</li><li>PS</li><li>PT</li><li>PW</li><li>PY</li><li>QA</li><li>RE</li><li>RO</li><li>RS</li><li>RU</li><li>RW</li>
					<li>SA</li><li>SB</li>
					<li>SC</li><li>SD</li><li>SE</li><li>SG</li><li>SH</li><li>SI</li><li>SJ</li>
					<li>SK</li>
					<li>SL</li>
					<li>SM</li>
					<li>SN</li>
					<li>SO</li>
					<li>SR</li>
					<li>SS</li>
					<li>ST</li>
					<li>SV</li>
					<li>SX</li>
					<li>SY</li>
					<li>SZ</li>
					<li>TC</li>
					<li>TD</li>
					<li>TF</li>
					<li>TG</li>
					<li>TH</li>
					<li>TJ</li>
					<li>TK</li>
					<li>TL</li>
					<li>TM</li>
					<li>TN</li>
					<li>TO</li>
					<li>TR</li>
					<li>TT</li>
					<li>TV</li>
					<li>TW</li>
					<li>TZ</li>
					<li>UA</li>
					<li>UG</li>
					<li>UM</li>
					<li>US</li>
					<li>UY</li>
					<li>UZ</li>
					<li>VA</li>
					<li>VC</li>
					<li>VE</li>
					<li>VG</li>
					<li>VI</li>
					<li>VN</li>
					<li>VU</li>
					<li>WF</li>
					<li>WS</li>
					<li>YE</li>
					<li>YT</li>
					<li>ZA</li>
					<li>ZM</li>
					<li>ZW</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>
	//Inline JS
	function addISOCode(country){

		let addISO = document.getElementById("country");

		addISO.value = country;
	}
</script>

</html>