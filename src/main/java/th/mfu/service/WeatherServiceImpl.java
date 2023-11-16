package th.mfu.service;

import org.joda.time.DateTime;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import th.mfu.countryCodes.CountryCodes;
import th.mfu.dao.WeatherDAO;
import th.mfu.model.Forecast;
import th.mfu.model.Weather;

import java.io.IOException;
import java.util.*;

@Service
public class WeatherServiceImpl implements WeatherService {

    @Autowired
    WeatherDAO wDAO;

    private String json;
    private Weather weather;
    private Map<String, List<Forecast>> weatherForFiveDays;
//    private Airpollution air;

    //Retrieves current weather data in JSON Format and assigns it tp String var
    @Override
    public Weather getWeatherDataCity(String city, String country) throws IOException {
        return jsonParseCityWeather(city, country);
    }

//    @Override
//    public Airpollution getAirPollutionLatLon(String lat, String lon) throws IOException {
//        return jsonParseAirPollution(lat, lon);
//    }

    //Retrieves weather data in JSON format and assigns it to a String variable.
    @Override
    public Weather jsonParseCityWeather(String city, String country) throws IOException {
        this.json = this.wDAO.getWeatherDataCity(city, country);
        setWeatherParameters();
        return this.weather;
    }

//    @Override
//    public Airpollution jsonParseAirPollution(String lat, String lon) throws IOException {
//        return jsonParseLatLonAirPollution(lat,lon);
//    }
//
//    public Airpollution jsonParseLatLonAirPollution(String lat, String lon) throws IOException {
//        this.json = this.wDAO.getAirPollutionData(lat, lon);
//        setAirPollutionParameters();
//        return this.air;
//    }



