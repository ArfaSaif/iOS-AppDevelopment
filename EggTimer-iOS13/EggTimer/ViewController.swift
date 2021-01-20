//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":5, "Medium":7, "Hard":8]
    var eggTimer = 0
    var timer = Timer()
    @IBAction func buttonPressed(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        let hardness = sender.currentTitle ?? "Soft"
        eggTimer = eggTimes[hardness] ?? 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: eggTimes[hardness], repeats: true)
        textLabel.text = "How do you like your eggs?"
        
//
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
    }
    
    @objc func updateCounter(timer: Timer){
        let total = timer.userInfo as? Float ?? 0
            print("\(eggTimer) seconds to the end of the world")
        
            eggTimer -= 1
        if(eggTimer < 0)
        {
            textLabel.text = "Done !"
            timer.invalidate()
        }
        var pro =  1-(Float(eggTimer) / total)
        print("\(pro) total")
        progressBar.progress = pro
    }
}
