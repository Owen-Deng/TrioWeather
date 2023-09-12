//
//  WeatherDetailsViewController.swift
//  TrioWeather
//
//  Created by 黄云峰 on 9/10/23.
//

import UIKit

class WeatherDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    lazy var city:String? = nil
    let weatherModel = WeatherModel.SharedInstance
    lazy var weather:Weather? = weatherModel.getWeatherByCity(city: city!)
    lazy var displayMode = TemperatureMode.Celsius
    lazy var weathers = Array<Weather>()

    
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var datesForNextWeek: [Date] = []
    
    @IBOutlet weak var Temperature: UILabel!
    @IBOutlet weak var CityName: UILabel!
    @IBOutlet weak var CityWeatherImage: UIImageView!
    
    
    func generateDatesForNextWeek(from date: Date) -> [Date] {
        var calendar = Calendar.current
            calendar.firstWeekday = 1

        var datesInWeek: [Date] = []

        for dayOffset in 0..<14 {
            if let date = calendar.date(byAdding: .day, value: dayOffset, to: date) {
                    datesInWeek.append(date)
                }
            }

            return datesInWeek
        }

    func numberOfSections(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "onlycell", for: indexPath) as! Mycustomcell
        
        
        
        let dateToShow = datesForNextWeek[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd EEE"
        
        cell.weather = weathers[indexPath.row]
        cell.displayMode = displayMode
        cell.configure(withDate: dateToShow)
        
        cell.backgroundColor = tableView.backgroundColor
        cell.backgroundColor = tableView.backgroundColor
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = selectedBackgroundView
        
        let verticalSpacing: CGFloat = 15.0
        cell.contentView.layoutMargins = UIEdgeInsets(top: verticalSpacing,
                                                      left: 0,
                                                      bottom: verticalSpacing,
                                                      right: 0)
        
        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date()
        
        weathers = weatherModel.getFutureWeathers(city: city!)
        var minTempValue = weather!.temp_low  as Int
        var maxTempValue = weather!.temp_high as Int

        
        var displaySymbol = "F"
        if displayMode == TemperatureMode.Celsius{
            minTempValue = weatherModel.F2C(f: minTempValue)
            maxTempValue = weatherModel.F2C(f: maxTempValue)
            displaySymbol = "°C"
        }
        
        datesForNextWeek = generateDatesForNextWeek(from: currentDate)
        
        
        tableView.dataSource = self
        tableView.delegate   = self
        self.view.addSubview(tableView)
        tableView.backgroundColor = view.backgroundColor
        Temperature.text = "\(minTempValue)/\(maxTempValue)\(displaySymbol)"
        CityWeatherImage.image = UIImage(named: (weather?.weather)!)
        CityName.text = weather?.city
        
    }
    
}
    


