import React, { useState } from 'react';
import axios from 'axios';

function WeatherSearchComponent() {
  const [city, setCity] = useState('');
  const [country, setCountry] = useState('');
  const [error, setError] = useState(false);

  const handleFormSubmit = (e, endpoint) => {
    e.preventDefault();

    if (!city) {
      setError(true);
      return;
    }

    setError(false);

    const url = `/current/weather?city=${city}&country=${country}`;
    axios
      .get(url)
      .then((response) => {
        // Handle the response data here
        console.log(response.data);
      })
      .catch((error) => {
        console.error(error);
      });
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    if (name === 'city') {
      setCity(value);
    } else if (name === 'country') {
      setCountry(value);
    }
  };

  return (
    <div className="tab-pane fade show active" id="weather" role="tabpanel" aria-labelledby="weather-tab">
      <div className="search-form">
        <form onSubmit={(e) => handleFormSubmit(e, 'current')}>
          <div className="input-group">
            <input
              className="form-control"
              type="text"
              name="city"
              placeholder="Your city"
              required
              value={city}
              onChange={handleInputChange}
            />
            <input
              className="form-control"
              type="text"
              name="country"
              placeholder="Your country's ISO code (not required)"
              value={country}
              onChange={handleInputChange}
            />
            <div className="input-group-append">
              <button type="submit" name="current" className="btn btn-success btn-sm">
                Current Weather
              </button>
            </div>
          </div>
        </form>
      </div>
      {error && <p style={{ color: 'red', textAlign: 'center' }}>Invalid entry.</p>}
    </div>
  );
}

export default WeatherSearchComponent;
