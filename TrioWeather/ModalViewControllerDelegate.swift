//
//  ModalViewControllerDelegate.swift
//  TrioWeather
//
//  Created by Owen on 9/11/23.
//

import UIKit

protocol ModalViewControllerDelegate: NSObject {
    func addCity(city:String) -> Bool
}
