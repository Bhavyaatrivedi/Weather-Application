# Weather Dashboard Application

## Overview

The **Weather Dashboard** is a dynamic Salesforce Lightning Web Component (LWC) application that provides weather information for a specified city. The app fetches real-time weather data from the OpenWeather API and displays essential weather details including temperature, humidity, wind speed, and more. The user can input the city name and retrieve detailed weather information with a modern UI, featuring a modal for deeper insights.

**This project demonstrates the use of Salesforce's HTTP REST callout to fetch weather data from an external API**, allowing seamless integration of external weather services into Salesforce applications.

## Features

- **City Search**: Enter any city's name to fetch the weather.
- **Basic Weather Info**: Displays current temperature, weather description, and other key weather details.
- **Detailed Weather Info**: Provides additional weather insights in a modal, including:
  - Feels Like temperature
  - Minimum and Maximum temperatures
  - Wind Speed
  - Pressure
  - Humidity
  - Visibility
- **Weather Icon**: Displays a weather icon alongside the weather details.
- **Responsive UI**: Dynamic background based on the current weather.

## Architecture

- **Salesforce Apex Class**: 
  - The `WeatherService` class makes an external callout to the **OpenWeather API** to fetch weather data for a specified city.
  - The weather data includes key parameters like temperature, pressure, wind speed, and weather description.
  
- **Lightning Web Component (LWC)**:
  - Allows users to input a city name and retrieve weather information.
  - Displays weather data in a responsive UI using Salesforce's Lightning Design System (SLDS).
  - Modal functionality to display detailed weather information.
  
## **HTTP REST Callout**

This project demonstrates the use of **Salesforce’s HTTP REST callout** to integrate with the **OpenWeather API**, providing real-time weather data. The **WeatherService** Apex class makes an HTTP GET request to the OpenWeather API, fetches the response, and parses the weather details to be displayed in the UI.

## Key Components:

- **WeatherService (Apex Class)**: Fetches weather data from the OpenWeather API for the given city.
- **WeatherDashboard (LWC)**: Interacts with the Apex class to display weather information on the UI, including a modal for detailed data.
- **Modal for Detailed Information**: Displays additional weather insights such as wind speed, humidity, pressure, and more.

## How to Set Up

1. **Set up the Apex Class**:
   - Create the `WeatherService` class in Salesforce Developer Console or your Salesforce IDE.
   - Make sure to add your OpenWeather API key to the `getWeather` method.

2. **Create the LWC Component**:
   - Create the `WeatherDashboard` component with the provided code.
   - Deploy it to your Salesforce org.

3. **Test the Application**:
   - Add the `WeatherDashboard` component to a Lightning Page or App.
   - Test by entering a city name and fetching the weather data.


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
