# Forecast-Weather-System Group <14>
## Project Description

Forecasting weather is like tutoring a vast audience, often requiring repetitive efforts that consume valuable time. Our Weather Forecast website is the solution to this challenge. Imagine recording a forecast once and effortlessly uploading it to our dedicated platform. Meteorologists can break free from repetition, saving time and refining predictions. This digital hub empowers forecasters to manage and update forecasts seamlessly. Welcome to a future where forecasting is efficient, accurate, and liberating. Embrace the Weather Forecast website – where predicting the elements becomes a seamless and empowering experience.

## Team Members

| Student ID   | First Name | Last Name     | Github account           | 
|--------------|------------|---------------|--------------------------|
| 6531503005   | Kritsakorn | Sukkasem      | Kritsasoft               |
| 6531503006   | Klavivach  | Prajong       | MABiuS1                  |
| 6531503008   | Kongphop   | Saenphai      | kongphop1209             |
| 6531503042   | Nimit      | Tanboontor    | 6531503042               |
| 6531503117   | Phumiphat  | Wongsathit    | 2547phumiphat            |
| 6531503120   | Ramet      | Naochomphoo   | 6531503120               |


## Deployed on Google Cloud
"none"

## Installation

### Backend

To run the backend, follow these steps:

1. Open a terminal and navigate to the `Backend` folder:
    ```bash
    cd Backend
    ```

2. If you have Maven installed:
    ```bash
    mvn clean spring-boot:run
    ```

   If you prefer using SDKMAN with Maven:
    ```bash
    sdk use java 17.0.0-zulu
    mvn clean spring-boot:run
    ```
3. Browser Backend Localhost:

   **{ISOCountryCODE} is Optional**
   
    ```JSP
    [weather-view page]
    http://localhost:8080/
    ```

     ```JSP
    [forecast-view page]
    http://localhost:8080/five_day/forecast?city={YOUR_CITY}&country={ISOCountryCODE}
    ```

     ```JSP
    [current-weather-view page]
    http://localhost:8080/current/weather?city={YOUR_CITY}&country={ISOCountryCODE}
    ```

    

   You can customize the Maven commands as needed, such as adding additional parameters for cleaning or validation.

### Frontend

To run the frontend, follow these steps:

1. Open another terminal and navigate to the `Frontend` folder:
    ```bash
    cd Frontend
    ```

2. Install dependencies using npm:
    ```bash
    npm install
    ```

3. Start the React frontend:
    ```bash
    npm start
    ```

4. Browser Fronted - React Localhost:

   ```React
    [weather-view page]
    http://localhost:3000/
    ```

     ```React
    [forecast-view page]
    http://localhost:3000/five_day/forecast?city={YOUR_CITY}&country={ISOCountryCODE}
    ```

     ```React
    [current-weather-view page]
    http://localhost:3000/current/weather?city={YOUR_CITY}&country={ISOCountryCODE}
    ```

   This will launch the development server for the React frontend.

Now you should have both the backend and frontend running simultaneously. Open your browser and navigate to the specified URLs for the backend and frontend components.



