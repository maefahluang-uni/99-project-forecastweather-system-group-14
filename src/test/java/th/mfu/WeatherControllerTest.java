//package th.mfu;
//
//import org.json.JSONObject;
//import org.junit.runner.RunWith;
//import org.springframework.boot.test.web.client.TestRestTemplate;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.testng.annotations.Test;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//
//@RunWith(SpringRunner.class)
//public class WeatherControllerTest {
//
//    private TestRestTemplate restTemplate;
//
//    @Test
//    public void testGetCurrentWeather() {
//        // Replace "London" and "UK" with the city and country you want to test
//        String city = "London";
//        String country = "UK";
//
//        ResponseEntity<String> responseEntity = restTemplate.getForEntity("/api/weather/current?city={city}&country={country}", String.class, city, country);
//
//        // Assert HTTP status code
//        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
//
//        // Convert the response body to a JSONObject
//        JSONObject obj = new JSONObject(responseEntity.getBody());
//
//        // Assert specific properties
//        assertEquals(city, obj.getString("name"));
//        assertEquals(country, obj.getJSONObject("sys").getString("country"));
//        assertEquals(51.51, obj.getJSONObject("coord").getDouble("lat"), 0.01); // Replace with the expected latitude
//        assertEquals(-0.13, obj.getJSONObject("coord").getDouble("lon"), 0.01); // Replace with the expected longitude
//        assertEquals(65, obj.getJSONObject("main").getInt("humidity"));
//        assertEquals(1020, obj.getJSONObject("main").getInt("pressure"));
//        assertEquals(15.0, obj.getJSONObject("main").getDouble("temp"), 0.01);
//        assertEquals(14.0, obj.getJSONObject("main").getDouble("feels_like"), 0.01);
//        assertEquals(17.0, obj.getJSONObject("main").getDouble("temp_max"), 0.01);
//        assertEquals(13.0, obj.getJSONObject("main").getDouble("temp_min"), 0.01);
//        assertEquals(5.1, obj.getJSONObject("wind").getDouble("speed"), 0.01);
//        assertEquals(180, obj.getJSONObject("wind").getInt("deg"));
//        assertEquals(0, obj.getDouble("timezone"));
//        assertEquals("Clouds", obj.getJSONArray("weather").getJSONObject(0).getString("main"));
//        assertEquals("Scattered clouds", obj.getJSONArray("weather").getJSONObject(0).getString("description"));
//        assertEquals("03d", obj.getJSONArray("weather").getJSONObject(0).getString("icon"));
//    }
//}
