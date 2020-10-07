//
//  ViewController.swift
//  TimerFun
//
//  Created by Gharin Pautz on 10/5/20.
//  Copyright © 2020 Gharin Pautz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: - Timer
    // use a timer when you want code to execute periodically (after some time passes)
    // 2 types of timers
    // 1. non-repreating
    // 2. repeating
    // use the invalidate() method to stop the timer
    var timer: Timer? = nil
    
    // task: define a seconds property (Int)
    // with a property observer that updates timeLabel
    var seconds: Int = 0 {
        didSet {
            timeLabel.text = "\(seconds)"
        }
    }
    
    // task: when the user presses pause or reset, we need to invalidate the timer and set timer = nil (plus something else for reset)
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            print("tick")
            self.seconds += 1 // fully qualify external reference names
            // recall closures "capture" external references
            // closures execute LATER
            // potentially, the viewController could be deallocated and the closure tries to refer to its seconds property
        })
    }
    
    func stopTimer() {
        timer?.invalidate() // optional chaining
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        print("Start pressed")
        if timer == nil {
            startTimer()
        }
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        print("pause pressed")
        stopTimer()
    }

    @IBAction func resetButtonPressed(_ sender: UIButton) {
        print("reset pressed")
        stopTimer()
        seconds = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

