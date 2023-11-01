package th.mfu.model;

public class Weather {
    private String city;
    private String country;
    private String countryISO;
    private String timeZone;
    private String description;
    private String tempFelt;
    private Double tempMin;
    private Double tempMax;
    private Double pressure;
    private Double humidity;

    public Weather() {
        // empty constructor for JSON Parsing
    }

    // Getter & Setter

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountryISO() {
        return countryISO;
    }

    public void setCountryISO(String countryISO) {
        this.countryISO = countryISO;
    }

    public String getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(double timeZone2) {
        this.timeZone = timeZone2;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTempFelt() {
        return tempFelt;
    }

    public void setTempFelt(String tempFelt) {
        this.tempFelt = tempFelt;
    }

    public Double getTempMin() {
        return tempMin;
    }

    public void setTempMin(Double tempMin) {
        this.tempMin = tempMin;
    }

    public Double getTempMax() {
        return tempMax;
    }

    public void setTempMax(Double tempMax) {
        this.tempMax = tempMax;
    }

    public Double getPressure() {
        return pressure;
    }

    public void setPressure(Double pressure) {
        this.pressure = pressure;
    }

    public Double getHumidity() {
        return humidity;
    }

    public void setHumidity(Double humidity) {
        this.humidity = humidity;
    }

    public void setCountryISOCode(String country2) {
    }

    public void setTimeZone(double timeZone2) {
    }

    public void setTemperature(double temperature) {
    }

}
