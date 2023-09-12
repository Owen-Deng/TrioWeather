//
//  AvatarViewController.swift
//  TrioWeather
//
//  Created by RongWei Ji on 9/11/23.
//

import UIKit

// Protocol to define the contract for the delegate
//custom delegate to pass the image back to setting vc
protocol AvatarViewControllerDelegate: AnyObject {
    func dataReceivedFromAvatarViewController(data: UIImage)
}

class AvatarViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate{
    
    @IBOutlet weak var avartarImageView: UIImageView!
    
    @IBOutlet weak var avatarScrollView: UIScrollView!
    
    //for passing data to setting vc
   weak var backDelegate:AvatarViewControllerDelegate?
    var imageBack:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        avatarScrollView.minimumZoomScale=0.5
        avatarScrollView.maximumZoomScale=5.0//set the range of zoom
        // avatarScrollView.contentSize=avatarImageview.frame.size
    }
    
    //load the image from the album into imageview
    @IBAction func changePhoto(_ sender: Any) {
        let imagePicker=UIImagePickerController();
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate=self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage=info[.originalImage] as? UIImage{
            loadImage(image: selectedImage)
            if let imageBack=avartarImageView.image{
                backDelegate?.dataReceivedFromAvatarViewController(data: imageBack)
            }
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    
    
    
    //load imageview and set the zoom size
    func loadImage(image:UIImage){
        avartarImageView.image=image
        avartarImageView.frame.size=image.size
        avatarScrollView.contentSize=image.size
        avatarScrollView.delegate=self
        setZoomScale()
    }
    
    func setZoomScale() {
        var minZoom = min(self.view.bounds.size.width / avartarImageView!.bounds.size.width, self.view.bounds.size.height / avartarImageView!.bounds.size.height);
        if (minZoom > 1.0) {
            minZoom = 1.0;
        }
        avatarScrollView.minimumZoomScale = minZoom;
        // avatarScrollView.zoomScale = minZoom;
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return avartarImageView
    }
    
  
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
