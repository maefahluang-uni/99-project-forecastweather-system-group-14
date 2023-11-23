package th.mfu.service;

import th.mfu.model.Airpollution;
import th.mfu.model.Forecast;
import th.mfu.model.Weather;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface WeatherService {

//    public UpdateMessage getWeatherDataCity(String city, String country) throws IOException;

    //Retrieves weather data in JSON format and assigns it to a String variable.
    public Weather jsonParseCityWeather(String city, String country) throws IOException, ParseException;

    public Airpollution jsonParseAirPollution(String city, String country) throws IOException, ParseException;

    public Map<String, List<Forecast>> getHourlyWeather(String city, String country) throws IOException;

    Weather getWeatherDataCity(String city, String country) throws IOException, ParseException;

    public Airpollution getAirPollutionData(String city, String country) throws IOException, ParseException;
}
