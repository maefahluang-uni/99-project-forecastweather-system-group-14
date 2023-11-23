package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import th.mfu.countryCodes.CountryCodes;
import th.mfu.model.Airpollution;
import th.mfu.model.Forecast;
import th.mfu.model.Weather;
import th.mfu.service.WeatherService;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/")
public class WeatherController implements ErrorController {

    private static final String ERROR_PATH = "/error";

    @Autowired
    WeatherService wService;

    private List<String> days;
    private List<List<Forecast>> weatherData;


//    @GetMapping("/resources/**")
//    public String excludeStaticResources() {
//        return "forward:/";
//    }
//
//    // existing code

//    @GetMapping("/**")
//    public String errorHandle() {
//        return "error404";
//    }
//
//    @RequestMapping("/")
//    public String ErrorHandle(){
//        return "redirect:/homepage";
//    }

    @RequestMapping("/")
    public String getWeatherView(Model model, CountryCodes codes) {

        model.addAttribute("codes", codes.getAllCountryCodes());

        return "weather-view";

    }

    //Allows you to search for weather in city + country (ISO) or just city alone.
    @GetMapping("/current/weather")
    public String getCurrentWeatherDataForCityAndCountry(
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            Model model) throws IOException, ParseException {

        //Current Weather
        Weather weather;
        weather = this.wService.getWeatherDataCity(city, country);

        //Air Pollution
        Airpollution air = this.wService.getAirPollutionData(city, country);

        if(weather != null && air != null) {
            //Adding model through Weather, Airpollution
            model.addAttribute("weather", weather);
            model.addAttribute("air", air);
            return "search-for-city";
        }else {
            CountryCodes codes = new CountryCodes();
            model.addAttribute("error", true);
            model.addAttribute("codes", codes.getAllCountryCodes());
            return "weather-view";
        }

    }

    @GetMapping("/five_day/forecast")
    public String getFiveDayForecast(
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            Model model) throws IOException {

        city = city.substring(0, 1).toUpperCase() + city.substring(1);

        Map<String, List<Forecast>> fiveDay = this.wService.getHourlyWeather(city, country);

        //Check condition if there are none or empty
        if(!fiveDay.isEmpty()) {
            getDays(fiveDay);
            getDataForEachDay(fiveDay);
            model.addAttribute("city", city);
            model.addAttribute("days", this.days);
            model.addAttribute("weather_data", this.weatherData);
            return "forecast-view";
        }else {
            CountryCodes codes = new CountryCodes();
            model.addAttribute("error", true);
            model.addAttribute("codes", codes.getAllCountryCodes());
            // Return the appropriate view
            return "weather-view";
        }

    }

    public void getDays(Map<String, List<Forecast>> fiveDay) {

        this.days = new ArrayList<>();

        for(String day : fiveDay.keySet()) {

            this.days.add(day);

        }

    }

    public void getDataForEachDay(Map<String, List<Forecast>> fiveDay) {

        this.weatherData = new ArrayList<>();

        for(String list : fiveDay.keySet()) {

            this.weatherData.add(fiveDay.get(list));

        }

    }
}
