//
//  ViewController.swift
//  SeaFood
//
//  Created by Arfa Saif on 2020-08-29.
//  Copyright © 2020 Arfa Saif. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
    }


    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        // when camera is clicked, launce the image picker controller
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            ImageView.image = imagePicked
            
            // convert image picked to a ciimage
            guard let ciImage = CIImage(image: imagePicked) else {
                fatalError("Unable to convert UIImage to CIImage")
            }
            detect(image: ciImage);
        }

    }
    func detect(image : CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3_2().model) else{
            fatalError("Error loading model")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else{
                fatalError("Unable to get back results")
            }
        
        }
        let handler = VNImageRequestHandler(ciImage: image)
        
        do{
            try handler.perform([request])
        }catch{
            print("Error performing request")
        }
        
        
    }
    
}

