package th.mfu.service;

import th.mfu.model.Forecast;
import th.mfu.model.Weather;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface WeatherService {

    public Weather getWeatherDataCity(String city, String country) throws IOException;

    //Retrieves weather data in JSON format and assigns it to a String variable.
    public Weather jsonParseCityWeather(String city, String country) throws IOException;

//    public Airpollution jsonParseAirPollution(String lat, String lon) throws IOException;

    public Map<String, List<Forecast>> getHourlyWeather(String city, String country) throws IOException;

//    public Airpollution getAirPollutionLatLon(String lat, String lon) throws IOException;
}
