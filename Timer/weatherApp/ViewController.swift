//
//  ViewController.swift
//  weatherApp
//
//  Created by Patil, Yash M on 10/26/18.
//  Copyright © 2018 Patil, Yash M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reset: UIButton!
    var decimals:Double = 0
    @IBOutlet weak var start: UIButton!
    var timer:Timer!
    var minute = 0
    var seconds:Double = 0
    var timerIsOn: Bool = false
    var pause: Bool = false
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont(name: "Courier", size: 67)
        timerLabel.text = "00:00.00"
        start.setTitle("Start",for:.normal)
        start.titleLabel?.font = UIFont(name: "Courier", size: 55)
        reset.setTitle("Reset",for: .normal)
        reset.titleLabel?.font = UIFont(name: "Courier", size: 55)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func startPause(_ sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer()
    {
        seconds += 0.01
        if seconds >= 60
        {
            minute += 1
            seconds = 0
        }
        timerLabel.text = String(format: "%02d:%05.2f", minute, seconds)
        
    }
    @IBAction func resetButton(_ sender: UIButton)
    {
        timer.invalidate()
        decimals = 0
        timerLabel.text = "00:00.00"
        start.isEnabled = true
        start.setTitle("Start", for:.normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

