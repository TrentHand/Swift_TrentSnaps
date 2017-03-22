//
//  SignInViewController.swift
//  TrentSnaps
//
//  Created by Trent Hand on 3/21/17.
//  Copyright © 2017 Trent Hand. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func startSnappingTapped(_ sender: Any) {
        //the command used to pull in Firebase commands and sign in with email
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("We have an ERROR!!!:\(error)")
                //if the email is not already registered, create a new user
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("We have an Error during create user\(error)")
                    } else {
                        print("Created user successfully")
                        //moving the user into the next screen after a successful signin
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
                    }
                })
            } else {
                print("Sign in successful!")
                //moving the user into the next screen after a successful signin
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
            }
            //completion is asking what should happen after the email/password are done
        })
    }
}

