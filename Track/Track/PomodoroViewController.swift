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

enum MODE {
    case POMODORO
    case SHORT_BREAK
    case LONG_BREAK
}

class PomodoroViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer = Timer()
    var isTimerRunning = false
    var seconds = 1500
    var timerMode:MODE = MODE.POMODORO
    
    func runTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(PomodoroViewController.updateTimer)), userInfo: nil, repeats: true)
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
            self.pauseButton.isEnabled = true
        }
    }
    
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if isTimerRunning == true {
            timer.invalidate()
            isTimerRunning = false
            self.pauseButton.isEnabled = false
            self.startButton.isEnabled = true
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        timer.invalidate()
        switch timerMode {
        case MODE.SHORT_BREAK:
            seconds = 300
            timerLabel.text = timeString(time: TimeInterval(seconds))
        case MODE.LONG_BREAK:
            seconds = 600
            timerLabel.text = timeString(time: TimeInterval(seconds))
        case MODE.POMODORO:
            seconds = 1500
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
        isTimerRunning = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    
    @IBAction func shortAction(_ sender: Any) {
        timerMode = MODE.SHORT_BREAK
        seconds = 300
        let time = timeString(time: 300)
        timerLabel.text = time
        textLabel.text = "Relax...for now"
    }
    
    @IBAction func pomoAction(_ sender: Any) {
        timerMode = MODE.POMODORO
        seconds = 1500
        let time = timeString(time: 1500)
        timerLabel.text = time
        textLabel.text = "Focus!"
    }
    
    
    @IBAction func longAction(_ sender: Any) {
        timerMode = MODE.LONG_BREAK
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
        timerLabel.text = timeString(time: 1500)
        startButton.layer.cornerRadius = 20
        pauseButton.layer.cornerRadius = 20
        resetButton.layer.cornerRadius = 20
        pauseButton.isEnabled = false
        
    }


}

