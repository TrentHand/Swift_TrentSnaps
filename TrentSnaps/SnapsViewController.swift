//
//  SnapsViewController.swift
//  TrentSnaps
//
//  Created by Trent Hand on 3/22/17.
//  Copyright © 2017 Trent Hand. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        //if a view is connected as a modal, it will simply revert back to the home screen and logout the user
        dismiss(animated: true, completion: nil)
        print("user signed out")
    }

}
