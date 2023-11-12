package th.mfu.service;

import org.joda.time.DateTime;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.mfu.countryCodes.CountryCodes;
import th.mfu.dao.WeatherDAOImpl;
import th.mfu.model.Forecast;
import th.mfu.model.Weather;

import java.io.IOException;
import java.util.*;

@Service
public class weatherServiceImpl implements weatherService {

    //Attributes
    private String json;
    private Weather weather;
    private Map<String, List<Forecast>> forecast;

    //Autowired
    @Autowired
    WeatherDAOImpl weatherDAOImpl;

    //Implement from Repository Method
    @Override
    public Weather getWeatherDataCity(String city, String country) throws IOException {
        return jsonParseCityWeather(city, country);
    }

    //Retrieves weather data in JSON format and assigns it to a String variable.
    private Weather jsonParseCityWeather(String city, String country) throws IOException {

        this.json = this.weatherDAOImpl.getWeatherDataCity(city, country);
        setWeatherParameters();

        return this.weather;

    }

    @Override
    public Map<String, List<Forecast>> getHourlyWeather(String city, String country) throws IOException {

        return jsonParseHourlyWeather(city, country);

    }

    private Map<String, List<Forecast>> jsonParseHourlyWeather(String city, String country) throws IOException {

        this.json = this.weatherDAOImpl.getHourlyWeatherData(city, country);
        setHourlyWeatherParameters();

        return this.forecast;

    }


    private void setWeatherParameters() {
        try {
            // Parsing JSON object and retrieving relevant information
            JSONObject obj = new JSONObject(this.json);

            String name = obj.getString("name").toString();
            String country = obj.getJSONObject("sys").getString("country");
            double humidity = obj.getJSONObject("main").getDouble("humidity");
            double pressure = obj.getJSONObject("main").getDouble("pressure");
            double temp = obj.getJSONObject("main").getDouble("temp");
            double tempFeelsLike = obj.getJSONObject("main").getDouble("feels_like");
            double temp_min = obj.getJSONObject("main").getDouble("temp_min");
            double temp_max = obj.getJSONObject("main").getDouble("temp_max");
            double timeZone = obj.getDouble("timezone");
            String weather = obj.getJSONArray("weather").getJSONObject(0).getString("main");
            String des = obj.getJSONArray("weather").getJSONObject(0).getString("description");

            // Creating the weather Object
            this.weather = new Weather();

            // Setting the weather object attributes
            this.weather.setCity(name);
            this.weather.setCountry(new CountryCodes().getCountry(country));
            this.weather.setCountryISOCode(country);
            this.weather.setHumidity(humidity);
            this.weather.setPressure(pressure);
            this.weather.setTemperature(temp);
            this.weather.setTempFeelsLike(tempFeelsLike);
            this.weather.setTempMin(temp_min);
            this.weather.setTempMax(temp_max);
            this.weather.setTimeZone(timeZone);
            this.weather.setWeather(weather);
            this.weather.setWeatherDesc(des);

            // Check if "wind" key exists before trying to retrieve its value
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void setHourlyWeatherParameters() {
        try {
            List<Forecast> weatherPerThreeHoursPerDay = new ArrayList<>();
            this.forecast = new LinkedHashMap<>();
            Forecast hourlyWeather;
            JSONObject obj = new JSONObject(this.json);
            DateTime dt = new DateTime(new Date());
            DateTime.Property dtp = dt.dayOfWeek();
            String day = dtp.getAsText();

            int count = 0;

            for(int i = 0; i < obj.getJSONArray("list").length(); i++) {

                hourlyWeather = new Forecast();


                String time = obj.getJSONArray("list").getJSONObject(i).getString("dt_txt").split(" ")[1];
                double humidity = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getInt("humidity");
                double pressure = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getInt("pressure");
                double feels_like = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getInt("feels_like");
                double temperature = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getInt("temp");
                double temp_max = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getInt("temp_max");
                double temp_min = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getInt("temp_min");
                double wind = obj.getJSONArray("list").getJSONObject(i).getJSONObject("wind").getInt("speed");
                String weather = obj.getJSONArray("list").getJSONObject(i).getJSONArray("weather").getJSONObject(0).getString("main");
                String weatherDesc = obj.getJSONArray("list").getJSONObject(i).getJSONArray("weather").getJSONObject(0).getString("description");

                hourlyWeather.setDay(day);
                hourlyWeather.setCity(getCity(obj));
                hourlyWeather.setCountry(new CountryCodes().getCountry(getCountry(obj)));
                hourlyWeather.setCountryISOCode(getCountry(obj));
                hourlyWeather.setTime(time);
                hourlyWeather.setHumidity(humidity);
                hourlyWeather.setPressure(pressure);
                hourlyWeather.setTemperature(temperature);
                hourlyWeather.setFeels_Like(feels_like);
                hourlyWeather.setTempMax(temp_max);
                hourlyWeather.setTempMin(temp_min);
                hourlyWeather.setWeather(weather);
                hourlyWeather.setWeatherDesc(weatherDesc);
                hourlyWeather.setWind(wind);

                weatherPerThreeHoursPerDay.add(hourlyWeather);

                if (time.equals("21:00:00")) {
                    this.forecast.put(day.toString(),weatherPerThreeHoursPerDay);
                    count++;
                    dtp = dt.plusDays(count).dayOfWeek();
                    day = dtp.getAsText();
                    weatherPerThreeHoursPerDay = new ArrayList<>();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //Getter City, Country Catch & throws
    //Using for Get City Optional && Get City && get Country

    private String getCity(JSONObject obj) throws JSONException {
        String name = obj.getJSONObject("city").getString("name");
        return name;
    }

    public String getCountry(JSONObject obj) throws JSONException {
        String country = obj.getJSONObject("city").getString("country");
        return country;
    }

}
