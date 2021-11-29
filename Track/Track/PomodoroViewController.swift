//
//  ViewController.swift
//  Track
//
//  Created by Daniel Williams on 11/7/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import AudioToolbox

class PomodoroViewController: UIViewController {

    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    var seconds = 0
    var pomoTapped = false
    var shortTapped = false
    var longTapped = false
    
    func runTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(PomodoroViewController.updateTimer)), userInfo: nil, repeats: true)
        pauseButton.isEnabled = true
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            // AudioServicesPlaySystemSound(SystemSoundID(1104))
        }
        else {
            seconds -= 1     //This will decrement(count down)the seconds.
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
        
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        //AudioServicesPlaySystemSound(SystemSoundID(1104))
        if isTimerRunning == false {
            runTimer()
            self.startButton.isEnabled = false
        }
    }
    
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if self.resumeTapped == false {
            timer.invalidate()
            isTimerRunning = false
            self.resumeTapped = true
            self.pauseButton.setTitle("RESUME", for: .normal)
            pauseButton.setTitleColor(UIColor .white, for: .normal)
        }
        else {
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
            self.pauseButton.setTitle("PAUSE", for: .normal)
            pauseButton.setTitleColor(UIColor .white, for: .normal)
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        timer.invalidate()
        if shortTapped == true {
            shortTapped = true
            pomoTapped = false
            longTapped = false
            seconds = 300
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
        else if longTapped == true {
            shortTapped = false
            pomoTapped = false
            longTapped = true
            seconds = 600
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
        else if pomoTapped == true {
            shortTapped = false
            pomoTapped = true
            longTapped = false
            seconds = 1500
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
        isTimerRunning = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    
    @IBAction func shortAction(_ sender: Any) {
        shortTapped = true
        pomoTapped = false
        longTapped = false
        seconds = 300
        let time = timeString(time: 300)
        timerLabel.text = time
        textLabel.text = "Relax...for now"
        
    }
    
    @IBAction func pomoAction(_ sender: Any) {
        shortTapped = false
        pomoTapped = true
        longTapped = false
        seconds = 1500
        let time = timeString(time: 1500)
        timerLabel.text = time
        textLabel.text = "Focus!"
    }
    
    
    @IBAction func longAction(_ sender: Any) {
        shortTapped = false
        pomoTapped = false
        longTapped = true
        seconds = 600
        let time = timeString(time: 600)
        timerLabel.text = time
        textLabel.text = "Relax...for now"
    }
    
    
    func timeString(time:TimeInterval) -> String {
        // let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseButton.isEnabled = false
    }


}

