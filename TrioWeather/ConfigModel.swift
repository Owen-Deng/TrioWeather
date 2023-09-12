//
//  ConfigModel.swift
//  TrioWeather
//
//  Created by Owen on 9/11/23.
//

import UIKit

class ConfigModel: NSObject {
    static var SharedInstance = ConfigModel()
    func saveCities(cityNames:Array<String>){
        let defaults = UserDefaults.standard
        defaults.set(cityNames, forKey: "CityNames")
    }
    func saveTempMode(mode:TemperatureMode){
        let defaults = UserDefaults.standard
        if mode == TemperatureMode.Fahrenheit
        {
            defaults.set(false, forKey: "Celsius")
        }
        else{
            defaults.set(true, forKey: "Celsius")
        }
    }
    
    func readCityNames() -> Array<String>{
        if let cityNames = UserDefaults.standard.array(forKey: "CityNames") as? [String] {
            return cityNames
        }
        return []
    }
    
    func readDisplayMode() -> TemperatureMode{
        let Celsius = UserDefaults.standard.bool(forKey: "Celsius")
        if Celsius{
            return TemperatureMode.Celsius
        }
        return TemperatureMode.Fahrenheit
    }
}
