//
//  ViewController.swift
//  BPM Calculator
//
//  Created by Joseph Miller on 8/7/20.
//  Copyright © 2020 Joseph Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bpm = 0
    var taps = 0
    var lastTime: Date?
    
    @IBOutlet weak var bpmLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapScreen(_ sender: Any) {
        taps += 1
        bpm = Int(calculateBPM())
        print(bpm)
        bpmLabel.text = String(bpm)
    }
    
    func timePassed() -> TimeInterval {
        // calculate time passed
        if lastTime == nil {
            lastTime = Date()
        }
        return lastTime!.timeIntervalSinceNow * -1
    }
    
    func calculateBPM() -> Double {
        // taps in time passed
        let timePassedSeconds = timePassed()
        let timePassedMinutes = (timePassedSeconds/60)
        if timePassedSeconds < 1 {
            return 0
        }
        return Double(taps) / timePassedMinutes
    }
    
}

