package th.mfu.service;

import java.util.List;
import java.util.Map;

import th.mfu.model.Forecast;
import th.mfu.model.Weather;

public interface WeatherService {

    public Weather getWeatherDataCity(String city, String country) throws IOException;

    public Map<String, List<Forecast>> getHourlyWeatherData(String city, String country) throws IOException;
}
