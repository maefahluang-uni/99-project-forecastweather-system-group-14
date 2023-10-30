package th.mfu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import th.mfu.model.CountryCodes;
import th.mfu.model.Forecast;
import th.mfu.service.WeatherService;

@Controller
@RequestMapping("/forecast")
public class ForecastController implements ErrorController {

    private static final String ERROR_PATH = "/error";

    @Autowired
    Weather weather;

    @RequestMapping(value = ERROR_PATH)
    public String errorPage(Model model) {
        CountryCodes codes = new CountryCodes();
        model.addAttribute("codes", codes.getAllCountryCodes());
        return "forecast_view";
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }

    @GetMapping("/weather")
    public String getFiveDayForecast(
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            Model model) throws IOException {

        city = city.substring(0, 1).toUpperCase() + city.substring(1);
        Map<String, List<FiveDayHourlyWeather>> fiveDay = this.forecastService.getHourlyWeather(city, country);

        if (!fiveDay.isEmpty()) {
            getDays(fiveDay);
            getDataForEachDay(fiveDay);
            model.addAttribute("city", city);
            model.addAttribute("days", this.days);
            model.addAttribute("weather_data", this.weatherData);
            return "forecast_view";
        } else {
            CountryCodes codes = new CountryCodes();
            model.addAttribute("error", true);
            model.addAttribute("codes", codes.getAllCountryCodes());
            return "forecast_view";
        }
    }

    public void getDays(Map<String, List<FiveDayHourlyWeather>> fiveDay) {
        this.days = new ArrayList<>();
        for (String day : fiveDay.keySet()) {
            this.days.add(day);
        }
    }

    public void getDataForEachDay(Map<String, List<FiveDayHourlyWeather>> fiveDay) {
        this.weatherData = new ArrayList<>();
        for (String list : fiveDay.keySet()) {
            this.weatherData.add(fiveDay.get(list));
        }
    }
}
