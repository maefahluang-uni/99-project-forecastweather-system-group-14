package th.mfu.service;

import th.mfu.model.Forecast;
import th.mfu.model.Weather;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface weatherService {

    public Weather getWeatherDataCity(String city, String country) throws IOException;

    public Map<String, List<Forecast>> getHourlyWeather(String city, String country) throws IOException;
}
