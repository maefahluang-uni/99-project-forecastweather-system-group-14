package th.mfu.controller;

import java.io.IOException;
import java.util.List;
import javax.validation.OverridesAttribute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import th.mfu.model.Forecast;
import th.mfu.service.WeatherService;
import th.mfu.util.CountryCodes;

@Controller
@RequestMapping("/forecast")
public class ForecastController implements ErrorController {

    private static final String ERROR_PATH = "/error";

    @Autowired
    WeatherService wService;

    private List<String> days;
    private List<Forecast> forecasts;

    @RequestMapping(value = ERROR_PATH)
    public String errorPage(Model model) {
        CountryCodes codes = new CountryCodes();

        model.addAttribute("codes", codes.getAllCountryCodes());

        return "weather_view";
    }


    /**
     * @param city
     * @param country
     * @param model
     * @return
     * @throws IOException
     */
    @GetMapping("/current/weather")
    public String getCurrentWeatherDataForCityAndCountry(@RequestParam("city") String city, @RequestParam("country") String country, Model model) throws IOException {
            
            model.addAttribute("weather", wService.getWeatherDataCity(city, country));

            if (city != null) {
                    model.addAttribute("weather", city);
            }
            return "weather_view";
    }

}
