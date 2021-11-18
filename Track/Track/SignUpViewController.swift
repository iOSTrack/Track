//
//  SignUpViewController.swift
//  Track
//
//  Created by Josh Minucci on 11/9/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    
    
    @IBOutlet weak var FirstNameField: UITextField!
    @IBOutlet weak var LastNameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = EmailField.text
        user.password = PasswordField.text
        user.email = EmailField.text
        user["firstName"] = FirstNameField.text
        user["lastName"] = LastNameField.text
        user.signUpInBackground()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
