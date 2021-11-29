//
//  TrackViewController.swift
//  Track
//
//  Created by Daniel Williams on 11/22/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit
import Parse

class TrackViewController: UIViewController {
    @IBOutlet weak var trackView: TrackOvalView!
    @IBOutlet weak var totalDeliverablesLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    
    var tasksCompleted = 0
    var loadedTasks = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        queryTasks()
        trackView.drawTrack(percentComplete: 0.0)
    }
    
    @IBAction func refreshTrack(_ sender: Any) {
        queryTasks()
    }
    
    func queryTasks() {
        let query = PFQuery(className: "Task")
        self.tasksCompleted = 0
        self.loadedTasks = []

        query.findObjectsInBackground() { (tasks, error) in
            if tasks == nil {
                // The request failed
                print("Unable to refresh")
            } else {
                print("Refresh success")
                self.loadedTasks = tasks!
                
                for task in self.loadedTasks {
                    if (task["isCompleted"] as! Bool == true) {
                        self.tasksCompleted += 1
                    }
                }
                
                if(self.loadedTasks.count != 0){
                    self.trackView.drawTrack(percentComplete: CGFloat(self.tasksCompleted) / CGFloat(self.loadedTasks.count))
                }
                self.totalDeliverablesLabel.text = String(self.loadedTasks.count)
                self.completedLabel.text = String(self.tasksCompleted)
                self.remainingLabel.text = String(self.loadedTasks.count - self.tasksCompleted)
            }
        }
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
