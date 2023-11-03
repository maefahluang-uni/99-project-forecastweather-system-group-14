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
 * import th.mfu.model.Forecast;
 * import th.mfu.service.WeatherService;
 * import th.mfu.util.CountryCodes;
 * 
 * @Controller
 * 
 * @RequestMapping("/forecast")
 * public class ForecastController implements ErrorController {
 * 
 * private static final String ERROR_PATH = "/error";
 * 
 * @Autowired
 * WeatherService wService;
 * 
 * private List<String> days;
 * private List<Forecast> forecastData;
 * 
 * @RequestMapping(value = ERROR_PATH)
 * public String errorPage(Model model) {
 * CountryCodes codes = new CountryCodes();
 * 
 * model.addAttribute("codes", codes.getAllCountryCodes());
 * 
 * return "weather_view";
 * }
 * 
 * // Sets the search page and loads the ISO codes table.
 * 
 * @RequestMapping("/")
 * public String getWeatherView(Model model, CountryCodes codes) {
 * 
 * model.addAttribute("codes", codes.getAllCountryCodes());
 * 
 * return "weather_view";
 * 
 * }
 * 
 * public void getDays(Map<String, List<Forecast>> fiveDay) {
 * 
 * this.days = new ArrayList<>();
 * 
 * for (String day : fiveDay.keySet()) {
 * 
 * this.days.add(day);
 * 
 * }
 * 
 * }
 * 
 * public void getDataForEachDay(Map<String, List<Forecast>> fiveDay) {
 * 
 * this.forecastData = new ArrayList<>();
 * 
 * for (String list : fiveDay.keySet()) {
 * 
 * this.forecastData.add((Forecast) fiveDay.get(list));
 * 
 * }
 * 
 * }
 * 
 * @GetMapping("/five_day/weather")
 * public String getFiveDayForecast(
 * 
 * @RequestParam("city") String city,
 * 
 * @RequestParam("country") String country,
 * Model model) throws IOException {
 * 
 * city = city.substring(0, 1).toUpperCase() + city.substring(1);
 * 
 * Map<String, List<Forecast>> fiveDay = this.wService.getHourlyWeather(city,
 * country);
 * 
 * if (!fiveDay.isEmpty()) {
 * getDays(fiveDay);
 * getDataForEachDay(fiveDay);
 * model.addAttribute("city", city);
 * model.addAttribute("days", this.days);
 * model.addAttribute("weather_data", this.forecastData);
 * 
 * return "five_day_forecast";
 * } else {
 * CountryCodes codes = new CountryCodes();
 * model.addAttribute("error", true);
 * model.addAttribute("codes", codes.getAllCountryCodes());
 * 
 * return "weather_view";
 * }
 * 
 * }
 * 
 * }
 */
