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
        return connectFiveDayForecast(city, country);
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

    //Fetch CurrentWeather - Openweathermap API JSON as OkHttp Request client
    public String connectAPICity(String city, String country) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Request request;

        //Condition if there're no city in the parem
        if (city.isEmpty()) {
            //Show there're "City is empty"
            throw new IllegalArgumentException("City is empty");
        }

        //User can input Country @Parem (Country is {Optional}
        if (country.isEmpty()) {
            request = new Request.Builder()
                    //Get url without Country?q=
                    .url(OPENWEATHER_API_URL +"/weather?q=" + city + "&appid=" + OPENWEATHER_API_KEY)
                    .get()
                    .build();
        } else {
            request = new Request.Builder()
                    //Get url with all $City && $Country
                    .url(OPENWEATHER_API_URL + "/weather?q=" + city + "&country=" + country + "&appid="
                            + OPENWEATHER_API_KEY)
                    .get()
                    .build();
        }
        return getResponse(client, request);
    }


    //Fetch Forecast - Openweathermap API JSON as OkHttp Request client
    private String connectFiveDayForecast(String city, String country) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                //There're no condition on this method user can add $City && $Country
                .url(OPENWEATHER_API_URL + "/forecast?q=" + city + "," + country + "&appid=" + OPENWEATHER_API_KEY)
                .get()
                .build();

        return getFiveDayResponse(client, request);
    }
}
