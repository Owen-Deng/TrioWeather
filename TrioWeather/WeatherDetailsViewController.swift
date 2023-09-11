//
//  WeatherDetailsViewController.swift
//  TrioWeather
//
//  Created by 黄云峰 on 9/10/23.
//

import UIKit

class WeatherDetailsViewController: UIViewController, UIScrollViewDelegate{
    lazy var weather:Weather? = nil
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    var labelText: String = "text"
    
    @IBOutlet weak var LaberText: UILabel!
    var LabelText = "this is a label"
    func updateLabel(withText newText: String){
        LaberText.text = newText
        
    
    }
    
    
    @IBOutlet weak var CityName: UILabel!
    
    
    
    
    @IBOutlet var WeatherDetails: UIView!

  
    @IBOutlet weak var UIImageView: UIImageView!
    
    var currentImageIndex = 0
    
    func updateImageView(){
        let imageNames = ["Sunny","Windy","Snow"]
        
        if currentImageIndex >= 0 && currentImageIndex < imageNames.count{
            let imageName = imageNames[currentImageIndex]
            UIImageView.image = UIImage(named: imageName)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollview.delegate = self
        
        CityName.text = weather?.city
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    

}
