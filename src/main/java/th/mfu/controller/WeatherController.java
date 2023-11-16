package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import th.mfu.countryCodes.CountryCodes;
import th.mfu.model.Forecast;
import th.mfu.model.Weather;
import th.mfu.service.WeatherService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/")
public class WeatherController implements ErrorController {

    private static final String ERROR_PATH = "/error";

    // TODO: add initBinder for date format
    @InitBinder
    public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locate) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locate);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @Autowired
    WeatherService wService;

    private List<String> days;
    private List<List<Forecast>> weatherData;

    public String getErrorPath() {
        return ERROR_PATH;
    }

    @RequestMapping(value = ERROR_PATH)
    public String errorPage(Model model) {
        CountryCodes codes = new CountryCodes();
        model.addAttribute("codes", codes.getAllCountryCodes());
        return "weather-view";
    }

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
            Model model) throws IOException {

        Weather weather;
        weather = this.wService.getWeatherDataCity(city, country);

        if(weather != null) {
            model.addAttribute("weather", weather);
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
