//
//  SettingModel.swift
//  TrioWeather
//
//  Created by RongWei Ji on 9/11/23.
//

import Foundation
import UIKit

class SettingModel{
    
    
    
    func getFontSize() ->Int {
       let defaults = UserDefaults.standard
       let fontSize:Int=defaults.integer(forKey: "fontSize")
       return fontSize
            
        
    }
    
    func getDarkModel() -> Bool{
        let defaults = UserDefaults.standard
        let darkModel:Bool=defaults.bool(forKey: "darkModel")
        return darkModel
       // return false
    }
    
    func getGender() -> String{
        let defaults = UserDefaults.standard
        let gender:String=defaults.string(forKey: "gender")!
        return gender
       // return false
    }
    
    func getAge()->Int{
        let defaults = UserDefaults.standard
        let age:Int=defaults.integer(forKey: "age")
        return age
       // return false
    }
    
    
    func getUserName()->String{
        let defaults = UserDefaults.standard
        let name:String=defaults.string(forKey: "userName")!
        return name
       // return false
    }
    
    enum saveKey{
        case fontSize
        case darkModel
        case gender
        case userName
        case age
    }
    
    func saveToUserDefault(key:saveKey, v:Any){
        let userDefault=UserDefaults.standard
        switch(key){
        case .fontSize:
            print("save fontsize")
            userDefault.set(v, forKey: "fontSize")
        case .darkModel:
            print("save darkModel")
            userDefault.set(v, forKey: "darkModel")
        case .gender:
            print("save gender")
            userDefault.set(v, forKey: "gender")
        case .userName:
            print("save age")
            userDefault.set(v, forKey: "age")
        case .age:
            print("save userName")
            userDefault.set(v, forKey: "userName")
        }
        userDefault.synchronize()
    }
    

    
    
}
