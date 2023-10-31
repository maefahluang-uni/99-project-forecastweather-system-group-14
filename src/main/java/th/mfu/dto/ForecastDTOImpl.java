package th.mfu.dto;

public class ForecastDTOImpl {
    private static final String API_KEY = "7029d414059ca595dbe015fc53517617";
    private static final String API_URL = "https://api.openweathermap.org/data/2.5";

    @Overide
    public String getHourlyWeatherData(String city, String country) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url(API_URL + "/forecast?q=" + city + "," + country + "&APPID=" + API_KEY)
                .get()
                .build();
        return getResponse(client, request);
    }

    private String getResponse(OkHttpClient client, Request request) throws IOException {
        Response response = client.newCall(request).execute();
        return response.body().string();
    }
}
