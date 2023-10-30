package th.mfu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import th.mfu.model.CountryCodes;
import th.mfu.model.CurrentWeather;
import th.mfu.service.WeatherService;

@Controller
@RequestMapping("/current")
public class CurrentWeatherController implements ErrorController {

    private static final String ERROR_PATH = "/error";

    @Autowired
    CurrentWeatherService currentWeatherService;

    @RequestMapping(value = ERROR_PATH)
    public String errorPage(Model model) {
        CountryCodes codes = new CountryCodes();
        model.addAttribute("codes", codes.getAllCountryCodes());
        return "current_weather_view";
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }

    @GetMapping("/weather")
    public String getCurrentWeatherDataForCityAndCountry(
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            Model model) throws IOException {

        Weather weather;
        weather = this.currentWeatherService.getWeatherDataCity(city, country);

        if (weather != null) {
            model.addAttribute("weather", weather);
            return "current_weather_view";
        } else {
            CountryCodes codes = new CountryCodes();
            model.addAttribute("error", true);
            model.addAttribute("codes", codes.getAllCountryCodes());
            return "current_weather_view";
        }
    }
}
