package th.mfu.dao;

import java.io.IOException;

import org.springframework.stereotype.Repository;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Repository
public class WeatherDAOImpl implements WeatherDAO {

	private static final String OPENWEATHER_API_KEY = "7029d414059ca595dbe015fc53517617";
	private static final String OPENWEATHER_API_URL = "https://api.openweathermap.org/data/2.5";

	// Get current weather for any given city.
	@Override
	public String getWeatherDataCity(String city, String country) throws IOException {

		return connectAPICity(city, country);

	}

	// Get a five day forecast in 3 hour increments for any given city.
	@Override
	public String getHourlyWeatherData(String city, String country) throws IOException {

		return connectFiveDayForecast(city, country);

	}

	// Receive weather'data for current time
	public String connectAPICity(String city, String country) throws IOException {
		OkHttpClient client = new OkHttpClient();
		Request request;
		if (country.isEmpty()) {
			request = new Request.Builder()
					.url("https://api.openweathermap.org/data/2.5/weather?q=" + city)
				.get()
				.addHeader("open-weather-key", OPENWEATHER_API_KEY)
				.addHeader("open-weather-host", OPENWEATHER_API_URL)
				.build();

		return city;
	} else {
		request = new Request.Builder()
				.url("https://api.openweathermap.org/data/2.5/weather?q=" + city + "%2C" + country)
				.get()
				.addHeader("open-weather-key", OPENWEATHER_API_KEY)
				.addHeader("open-weather-host", OPENWEATHER_API_URL)
				.build();

	}
		return getResponse(client, request);
	}

	private String connectFiveDayForecast(String city, String country) throws IOException {
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
				.url("https://api.openweathermap.org/data/2.5/weather?q=" + city + "%2C" + country)
				.get()
				.addHeader("open-weather-key", OPENWEATHER_API_KEY)
				.addHeader("open-weather-host", OPENWEATHER_API_URL)
				.build();

		return getFiveDayResponse(client, request);
	}

	private String getFiveDayResponse(OkHttpClient client, Request request) throws IOException {

		Response response = client.newCall(request).execute();

		String getResponseBody = response.body().string();

		return getResponseBody;

	}

	private String getResponse(OkHttpClient client, Request request) throws IOException {

		Response response = client.newCall(request).execute();

		String getResponseBody = response.body().string();

		return getResponseBody;

	}
}
