//
//  ModalViewController.swift
//  TrioWeather
//
//  Created by Owen on 9/10/23.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: ModalViewControllerDelegate?

    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var modalUIView: UIView!
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cityField.returnKeyType = .done
        cityField.delegate = self
        cityField.becomeFirstResponder()
        modalUIView.layer.cornerRadius = 15
        
        //mainView.frame.size.height = 100
        
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityField.resignFirstResponder()
        let cityName = cityField.text?.trimmingCharacters(in: .whitespaces)
        var msg:String?
        if cityName == ""{
            msg = "Please enter a city's name."
        }
        else
        {
            if (delegate?.addCity(city: cityName!))!{
                dismiss(animated: true)
                return true
            }
            else{
                msg = "City not found or alreay existed! Please try another one."
            }
        }
        if msg != nil{
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.cityField.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        return false
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        blurView.frame = CGRect(origin: .zero, size: size)
    }

    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//
//        // Update the layout for the new size (e.g., for landscape or portrait)
//        coordinator.animate(alongsideTransition: { [weak self] _ in
//            // Update constraints or views as needed here
//        }, completion: nil)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
