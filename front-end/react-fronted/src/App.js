import React, { useState } from 'react';
import './App.css';
import {BrowserRouter as Router, Route, Switch, BrowserRouter} from 'react-router-dom'
import ForecastViewComponent from './components/ForecastViewComponent';
import ISOCodesComponent from './components/ISOCodesComponent';
import LoginFormComponent from './components/LoginFormComponent';
import WeatherSearchComponent from './components/WeatherSearchComponent';
import WeatherViewComponent from './components/WeatherViewComponent';


function App() {
  return (
    <div>
        <BrowserRouter>
              
                <div className="container">
                    <Switch> 
                          <Route path = "/" component = {WeatherSearchComponent}></Route>
                          <Route path = "/current/weather" component = {WeatherViewComponent}></Route>
                          <Route path = "/five_day/forecast" component = {ForecastViewComponent}></Route>
                          <Route path = "/search_for_city" component = {ISOCodesComponent}></Route>
                          {/* <Route path = "/update-employee/:id" component = {UpdateEmployeeComponent}></Route> */}
                    </Switch>
                </div>
            
        </BrowserRouter>
    </div>

);
}

export default App;
