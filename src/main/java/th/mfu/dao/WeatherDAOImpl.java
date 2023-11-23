package th.mfu.dao;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.stereotype.Repository;

import java.io.IOException;

@Repository
public class WeatherDAOImpl implements WeatherDAO {

    // API Key for OpenWeatherMapAPI
    private static final String OPENWEATHER_API_KEY = "7029d414059ca595dbe015fc53517617";
    private static final String OPENWEATHER_API_URL = "https://api.openweathermap.org/data/2.5";

    //PULL METHOD REPOSITORY METHOD

    //Current Weather Data API
    @Override
    public String getWeatherDataCity(String city, String country) throws IOException {
        return connectAPICity(city, country);
    }

    //Forecast Data API
    @Override
    public String getHourlyWeatherData(String city, String country) throws IOException {
        return connectFiveDayForecast(city, country);
    }

    //Air pollution Data API
    @Override
    public String getAirPollutionData(String city, String country) throws IOException {
        return connectAirPollution(city,country);
    }

    // Retreived Data JSON From OpenWeatherMap-API

    //Forecast Five-Days
    public String getFiveDayResponse(OkHttpClient client, Request request) throws IOException {
        Response response = client.newCall(request).execute();
        String getResponseBody = response.body().string();
        return getResponseBody;
    }

    //Current Weather
    public String getWeatherResponse(OkHttpClient client, Request request) throws  IOException {
        Response response = client.newCall(request).execute();
        String getResponseBody = response.body().string();
        return getResponseBody;
    }

    //Air Pollution
    public String getAirPollutionResponse(OkHttpClient client, Request request) throws IOException {
        Response response = client.newCall(request).execute();
        String getResponseBody = response.body().string();
        return getResponseBody;
    }

    //Fetch CurrentWeather - Openweathermap API JSON as OkHttp Request client

    //Current Connect API
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
        return getWeatherResponse(client, request);
    }


    //Fetch Forecast - Openweathermap API JSON as OkHttp Request client

    //Forecast Connect API
    private String connectFiveDayForecast(String city, String country) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                //There're no condition on this method user can add $City && $Country
                .url(OPENWEATHER_API_URL + "/forecast?q=" + city + "," + country + "&appid=" + OPENWEATHER_API_KEY)
                .get()
                .build();

        return getFiveDayResponse(client, request);
    }

    //Air Pollution Connect API
    private String connectAirPollution(String city, String country) {
        OkHttpClient client = new OkHttpClient();

        try {
            Request request = new Request.Builder()
                    .url("https://air-quality-by-api-ninjas.p.rapidapi.com/v1/airquality?city="+city+"&country="+country)
                    .get()
                    .addHeader("X-RapidAPI-Key", "68336de05dmshd5fea6fde168a3bp1ce369jsna0ff39238f99")
                    .addHeader("X-RapidAPI-Host", "air-quality-by-api-ninjas.p.rapidapi.com")
                    .build();

            Response response = client.newCall(request).execute();

            // Check the HTTP response status code
            if (response.isSuccessful()) {
                return getAirPollutionResponse(response);
            } else {
                System.out.println("HTTP request failed with status code: " + response.code());
                // You may want to handle the failure case accordingly
                return null;
            }
        } catch (IOException e) {
            e.printStackTrace();
            // Handle IOException (e.g., network issues) appropriately
            return null;
        }
    }

    private String getAirPollutionResponse(Response response) throws IOException {
        // Check if the response body is not null before reading it
        if (response.body() != null) {
            return response.body().string();
        } else {
            System.out.println("Empty response body.");
            return null;
        }
    }

}
