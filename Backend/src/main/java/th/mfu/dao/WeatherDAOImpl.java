package th.mfu.dao;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.stereotype.Repository;

import java.io.IOException;

@Repository
public class WeatherDAOImpl implements weatherDAO {

    // API Key for OpenWeatherMapAPI
    private static final String OPENWEATHER_API_KEY = "7029d414059ca595dbe015fc53517617";
    private static final String OPENWEATHER_API_URL = "https://api.openweathermap.org/data/2.5";

    //PULL METHOD REPOSITORY METHOD
    @Override
    public String getWeatherDataCity(String city, String country) throws IOException {
        return connectAPICity(city, country);
    }

    @Override
    public String getHourlyWeatherData(String city, String country) throws IOException {
        return connectAPICity(city, country);
    }

    // Retreived Data JSON From OpenWeatherMap-API
    public String getFiveDayResponse(OkHttpClient client, Request request) throws IOException {
        Response response = client.newCall(request).execute();
        String getResponseBody = response.body().string();
        return getResponseBody;
    }

    public String getResponse(OkHttpClient client, Request request) throws  IOException {
        Response response = client.newCall(request).execute();
        String getResponseBody = response.body().string();
        return getResponseBody;
    }

    // Able to Retreived with OkHTTPClient method s
    public String connectAPICity(String city, String country) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Request request;

        if (city.isEmpty()) {
            throw new IllegalArgumentException("City is empty");
        }

        if (country.isEmpty()) {
            request = new Request.Builder()
                    .url("https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + OPENWEATHER_API_KEY)
                    .get()
                    .build();
        } else {
            request = new Request.Builder()
                    .url("https://api.openweathermap.org/data/2.5/weather?q=" + city + "&country=" + country + "&appid="
                            + OPENWEATHER_API_KEY)
                    .get()
                    .build();
        }
        return getResponse(client, request);
    }

    private String connectFiveDayForecast(String city, String country) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Request request;

            request = new Request.Builder()
                    .url(OPENWEATHER_API_URL + "/forecast?q=" + city + "," + country + "&appid="
                            + OPENWEATHER_API_KEY)
                    .get()
                    .build();
        return getFiveDayResponse(client, request);
    }

}
