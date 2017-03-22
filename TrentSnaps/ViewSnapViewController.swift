//
//  ViewSnapViewController.swift
//  TrentSnaps
//
//  Created by Trent Hand on 3/22/17.
//  Copyright © 2017 Trent Hand. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descripLabel: UILabel!
    
    //receives the snap
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        descripLabel.text = snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imageURL))
    }

    //removing the snap from Firebase
    override func viewWillDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.key).removeValue()
        
        FIRStorage.storage().reference().child("images").child("\(snap.uuid).jpg").delete { (error) in
            print("snap deleted")
        }
    }

}
