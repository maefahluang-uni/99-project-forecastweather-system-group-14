package th.mfu.dao;

import java.io.IOException;

public interface WeatherDAO {


    //Repository for Weather DAO for Accessing through API Json
    public String getWeatherDataCity(String city, String country) throws IOException;

    public String getHourlyWeatherData(String city, String country) throws IOException;

//    public String getAirPollutionData(String lat, String lon) throws IOException;
}
