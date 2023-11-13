package th.mfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
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
import th.mfu.service.weatherServiceImpl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/")
public class WeatherController{

    // TODO: add initBinder for date format
    @InitBinder
    public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locate) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locate);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @Autowired
    weatherServiceImpl WService; // Use the correct variable name

    private List<String> days;
    private List<List<Forecast>> weatherData;

    //Still experiment process
//    @RequestMapping("/error")
//    public String handleError(HttpServletRequest request) {
//        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
//
//        if(status != null) {
//            int statusCode = Integer.valueOf(status.toString());
//
//            if (statusCode == HttpStatus.FORBIDDEN.value()) {
//                return "errorpages/error-403";
//            } else if (statusCode == HttpStatus.NOT_FOUND.value()) {
//                return "errorpages/error-404";
//            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
//                return "errorpages/error-500";
//            }
//        }
//        return "errorpages/error";
//    }

    //Sets the search page and loads the ISO codes table.
    @RequestMapping("/")
    public String getWeatherView(Model model, CountryCodes codes) {

        model.addAttribute("codes", codes.getAllCountryCodes());

        return "weather-view";

    }

    @GetMapping("/current/weather")
    public String getWeatherDataForCityAndCountry(
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            Model model) throws IOException {
        Weather weather = WService.getWeatherDataCity(city, country); // Store the returned weather
        if (weather != null) {
            model.addAttribute("weather", weather); // Use model.addAttribute to set attributes
            return "search-for-city";
        } else {
            CountryCodes codes = new CountryCodes();
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

        Map<String, List<Forecast>> fiveDay = this.WService.getHourlyWeather(city, country);

        //Check condition if there are none or empty
        if (!fiveDay.isEmpty()) {
            getDays(fiveDay);
            getDataForEachDay(fiveDay);
            model.addAttribute("city", city);
            model.addAttribute("days", this.days);
            model.addAttribute("weather_data", this.weatherData);
            return "forecast-view"; // Return the appropriate view
        } else {
            CountryCodes codes = new CountryCodes();
            model.addAttribute("codes", codes.getAllCountryCodes());
            // Return the appropriate view
            return "weather-view";
        }
    }

    //Pull Implement method
    private void getDataForEachDay(Map<String, List<Forecast>> fiveDay) {
        this.weatherData = new ArrayList<>();

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
