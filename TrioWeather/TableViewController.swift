//
//  TableViewController.swift
//  TrioWeather
//
//  Created by Owen on 9/8/23.
//

import UIKit


class TableViewController: UITableViewController, ModalViewControllerDelegate{

    
    lazy var weatherModel = WeatherModel.SharedInstance
    lazy var configModel = ConfigModel.SharedInstance
    lazy var displayMode = configModel.readDisplayMode()
    lazy var lastUpdateTime = Date().formatted(date: .abbreviated, time: .standard)
    lazy var cityNames = configModel.readCityNames()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updateWeather), userInfo: nil, repeats: true)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        if cityNames.count < 1{
            cityNames = weatherModel.getCities(numCity:3)
        }
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    @objc func updateWeather(){
        lastUpdateTime = Date().formatted(date: .abbreviated, time: .standard)
        self.tableView.reloadSections([1, 4], with: .automatic)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 1{
            return cityNames.count}
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SegementCell", for: indexPath) as? SegementTableViewCell{
                cell.segmentCtrl.selectedSegmentIndex = Int(displayMode.rawValue)
                return cell
            }
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
            let weather = weatherModel.getWeatherByCity(city: cityNames[indexPath.row])!
            
            cell.textLabel?.text = weather.city
            if displayMode == TemperatureMode.Celsius{
                cell.detailTextLabel?.text = "\(weather.weather!) \(weatherModel.F2C(f: weather.temp_low))/\(weatherModel.F2C(f: weather.temp_high))°C"
            }else
            {
                cell.detailTextLabel?.text = "\(weather.weather!) \(weather.temp_low)/\(weather.temp_high)F"
            }
            
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GotoGalleryCell", for: indexPath)
            cell.textLabel?.text = "Go to Gallery View..."
            return cell
        }else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
            cell.textLabel?.text = "Settings..."
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
            cell.textLabel?.text = "Last Update: \(lastUpdateTime)"
            return cell
        }
        return UITableViewCell()
    }
    

    @IBAction func displayModeChanged(_ sender: Any) {
        if let segCtrl = sender as? UISegmentedControl{
            let val = segCtrl.selectedSegmentIndex
            if val == 0{
                self.displayMode = TemperatureMode.Fahrenheit
            }else
            {
                self.displayMode = TemperatureMode.Celsius
            }
            configModel.saveTempMode(mode: self.displayMode)
            self.tableView.reloadSections([1], with: .automatic)
        }
    }
    
    func addCity(city: String) -> Bool {
        if cityNames.contains(city){
            return false
        }
        if !weatherModel.hasCity(city: city){
            return false
        }
        cityNames.append(city)
        configModel.saveCities(cityNames: cityNames)
        tableView.insertRows(at: [IndexPath(row: cityNames.count - 1, section: 1)], with: .automatic)
        return true
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            cityNames.remove(at: indexPath.row)
            configModel.saveCities(cityNames: cityNames)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? CollectionViewController{
            vc.displayMode = self.displayMode
            vc.cityNames = cityNames
        }else if let vc = segue.destination as? ModalViewController
        {
            vc.delegate = self
        }
       // ready to go
//        else if let vc = segue.destination as? WeatherDetailsViewController,
//            let cell = sender as? UITableViewCell,
//            let city = cell.textLabel?.text!
//        {
//            vc.city = city
//        }
    }


}
