//
//  SegementTableViewCell.swift
//  TrioWeather
//
//  Created by Owen on 9/11/23.
//

import UIKit

class SegementTableViewCell: UITableViewCell {

    @IBOutlet weak var segmentCtrl: UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //segmentCtrl.selectedSegmentIndex =
    }
    
    //override func view

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}
