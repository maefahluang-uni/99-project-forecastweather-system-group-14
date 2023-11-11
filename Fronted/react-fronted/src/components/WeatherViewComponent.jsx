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
        .then(response => {
            this.setState({
                city : response.data
            });
            console.log(this.state.city);
        })
        .catch(function(error){
            console.log("Error");
        });  
    };

    handleTemperatureChange = event =>{
        this.setState({
            temperature: event.target.value
        });
    };

    handleFeelsLikeChange = event =>{
        this.setState({
            feels_like: event.target.value
        });
    };

    handleTempMinChange = event =>{
        this.setState({
            tempMin: event.target.value
        });
    };

    handleTempMaxChange = event =>{
        this.setState({
            tempMax: event.target.value
        });
    };

    handleWeatherDescriptionChange = event =>{
        this.setState({
            weatherDes: event.target.value
        });
    };

    handlePressureChange = event => {
        this.setState({
            pressure: event.target.value
        });
    };

    handleHumidityChange = event => {
        this.setState({
            humidity: event.target.value
        });
    };

    handleCountryISOChange = event => {
        this.setState({
            CountryISOCode: event.target.value
        });
        const c = event.target.value;
        axios({
            method: "GET",
            url: `https://locahost:8080/current/weather/${c}`,
            headers: {
                "Content-Type": "appliaction/json"
            }
        })
        .then(response => {
            this.setState({
                city : response.data
            });
            console.log(this.state.city);
        })
        .catch(function(error){
            console.log("Error");
        });
    }
 
    handleSubmitWeatherData = e =>{
        e.preventDefault();
        this.setState({
            isLoading: true,
        });
        
        const insertRequestData = {
            city : this.state.city,
            country : this.state.country,
            temperature : this.state.temperature,
            feels_like : this.state.feels_like,
            tempMin : this.state.tempMin,
            tempMax : this.state.tempMax,
            weatherDes : this.state.weatherDes,
            pressure : this.state.pressure,
            humidity : this.state.humidity,
            data :Date(this.state.date).format()
        };
        insertRequestData.data = insertRequestData.date.substring(0,10);
        axios({
            method:'post',
            url:`http://localhost:8080/insert`,
            headers:{
                "Content-Type" : "application/json"
        },
        data: insertRequestData
        })
        .then(reponse => {
            console.log(reponse.data);
        })
        .catch(function(error){
            console.log("Error");
        });
        this.setState({
            date: Date(),
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
        });
    };

    render() {
        return (
            <div className="row">
                {/* <Header /> */}
                <section className="container del-body">
                    <form 
                        className="weatherdateForm"
                        onSubmit={this.handleSubmitWeatherData}
                    >
                        <div className="container tracker-row">
                            <div className="col-xs-6 col-sm-4 col-desc">Country Name</div>
                            <div className="col-xs-6 col-sm-8 col-desc">
                                <div className="select">
                                    <select 
                                        value={this.state.country}
                                        required={true}
                                        onChange={this.handleCountryChange}
                                    >
                                        <option value="">Select any Country..</option>
                                        <option value="India">India</option>    
                                        <option value="Us">Us</option>    
                                        <option value="Ireland">Ireland</option>    
                                        <option value="Uk">Uk</option>    
                                        <option value=""></option>    
                                        <option value=""></option>    
                                        <option value=""></option>    
                                        <option value=""></option>    
                                        <option value=""></option>    
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        )
    }
}