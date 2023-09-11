//
//  SettingModel.swift
//  TrioWeather
//
//  Created by RongWei Ji on 9/11/23.
//

import Foundation

class SettingModel{
    
    
    
    func getFontSize() ->Int {
        return 12
    }
    
    func getDarkModel() -> Bool{
        return false
    }
    
    func getStateName() -> String{
        return "Texas"
    }
    
    func getUserName()->String{
        return "UserName"
    }
    
    func saveToUserDefault(key:String , fontSize:Int, darkModel:Bool,stateName:String,userName:String){
        let userDefault=UserDefaults.standard
        
        
        
    }
    
    
    
}
