//
//  WeatherDetailsViewController.swift
//  TrioWeather
//
//  Created by 黄云峰 on 9/10/23.
//

import UIKit

class WeatherDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    lazy var weather:Weather? = nil
    let weeks = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var datesForNextWeek: [Date] = []
    
    func generateDatesForNextWeek(from date: Date) -> [Date] {
            var calendar = Calendar.current
            calendar.firstWeekday = 1

            var datesInWeek: [Date] = []

            for dayOffset in 0..<7 {
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
        return weeks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "onlycell", for: indexPath) as! Mycustomcell
        
        
        
        let dateToShow = datesForNextWeek[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd EEE"
        let formattedDate = dateFormatter.string(from: dateToShow)
        
        
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
    
    
    
    
    
    
    
    @IBOutlet weak var Temperature: UILabel!
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var CityName: UILabel!
    
    
    
    
    
    
    @IBOutlet weak var CityWeatherImage: UIImageView!
    
    
    var currentImageIndex = 0
    
    func updateImageView(){
        let imageNames = ["Sunny","Windy","Snow"]
        
        if currentImageIndex >= 0 && currentImageIndex < imageNames.count{
            let imageName = imageNames[currentImageIndex]
            CityWeatherImage.image = UIImage(named: imageName)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date()
        
        
        datesForNextWeek = generateDatesForNextWeek(from: currentDate)
        
        
        tableView.dataSource = self
        tableView.delegate   = self
        self.view.addSubview(tableView)
        tableView.backgroundColor = view.backgroundColor
        
        CityWeatherImage.image = UIImage(named: (weather?.weather)!)
        CityName.text = weather?.city
        Temperature.text = "\(weather!.temp_low)/\(weather!.temp_high)F"
        
        
        
        
    }
    
}
    


