# Forecast-Weather-System Group <14>

## Team Members

- **Mr. Nimit Tanboontor**
  - *Role:* Fullstack
  - *ID:* [6531503042]
  
- **Mr. Kritsakorn Sukkasem**
  - *Role:* Backend
  - *ID:* [6531503005]
  
- **Mr. Klavivach Prajong**
  - *Role:* Fullstack
  - *ID:* [6531503006]
  
- **Mr. Kongphop Saenphai**
  - *Role:* Frontend
  - *ID:* [6531503008]
  
- **Mr. Phumiphat Wongsathit**
  - *Role:* Backend
  - *ID:* [6531503117]
 
- **Mr. Phumiphat Wongsathit**
  - *Role:* Backend
  - *ID:* [6531503117]

## Project Description

[Add a brief description of your project here.]

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

## Usage

[Explain how to use your project.]

## Contribution Guidelines

[If others want to contribute to your project, provide guidelines here.]

## License

[Specify the license for your project.]


## Usage

[Explain how to use your project.]

## Contribution Guidelines

[If others want to contribute to your project, provide guidelines here.]

## License

[Specify the license for your project.]


