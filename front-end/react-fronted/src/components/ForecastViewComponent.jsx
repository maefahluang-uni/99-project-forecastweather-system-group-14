import React, { useState } from 'react';
import axios from 'axios';
const ForecastView = (props) => {
  const { city, days, weatherData } = props;

  const [currentDay, setCurrentDay] = useState(0);

  const showDay = (index) => {
    setCurrentDay(index);
  };

  return (
    <div className="container">
      <header style={{ backgroundColor: '#15ffaa', textAlign: 'center' }}>
        <strong style={{ fontSize: '30px' }}>
          {`${city}'s five day weather forecast`}
        </strong>
        <br />
        <a href="/" className="btn btn-link">
          Return to weather search
        </a>
      </header>

      <table className="table table-hover table-sm" style={{ tableLayout: 'fixed', width: '100%' }}>
        <tbody>
          <tr>
            {days.map((day, index) => (
              <td key={index}>
                <button
                  className={`btn btn-info btn-lg ${index === currentDay ? 'active' : ''}`}
                  style={{ width: '100%' }}
                  onClick={() => showDay(index)}
                >
                  {day}
                  <p style={{ textAlign: 'center', fontSize: '15px', paddingTop: '5px', paddingBottom: '5px' }}>
                    {index === 0 ? 'Today' : index === 1 ? 'Tomorrow' : ''}
                  </p>
                </button>
              </td>
            ))}
          </tr>
        </tbody>
      </table>

      <table className="table table-striped table-sm" style={{ tableLayout: 'fixed', width: '100%' }}>
        <thead>
          <tr style={{ backgroundColor: '#000000', color: '#ffffff' }}>
            <td id="current_day" style={{ backgroundColor: '#15ffaa', color: '#150015' }}>
              {`${days[currentDay]} ${currentDay === 0 ? '(Today)' : ''}`}
            </td>
            <td>Country</td>
            <td>Country (ISO code)</td>
            <td>Temperature (°C)</td>
            <td>Minimum temperature (°C)</td>
            <td>Maximum temperature (°C)</td>
            <td>Weather</td>
            <td>Weather description</td>
            <td>Pressure</td>
            <td>Humidity</td>
          </tr>
        </thead>
        <tbody id="day0" style={{ visibility: currentDay === 0 ? 'visible' : 'collapse' }}>
          {weatherData[currentDay].map((item, index) => (
            <tr key={index}>
              <td>{item.time}</td>
              <td>{item.country}</td>
              <td>{item.countryISOCode}</td>
              <td>{item.temperature}</td>
              <td>{item.tempMin}</td>
              <td>{item.tempMax}</td>
              <td>{item.weather}</td>
              <td>{item.weatherDesc}</td>
              <td>{item.pressure}</td>
              <td>{item.humidity}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ForecastView;
