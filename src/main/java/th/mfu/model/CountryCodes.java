package th.mfu.model;

import java.util.concurrent.ConcurrentHashMap;
import java.util.Map;
import java.util.Locale;

public class CountryCodes {
    private final Map<String, String> countries;

    public CountryCodes() {
        countries = createCountryMap();
    }

    private Map<String, String> createCountryMap() {
        Map<String, String> countryMap = new ConcurrentHashMap<>();
        for (String iso : Locale.getISOCountries()) {
            Locale l = new Locale("", iso);
            countryMap.put(l.getDisplayCountry(), iso);
        }
        return countryMap;
    }

    public String getCountryCode(String country) {
        return countries.get(country);
    }

    public String getCountry(String countryCode) {
        for (Map.Entry<String, String> entry : countries.entrySet()) {
            if (entry.getValue().equals(countryCode)) {
                return entry.getKey();
            }
        }
        return "";
    }

    public Map<String, String> getAllCountryCodes() {
        return countries;
    }
}
