//
//  SettingTableViewController.swift
//  TrioWeather
//
//  Created by RongWei Ji on 9/10/23.
//


//this is for the page of setting.
import UIKit

class SettingTableViewController: UITableViewController {

    let states = [
        "Alabama", "Alaska", "Arizona", "Arkansas", "California",
        "Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
        "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
        "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland",
        "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri",
        "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
        "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio",
        "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina",
        "South Dakota", "Tennessee", "Texas", "Utah", "Vermont",
        "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
    ]

    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    //the lables will update the size
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
    
   
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var darkSwitch: UISwitch!
    
    
    
    // change the fontszie
    @IBAction func stepFontsize(_ sender: Any) {
        print(stepper.value)
        let stepperV:Int = Int(stepper.value)
        setFontsize(size: stepperV)
        textsizeLable.text="Text Size:" + String(stepperV)
    }
    
    
    //click the switch to darkmodel
    @IBAction func darkSwitchClick(_ sender: Any) {
        print(darkSwitch.isOn)
        if(darkSwitch.isOn){
            overrideUserInterfaceStyle = .dark
        }else{
            overrideUserInterfaceStyle = .light
        }
        //save the model here
    }
    
    
    
    
    
    func setFontsize(size:Int){
        userNameLable.font=UIFont.systemFont(ofSize: CGFloat(size))
        textsizeLable.font=UIFont.systemFont(ofSize: CGFloat(size))
        darkmodelLabel.font=UIFont.systemFont(ofSize: CGFloat(size))
        stateLabel.font=UIFont.systemFont(ofSize: CGFloat(size))
        stateContentLabel.font=UIFont.systemFont(ofSize: CGFloat(size))
        //save the size here
        
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
