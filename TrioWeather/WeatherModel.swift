//
//  Weathers.swift
//  TrioWeather
//
//  Created by Owen on 9/8/23.
//

import UIKit

struct Weather {
    var city:String?
    var weather:String?
    var uv_index:String?
    var temp_low:Int
    var temp_high:Int
    var temp_feels_like:Int
    var humidity:Int
    var visibility:Int
    
}

//enum DisplayMode{case Fahrenheit, Celsius}

class WeatherModel: NSObject {
    static var SharedInstance = WeatherModel()
    
    let weathers = ["Dallas":Weather(city: "Dallas",weather: "Sunny",uv_index: "High", temp_low: 89,temp_high: 100, temp_feels_like: 102, humidity: 28, visibility: 10),
        "Seattle":Weather(city: "Seattle",weather: "Snow",uv_index: "Low", temp_low: 32,temp_high: 43, temp_feels_like: 102, humidity: 42, visibility: 17),
        "New York":Weather(city: "New York",weather: "Windy",uv_index: "High", temp_low: 70,temp_high: 95, temp_feels_like: 102, humidity: 29, visibility: 20),
        "San Jose":Weather(city: "San Jose",weather: "Windy",uv_index: "High", temp_low: 75,temp_high: 95, temp_feels_like: 102, humidity: 29, visibility: 20)]
    
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
}
