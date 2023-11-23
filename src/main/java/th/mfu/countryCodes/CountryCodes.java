package th.mfu.countryCodes;

import th.mfu.countryCodes.Interface.ISOInterface;

import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

public class CountryCodes implements ISOInterface {

    private Map<String, String> countries;

    public CountryCodes() {

        this.countries = new LinkedHashMap<>();
        for (String iso : Locale.getISOCountries()) {
            Locale l = new Locale("", iso);
            countries.put(l.getDisplayCountry(), iso);
        }

    }

    @Override
    public String getCountryCode(String country) {

        return this.countries.get(country);

    }

    public String getCountry(String countryCode) {

        String country = "";

        for(String get : this.countries.keySet()) {

            if(this.countries.get(get).equals(countryCode)) {

                country = get;

            }

        }

        return country;

    }

    public Map<String, String> getAllCountryCodes(){

        return this.countries;

    }
}