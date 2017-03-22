//
//  SelectUserViewController.swift
//  TrentSnaps
//
//  Created by Trent Hand on 3/22/17.
//  Copyright © 2017 Trent Hand. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //the array of users we get back from Firebase
    var users : [User] = []
    
    var imageURL = ""
    var descrip = ""
    var uuid = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //pull users from Firebase
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
            let user = User()
            user.email = (snapshot.value as! NSDictionary)["email"] as! String
            user.uid = snapshot.key
            //adds the new user to the users in FB
            self.users.append(user)
            //reloads the tableView to show the new users
            self.tableView.reloadData()
        })
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //setting the number of rows to the number of users
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        //set the user to the one selected from the cell
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        return cell
    }
    
    //determining what happens when the user selects who to send the snap to
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        let snap = ["from":FIRAuth.auth()?.currentUser?.email, "description":descrip, "imageURL":imageURL, "uuid":uuid]
        FIRDatabase.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
        
        //sending the user back to the home screen
        navigationController!.popToRootViewController(animated: true)
    }
    

    
}
