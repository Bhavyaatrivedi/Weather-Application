public with sharing class WeatherService {
    // Root class to represent the full response
    public class WeatherResponse {
        @AuraEnabled public Coord coord;
        @AuraEnabled public List<Weather> weather;
        @AuraEnabled public String base;
        @AuraEnabled public Main main;
        @AuraEnabled public Integer visibility;
        @AuraEnabled public Wind wind;
        @AuraEnabled public Clouds clouds;
        @AuraEnabled public Long dt;
        @AuraEnabled public Sys sys;
        @AuraEnabled public Integer timezone;
        @AuraEnabled public Long id;
        @AuraEnabled public String name;
        @AuraEnabled public Integer cod;
    }

    public class Coord {
        @AuraEnabled public Decimal lon;
        @AuraEnabled public Decimal lat;
    }

    public class Weather {
        @AuraEnabled public Integer id;
        @AuraEnabled public String main;
        @AuraEnabled public String description;
        @AuraEnabled public String icon;
    }

    public class Main {
        @AuraEnabled public Decimal temp;
        @AuraEnabled public Decimal feels_like;
        @AuraEnabled public Decimal temp_min;
        @AuraEnabled public Decimal temp_max;
        @AuraEnabled public Integer pressure;
        @AuraEnabled public Integer humidity;
        @AuraEnabled public Integer sea_level;
        @AuraEnabled public Integer grnd_level;
    }

    public class Wind {
        @AuraEnabled public Decimal speed;
        @AuraEnabled public Integer deg;
    }

    public class Clouds {
        @AuraEnabled public Integer all;
    }

    public class Sys {
        @AuraEnabled public Integer type;
        @AuraEnabled public Integer id;
        @AuraEnabled public String country;
        @AuraEnabled public Long sunrise;
        @AuraEnabled public Long sunset;
    }

    @AuraEnabled(cacheable=true)
    public static WeatherResponse getWeather(String city) {
        String apiKey = '44c118a02249804dcac94f28c54882e2'; // Move to Named Credential or Custom Metadata
        String endpoint = 'https://api.openweathermap.org/data/2.5/weather?q=' + city + '&appid=' + apiKey + '&units=metric';

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');

        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            System.debug('RAW RESPONSE: ' + res.getBody());
            WeatherResponse parsed = (WeatherResponse) JSON.deserialize(res.getBody(), WeatherResponse.class);
            System.debug('Parsed Pressure: ' + parsed.main.pressure);
            System.debug('Parsed Visibility: ' + parsed.visibility);
            return parsed;
        } else {
            throw new CalloutException('Failed to fetch weather data. Status: ' + res.getStatus());
        }
    }
}
