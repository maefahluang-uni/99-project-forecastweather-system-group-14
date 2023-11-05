/*
 * package th.mfu.controller;
 * 
 * import java.io.IOException;
 * import java.util.ArrayList;
 * import java.util.List;
 * import java.util.Map;
 * 
 * import org.springframework.beans.factory.annotation.Autowired;
 * import org.springframework.boot.web.servlet.error.ErrorController;
 * import org.springframework.stereotype.Controller;
 * import org.springframework.ui.Model;
 * import org.springframework.web.bind.annotation.GetMapping;
 * import org.springframework.web.bind.annotation.RequestMapping;
 * import org.springframework.web.bind.annotation.RequestParam;
 * 
 * 
 * import th.mfu.model.Weather;
 * import th.mfu.service.WeatherService;
 * import th.mfu.util.CountryCodes;
 * 
 * import java.io.IOException;
 * 
 * @Controller
 * 
 * @RequestMapping("/current")
 * public class CurrentWeatherController implements ErrorController {
 * 
 * private static final String ERROR_PATH = "/error";
 * 
 * @Autowired
 * WeatherService wService;
 * 
 * @RequestMapping(value = ERROR_PATH)
 * public String errorPage(Model model) {
 * CountryCodes codes = new CountryCodes();
 * model.addAttribute("codes", codes.getAllCountryCodes());
 * return "weather_view";
 * }
 * 
 * // Sets the search page and loads the ISO codes table.
 * 
 * @RequestMapping("/")
 * public String getWeatherView(Model model, CountryCodes codes) {
 * model.addAttribute("codes", codes.getAllCountryCodes());
 * return "weather_view";
 * }
 * 
 * @GetMapping("/current/weather")
 * public String getCurrentWeatherDataForCityAndCountry(
 * 
 * @RequestParam("city") String city,
 * 
 * @RequestParam("country") String country,
 * Model model) throws IOException {
 * Weather weather;
 * weather = this.wService.getWeatherDataCity(city, country);
 * 
 * if (weather != null) {
 * model.addAttribute("weather", weather);
 * return "weather_for_city";
 * } else {
 * CountryCodes codes = new CountryCodes();
 * model.addAttribute("error", true);
 * model.addAttribute("codes", codes.getAllCountryCodes());
 * return "weather_view";
 * }
 * }
 * }
 */