//
//  SettingTableViewController.swift
//  TrioWeather
//
//  Created by RongWei Ji on 9/10/23.
//


//this is for the page of setting.
import UIKit

class SettingTableViewController: UITableViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    @IBOutlet weak var userNameLable: UILabel!
    
    @IBOutlet weak var textsizeLable: UILabel!
    
    @IBOutlet weak var darkmodelLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var stateContentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Setting"
        print("setting loaded")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setAvatarView(imageView: avatarImageView)
    }
    
    func setView(){
        
    }
    
    @IBAction func stepFontsize(_ sender: Any) {
        
    }
    
    
    func setFontsize(size:Int){
        
    }
    
    // this function to reshape the avatar imageview into circle
    func setAvatarView(imageView:UIImageView){
        imageView.layer.borderWidth=0.5
        imageView.layer.masksToBounds=false
        imageView.layer.cornerRadius=imageView.frame.size.width/2
        imageView.clipsToBounds=true
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}