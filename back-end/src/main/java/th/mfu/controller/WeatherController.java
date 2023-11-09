package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import th.mfu.countryCodes.CountryCodes;
import th.mfu.model.Forecast;
import th.mfu.model.Weather;
import th.mfu.service.weatherService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@CrossOrigin(origins = "http://localhost:3000")
@Controller
@RequestMapping("/")
public class WeatherController implements ErrorController {

    // TODO: add initBinder for date format
    @InitBinder
    public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locate) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locate);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    private static final String ERROR_PATH = "/error";

    @Autowired
    weatherService WService; // Use the correct variable name

    private List<String> days;
    private List<Forecast> forecastData;

    @RequestMapping("/error")
    public String errorpage(Model model) {
        CountryCodes codes = new CountryCodes();
        model.addAttribute("codes", codes.getAllCountryCodes());
        return "weather-view"; // Return the custom error page
    }

    public String getErrorPath() {
        return ERROR_PATH;
    }

    @GetMapping("/current/weather")
    public String getWeatherDataForCityAndCountry(
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            Model model) throws IOException {
        Weather weather = WService.getWeatherDataCity(city, country); // Store the returned weather
        if (weather != null) {
            model.addAttribute("weather", weather); // Use model.addAttribute to set attributes
            return "search_for_city";
        } else {
            CountryCodes codes = new CountryCodes();
            model.addAttribute("error", true);
            model.addAttribute("codes", codes.getAllCountryCodes());
            return "weather-view";
        }
    }

    @GetMapping("/five_day/forecast")
    public String getForecast(
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            Model model) throws IOException {
        city = city.substring(0, 1).toUpperCase() + city.substring(1);
        Map<String, List<Forecast>> fiveDay = WService.getHourlyWeather(city, country);

        if (!fiveDay.isEmpty()) {
            getDays(fiveDay);
            getDataForEachDay(fiveDay);
            model.addAttribute("city", city);
            model.addAttribute("days", this.days);
            model.addAttribute("forecast", this.forecastData);
            return "forecast-view"; // Return the appropriate view
        } else {
            CountryCodes codes = new CountryCodes();
            model.addAttribute("error", true);
            model.addAttribute("codes", codes.getAllCountryCodes());
            return "weather-view"; // Return the appropriate view
        }
    }

    private void getDataForEachDay(Map<String, List<Forecast>> fiveDay) {
        this.forecastData = new ArrayList<>();

        for (String list : fiveDay.keySet()) {
            this.days.add(list);
        }
    }

    private void getDays(Map<String, List<Forecast>> fiveDay) {
        this.days = new ArrayList<>();

        for (String day : fiveDay.keySet()) {
            this.days.add(day);
        }
    }
}
