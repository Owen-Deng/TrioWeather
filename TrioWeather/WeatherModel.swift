//
//  Weathers.swift
//  TrioWeather
//
//  Created by Owen on 9/8/23.
//

import UIKit

struct Weather: Decodable{
    var city:String?
    var weather:String?
    var uv_index:String?
    var temp_low:Int
    var temp_high:Int
    var temp_feels_like:Int
    var humidity:Int
    var visibility:Int
}

class WeatherModel: NSObject {
    static var SharedInstance = WeatherModel()
    
    var weathers = [String: Weather]()
    override init() {
        if let jsonURL = Bundle.main.url(forResource: "database", withExtension: "json"){
            let decoder = JSONDecoder()
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                let weather_arr = try decoder.decode(Array<Weather>.self, from: jsonData)
                for weather in weather_arr{
                    weathers[weather.city!] = weather
                }
                //print(weather_arr)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getWeathersByIndex(index:Int) -> Weather?{
        
        let sorted_keys = weathers.keys.sorted()
        var weather = weathers[sorted_keys[index]]
        // simulate weather fluctuations
        weather?.temp_low += Int.random(in: -1...1)
        weather?.temp_high += Int.random(in: -1...1)
        
        
        
        return weather
    }
    
    func getWeatherByCity(city:String) -> Weather?{
        var weather = weathers[city]
        // simulate weather fluctuations
        weather?.temp_low += Int.random(in: -1...1)
        weather?.temp_high += Int.random(in: -1...1)
        return weather
    }
    
    func getCities(numCity:Int = -1) -> Array<String>{
        if numCity == -1{
            return Array(weathers.keys)
        }
        return Array(Array(weathers.keys)[0...numCity-1])
    }
    
    func hasCity(city:String) ->Bool{
        if weathers.keys.contains(city){
            return true
        }
        return false
    }
    
    func getCityCount() -> Int
    {
        return weathers.count
    }
    
    func F2C(f:Int) -> Int{
        //Fahrenheit to Celsius
        return (f-32)*5/9
    }
    
    func getFutureWeathers (city:String) -> Array<Weather>{
        var weathers = Array<Weather>()
        let currentWeather = getWeatherByCity(city: city)
        for _ in 0..<14 {
            let minTemp = Int.random(in: -5..<5) + currentWeather!.temp_low
            let maxTemp = Int.random(in: -5..<5) + currentWeather!.temp_high
            let weather = Weather(temp_low: minTemp, temp_high: maxTemp, temp_feels_like: currentWeather!.temp_feels_like, humidity: currentWeather!.humidity, visibility: currentWeather!.visibility)
            weathers.append(weather)
        }
        return weathers
    }
}
