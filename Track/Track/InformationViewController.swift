//
//  InformationViewController.swift
//  Track
//
//  Created by Josh Minucci on 11/30/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit
import Parse

class InformationViewController: UIViewController, UITextViewDelegate {


  
    @IBOutlet weak var FirstName: UILabel!
    @IBOutlet weak var LastName: UILabel!
    @IBOutlet weak var Email: UILabel!
        
    override func viewDidLoad() {
            super.viewDidLoad()
        let user = PFUser.current()
        
        FirstName.text = user!["firstName"] as! String
            LastName.text = user!["lastName"] as! String
        Email.text = user!.email

        // Do any additional setup after loading the view.
    }
    
    func textfieldshouldreturn ( textfield: UITextField)
    {
    
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
