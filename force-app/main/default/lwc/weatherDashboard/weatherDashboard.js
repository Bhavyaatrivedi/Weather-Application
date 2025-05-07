import { LightningElement, track } from 'lwc';
import getWeather from '@salesforce/apex/WeatherService.getWeather';
import bgImage from '@salesforce/resourceUrl/weatherImage';


export default class WeatherDashboard extends LightningElement {
    @track city = '';
    @track weatherData;
    @track description;
    @track error;
    @track isModalOpen = false; // Modal open/close control

    handleCityChange(event) {
        this.city = event.target.value;
    }

    fetchWeather() {
        this.weatherData = null;
        this.error = null;
        this.isModalOpen = false; // Close modal before fetching new data

        getWeather({ city: this.city })
            .then(result => {
                this.weatherData = result;
                console.log(result, result);
                
                this.description = result.weather[0].description.toUpperCase();
                console.log('Visibility:', result.visibility);
                console.log('Pressure:', result.main?.pressure);
            })
            .catch(err => {
                this.error = 'Unable to fetch weather data.';
                console.error('Apex callout error:', err);
            });
    }

    openModal() {
        this.isModalOpen = true; // Open modal
    }

    closeModal() {
        this.isModalOpen = false; // Close modal
    }

    get weatherIconUrl() {
        if (this.weatherData && this.weatherData.weather.length > 0) {
            return `https://openweathermap.org/img/wn/${this.weatherData.weather[0].icon}@2x.png`;
        }
        return '';
    }


    get modalBackgroundStyle() {
        return `background-image: url(${bgImage}); background-size: cover; background-position: center;`;
    }
}
