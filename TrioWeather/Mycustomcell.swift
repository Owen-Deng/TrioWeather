//
//  Mycustomcell.swift
//  TrioWeather
//
//  Created by 黄云峰 on 9/11/23.
//

import UIKit

class Mycustomcell: UITableViewCell {

    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    
    func generateDatesForWeek(startingFrom startDate: Date) -> [Date] {
           var calendar = Calendar.current
           calendar.firstWeekday = 1

           var datesInWeek: [Date] = []

           if let sunday = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: startDate)) {
               
               for dayOffset in 0..<7 {
                   if let date = calendar.date(byAdding: .day, value: dayOffset, to: sunday) {
                       datesInWeek.append(date)
                   }
               }
           }

           return datesInWeek
       }

       func configure(withDate date: Date) {
   
                   let dateFormatter = DateFormatter()
                   
                   dateFormatter.dateFormat = "MM-dd EEEE"
                   
                   dateFormatter.locale = Locale.current
                   
                   let formattedDate = dateFormatter.string(from: date)
                   
                   weekLabel.text = formattedDate
           let weatherIcon = "weather_\(Int.random(in: 0..<3))"
           weatherImage.image = UIImage(named: weatherIcon)
           let minTemp = "\(Int.random(in: 22..<32))"
           let maxTemp = "\(Int.random(in: 28..<38))"
           minTemperatureLabel.text = " \(minTemp)°C"
           maxTemperatureLabel.text = " \(maxTemp)°C"
       }

       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           
       }
   }






    
    
//    func configure(withWeekData weeks: String) {
//
//        let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "MM-dd"
//                let formattedDate = dateFormatter.string(from: date)
//
//                let calendar = Calendar.current
//                let dayOfWeek = calendar.component(.weekday, from: date)
//                let dayOfWeekString = calendar.shortWeekdaySymbols[dayOfWeek - 1]
//
//                weekLabel.text = "\(formattedDate) \(dayOfWeekString)"
//            let weatherIcon = "weather_\(Int.random(in: 0..<3))"
//            weatherImage.image = UIImage(named: weatherIcon)
//            let minTemp = "\(Int.random(in: 22..<32))"
//            let maxTemp = "\(Int.random(in: 28..<38))"
//            minTemperatureLabel.text = " \(minTemp)°"
//            maxTemperatureLabel.text = " \(maxTemp)°"
//        }
//
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//

