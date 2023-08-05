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

    // "사진 촬영" 버튼 클릭
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self;
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String];
            imagePicker.allowsEditing = false;
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera");
        }
        
    }
    
    // "사진 불러오기" 버튼 클릭
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false;
            
            imagePicker.delegate = self;
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String];
            imagePicker.allowsEditing = true;
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album")
        }
    }
    
    // "비디오 촬영" 버튼 클릭
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self;
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String];
            imagePicker.allowsEditing = false;
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera");
        }
    }
    
    // "비디오 불러오기" 버튼 클릭
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false;
            
            imagePicker.delegate = self;
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String];
            imagePicker.allowsEditing = false;
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString;
        
        if(mediaType.isEqual(to: kUTTypeImage as NSString as String)) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage;
            
            if(flagImageSave) {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage;
        }
        else if(mediaType.isEqual(to: kUTTypeMovie as NSString as String)) {
            if(flagImageSave) {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL);
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil);
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 경고표시용 메서드
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