    //Parses the JSONObject and retrieves the weather data.
    private void setWeatherParameters() {

        try {
            //Parsing JSON object and retrieving relevant information.
            JSONObject obj = new JSONObject(this.json);

            String name = obj.getString("name").toString();
//            String lon = obj.getJSONObject("coord").getString("lon");
//            String lat = obj.getJSONObject("coord").getString("lat");
            String country = obj.getJSONObject("sys").getString("country");
            double humidity = obj.getJSONObject("main").getInt("humidity");
            double pressure = obj.getJSONObject("main").getInt("pressure");
            double temperature = obj.getJSONObject("main").getDouble("temp");
            double tempFeelsLike = obj.getJSONObject("main").getDouble("feels_like");
            double tempMax = obj.getJSONObject("main").getDouble("temp_max");
            double tempMin = obj.getJSONObject("main").getDouble("temp_min");
            double wind = obj.getJSONObject("wind").getDouble("speed");
            int deg = obj.getJSONObject("wind").getInt("deg");
            double timeZone = obj.getDouble("timezone");
            String weather = obj.getJSONArray("weather").getJSONObject(0).getString("main");
            String weatherDesc = obj.getJSONArray("weather").getJSONObject(0).getString("description");

            //Creating the Weather object
            this.weather = new Weather();

            //Setting the Weather object
            this.weather.setCity(name);
//            this.weather.setLon(lon);
//            this.weather.setLat(lat);
            this.weather.setCountry(new CountryCodes().getCountry(country));
            this.weather.setCountryISOCode(country);
            this.weather.setHumidity(humidity);
            this.weather.setPressure(pressure);
            this.weather.setTemperature(temperature);
            this.weather.setTempFeelsLike(tempFeelsLike);
            this.weather.setTempMax(tempMax);
            this.weather.setTempMin(tempMin);
            this.weather.setWind(wind);
            this.weather.setDeg(deg);
            this.weather.setTimeZone(timeZone);
            this.weather.setWeather(weather);
            this.weather.setWeatherDesc(weatherDesc);

        }catch(Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public Map<String, List<Forecast>> getHourlyWeather(String city, String country) throws IOException {

        return jsonParseHourlyWeather(city, country);

    }

    private Map<String, List<Forecast>> jsonParseHourlyWeather(String city, String country) throws IOException {

        this.json = this.wDAO.getHourlyWeatherData(city, country);
        setHourlyWeatherParameters();

        return this.weatherForFiveDays;

    }

    //Foreacst For 3 Hours as JSONObject
    private void setHourlyWeatherParameters() {

        try {

            List<Forecast> weatherPerThreeHoursPerDay = new ArrayList<>();
            this.weatherForFiveDays = new LinkedHashMap<>();
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
                double temperature = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getDouble("temp");
                double tempMax = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getDouble("temp_max");
                double tempMin = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getDouble("temp_min");
                double wind = obj.getJSONArray("list").getJSONObject(i).getJSONObject("wind").getDouble("speed");
                int deg = obj.getJSONArray("list").getJSONObject(i).getJSONObject("wind").getInt("deg");
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
                hourlyWeather.setTempMax(tempMax);
                hourlyWeather.setTempMin(tempMin);
                hourlyWeather.setWind(wind);
                hourlyWeather.setDeg(deg);
                hourlyWeather.setWeather(weather);
                hourlyWeather.setWeatherDesc(weatherDesc);

                weatherPerThreeHoursPerDay.add(hourlyWeather);

                if(time.equals("21:00:00")) {
                    this.weatherForFiveDays.put(day.toString(), weatherPerThreeHoursPerDay);
                    count++;
                    dtp = dt.plusDays(count).dayOfWeek();
                    day = dtp.getAsText();
                    weatherPerThreeHoursPerDay = new ArrayList<>();
                }

            }

        }catch(Exception e) {
            e.printStackTrace();
        }

    }
//
//    private void setAirPollutionParameters(){
//        try {
//            //Parsing the JSON Object and retrives the air pollution data
//            Airpollution airpollution;
//            JSONObject obj = new JSONObject(this.json);
//
//            int count = 0;
//
//            //Iterate each list that contain insider object
//            for (int i =0;i < obj.getJSONArray("list").length(); i++) {
//
////                //Get Location Coordinate User's preferences location
////                String lon = getJSONObject("coord").getString("lon");
////                String lat = getJSONObject("coord").getString("lat");
//
//                //Get AQI Quality of air as User's's preferences location
//                int aqi = obj.getJSONArray("list").getJSONObject(i).getJSONObject("main").getInt("aqi");
//
//                //Get Component as Co , pm2.5 , pm10
//                double co = obj.getJSONArray("list").getJSONObject(i).getJSONObject("components").getDouble("co");
//                double no = obj.getJSONArray("list").getJSONObject(i).getJSONObject("components").getDouble("no");
//                double no2 = obj.getJSONArray("list").getJSONObject(i).getJSONObject("components").getDouble("co2");
//                double o3 = obj.getJSONArray("list").getJSONObject(i).getJSONObject("components").getDouble("o3");
//                double so2 = obj.getJSONArray("list").getJSONObject(i).getJSONObject("components").getDouble("so2");
//                double pm2_5 = obj.getJSONArray("list").getJSONObject(i).getJSONObject("components").getDouble("pm2_5");
//                double pm10 = obj.getJSONArray("list").getJSONObject(i).getJSONObject("components").getDouble("pm10");
//                double nh3 = obj.getJSONArray("list").getJSONObject(i).getJSONObject("components").getDouble("nh3");
//
//
//                //Creating the Air Pollution Object
//                this.air = new Airpollution();
//
//                //Setting Air Pollution Object
//                this.air.setLon(lon);
//                this.air.setLat(lat);
//                this.air.setAqi(aqi);
//                this.air.setCo(co);
//                this.air.setNo(no);
//                this.air.setNo2(no2);
//                this.air.setO3(o3);
//                this.air.setSo2(so2);
//                this.air.setPm2_5(pm2_5);
//                this.air.setPm10(pm10);
//                this.air.getNh3(nh3);
//            }
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//    }

    private String getCity(JSONObject obj) {
        String name = obj.getJSONObject("city").getString("name");

        return name;
    }

    private String getCountry(JSONObject obj) {
        String country = obj.getJSONObject("city").getString("country");

        return country;
    }
}
