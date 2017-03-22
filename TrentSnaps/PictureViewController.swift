//
//  PictureViewController.swift
//  TrentSnaps
//
//  Created by Trent Hand on 3/22/17.
//  Copyright © 2017 Trent Hand. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    //the var used to select a pic
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    
    //this lets us pick the image we want to pass back through the snaps
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //sets the image to what we selected from the cameraTapped func below
        imageView.image = image
        
        //changes the background color to be invisible if they pick an image that doesn't fill the background
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraTapped(_ sender: Any) {
        
        //IN PRODUCTION, THIS NEEDS TO BE MOVED TO "CAMERA" INSTEAD OF SAVEDPHOTOSALBUM
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        //pulling up imagePicker when the camera icon is tapped
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func nextTapped(_ sender: Any) {
    }
}
