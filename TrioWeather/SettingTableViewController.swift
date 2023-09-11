//
//  SettingTableViewController.swift
//  TrioWeather
//
//  Created by RongWei Ji on 9/10/23.
//


//this is for the page of setting.
import UIKit

class SettingTableViewController: UITableViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    //several funcs about the picker
    //return the count of the pickeroptions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var selection=genderOptions[row]
        print(selection)
        genderText.text=genderOptions[row]
        //save the gender here
    }
    
    let pickView = UIPickerView()
    //operate the pickerview
    func creatPickerView(){
        pickView.delegate=self
        genderText.inputView=pickView
        dismissPickerView()
    }
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
       genderText.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderOptions[row]
    }

    // for the genderoptions
    let genderOptions=["Male","Female","NotShow"]

    
    // ui in the viewcontroller
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var textsizeLable: UILabel!
    @IBOutlet weak var darkmodelLabel: UILabel!
    @IBOutlet weak var genderlabel: UILabel!
    @IBOutlet weak var genderText: UITextField!
    @IBAction func genderTextfield(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Setting"
        print("setting loaded")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setAvatarView(imageView: avatarImageView)
        creatPickerView() // init the pickerview
        
        //monitor the tap in this viewcontroller
        let tapGasture=UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapGasture)
    }
    
    @objc func handleTap(){
        if(genderText.isEditing){
            action()
            print("click something, when edit the gender")
        }
        
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
        genderlabel.font=UIFont.systemFont(ofSize: CGFloat(size))
        genderText.font=UIFont.systemFont(ofSize: CGFloat(size))
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
    
    // click the table row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //
        if(indexPath.row==3){
            
        }
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
