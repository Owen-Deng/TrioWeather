//
//  CollectionViewCell.swift
//  TrioWeather
//
//  Created by Owen on 9/8/23.
//

import UIKit

class CollectionCityCell: UICollectionViewCell {
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var WeatherLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    func customInit(){
        let r = CGFloat(Double(Int.random(in: 170...255))/255.0)
        let g = CGFloat(Double(Int.random(in: 170...255))/255.0)
        let b = CGFloat(Double(Int.random(in: 170...255))/255.0)
        let a = CGFloat(1.0)
        self.contentView.backgroundColor = UIColor(red: r, green:g, blue: b, alpha: a)
    }
}
