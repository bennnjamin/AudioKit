//
//  MainViewController.swift
//  RecorderDemo
//
//  Created by Benjamin Fitzgerald on 5/2/17.
//  Copyright © 2017 Laurent Veliscek. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {


    @IBAction func onRecordVideoTapped(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) == false {
            print("Camera unavailable")
            
        } else {
            let cameraController = UIImagePickerController()
            cameraController.sourceType = .camera
            cameraController.mediaTypes = UIImagePickerController.availableMediaTypes(for: UIImagePickerControllerSourceType.camera)!
            cameraController.allowsEditing = false
            cameraController.delegate = self
            present(cameraController, animated: true, completion: nil)
        }
    }
    
    
}

extension MainViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo: [String : Any]){
        self.dismiss(animated: true, completion: nil)
        if let movieUrl = didFinishPickingMediaWithInfo[UIImagePickerControllerMediaURL] as? URL {
            print("Got a video")
        } else if let image = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage {
            print("Got a photo")
        }
    }
    
    func imagePickerControllerDidCancel(_: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MainViewController: UINavigationControllerDelegate {
}
