import React from "react";
import axios from "axios";
import DatePicker from "react-datepicker";

class WeatherViewComponent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            isLoading: false,
            date: new Date(),
            weather: [],
            city: "",
            country: "",
            temperature: "",
            feels_like: "",
            tempMin: "",
            tempMax: "",
            humidity: "",
            pressure: "",
            CountryISOCode: "",
            weatherDes: "",


        };
    }

    handleDateChane = date => {
        this.setState({
            date: date
        });
    }

    handleCityChange = event => {
        this.setState({
            city:event.target.value
        });
    };

    handleCountryChange = event => {
        this.setState({
            country:event.target.value
        });
        const c = event.target.value;
        axios({
            method: "GET",
            url: `https://locahost:8080/current/weather/${c}`,
            headers: {
                "Content-Type": "appliaction/json"
            }
        })
        .then(response)
    };


}