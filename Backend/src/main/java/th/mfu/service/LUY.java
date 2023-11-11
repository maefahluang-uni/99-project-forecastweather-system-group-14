package th.mfu.service;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

public class LUY {

    private static final String API_KEY = "7029d414059ca595dbe015fc53517617" ;
    //Attributes
    private OkHttpClient client;
    private Response response;
    private String CityName;
    String unit;




    //Recevied API as JSON OBJECT
    public JSONObject getWeather(){
        client = new OkHttpClient();
        Request request = new Request.Builder()
                .url("https://api.openweathermap.org/data/2.5/weather?q="+getCityName()+"&units="+getUnit()+"&appid="+API_KEY)
                .build();
        try {
            response = client.newCall(request).execute();
            return new JSONObject(response.body().string());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //Received as Weather OBJECT
    public JSONArray returnWeatherArray() {
        JSONArray weatherArray;
        weatherArray = getWeather().getJSONArray("weather");
        return weatherArray;
    }

    public JSONObject returnMain() throws JSONException {
        JSONObject main = getWeather().getJSONObject("main");
        return main;
    }

    public JSONObject returnWind() throws JSONException {
        JSONObject wind = getWeather().getJSONObject("wind");
        return wind;
    }

    public JSONObject returnSys() throws JSONException {
        JSONObject sys = getWeather().getJSONObject("sys");
        return sys;
    }

    public JSONObject returnClouds() throws JSONException {
        JSONObject clouds = getWeather().getJSONObject("clouds");
        return clouds;
    }

    //Getter Setter
    public String getCityName() {
        return CityName;
    }

    public void setCityName(String cityName) {
        this.CityName = cityName;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
}
