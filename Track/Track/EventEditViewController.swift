//
//  EventEditViewController.swift
//  Track
//
//  Created by Alex Santiago on 11/27/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit
import Parse

class EventEditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = selectedDate

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        var newTask = PFObject(className:"Task")
        
        // TODO Fix user id
        newTask["taskDeliverable"] = nameTextField.text
        newTask["dueDate"] = datePicker.date
        newTask["isCompleted"] = false
        
        newTask.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            print("Task saved")
          } else {
            print(error)
          }
        }
        
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTextField.text
        newEvent.date = datePicker.date
        eventsList.append(newEvent)
        navigationController?.popViewController(animated: true)
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
