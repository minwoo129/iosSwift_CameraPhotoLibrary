//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 류민우 on 2023/08/05.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
    }
    
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
    }
    
    // 경고표시용 메서드
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

