//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
// IB(interface builder) outlet: to reference UI elements
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
      // to remname: error  is not key value coding-complient for the key
      // control click and refactor/rename
      
    @IBOutlet weak var diceImageView2: UIImageView!
    // who.what = value
    // change appearance using outlet
    // action is triggered by an event
    // touch up inside, tap
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // loading at the beginning
        // image literal
        diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
        diceImageView1.alpha = 0.5
        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
        
    }

    @IBAction func rollButtonPressed(_ sender: Any) {
        // what should happen
        print("Button got tapped")
        diceImageView1.image = #imageLiteral(resourceName: "DiceFour")
        diceImageView2.image = #imageLiteral(resourceName: "DiceFour")
        
    
    }
    
}

