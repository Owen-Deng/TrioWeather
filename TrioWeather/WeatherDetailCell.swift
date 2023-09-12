//
//  Mycustomcell.swift
//  TrioWeather
//
//  Created by 黄云峰 on 9/11/23.
//

import UIKit

class WeatherDetailCell: UITableViewCell {

    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    let weatherModel = WeatherModel.SharedInstance
    var displayMode:TemperatureMode?
    lazy var city:String? = nil
    lazy var weather:Weather? = nil
    
    func configure(withDate date: Date) {
   
       let dateFormatter = DateFormatter()
       
       dateFormatter.dateFormat = "MM-dd EEEE"
       
       dateFormatter.locale = Locale.current
       
       let formattedDate = dateFormatter.string(from: date)
       
       weekLabel.text = formattedDate
       
       var minTemp = weather!.temp_low
       var maxTemp = weather!.temp_high
       var displaySymbol = "F"
       if displayMode == TemperatureMode.Celsius{
           minTemp = weatherModel.F2C(f: minTemp)
           maxTemp = weatherModel.F2C(f: maxTemp)
           displaySymbol = "°C"
       }
       let weatherIcon = "weather_\(Int.random(in: 0..<3))"
       weatherImage.image = UIImage(named: weatherIcon)
       
       minTemperatureLabel.text = " \(minTemp)\(displaySymbol)"
       maxTemperatureLabel.text = " \(maxTemp)\(displaySymbol)"
   }

   override func awakeFromNib() {
       super.awakeFromNib()
       // Initialization code
   }

   override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
       
   }
}
