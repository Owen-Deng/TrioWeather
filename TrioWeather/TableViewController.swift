//
//  TableViewController.swift
//  TrioWeather
//
//  Created by Owen on 9/8/23.
//

import UIKit

class TableViewController: UITableViewController {
    lazy var weatherModel = WeatherModel.SharedInstance
    lazy var displayMode = DisplayMode.Fahrenheit
    lazy var lastUpdateTime = Date().formatted(date: .abbreviated, time: .standard)
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updateWeather), userInfo: nil, repeats: true)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    @objc func updateWeather(){
        lastUpdateTime = Date().formatted(date: .abbreviated, time: .standard)
        self.tableView.reloadSections([4], with: .automatic)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 1{
            return weatherModel.getCityCount()}
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SegementCell", for: indexPath)
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
            let weather = weatherModel.getWeathersByIndex(index: indexPath.row)
            
            cell.textLabel?.text = weather.city
            if displayMode == DisplayMode.Celsius{
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
    }
    

    @IBAction func displayModeChanged(_ sender: Any) {
        if let segCtrl = sender as? UISegmentedControl{
            let val = segCtrl.selectedSegmentIndex
            if val == 0{
                self.displayMode = DisplayMode.Fahrenheit
            }else
            {
                self.displayMode = DisplayMode.Celsius
            }
            self.tableView.reloadSections([1], with: .automatic)
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
        //tableView.index
        //print(segue.destination)
//        if let vc = segue.destination as? ViewController,
//           let cell = sender as? UITableViewCell
//           print("")
////           let name = cell.textLabel?.text{
////                vc.displayImageName = name
////            }
    }


}
