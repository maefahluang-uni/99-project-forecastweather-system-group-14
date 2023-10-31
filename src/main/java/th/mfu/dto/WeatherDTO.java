package th.mfu.dto;

import Java.io.IOException;

public interface WeatherDTO {

    public String getWeatherDataCity(String city, String country) throws IOException;

    public String getHourlyWeatherData(String city, String country) throws IOException;
}
