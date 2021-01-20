//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var pressedButtonValue : Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitNumberLabel.text = "0"
        pressedButtonValue = 0.1
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        switch sender.currentTitle {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            pressedButtonValue = 0.0
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            pressedButtonValue = 0.1
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            pressedButtonValue = 0.2
            
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            pressedButtonValue = 0.0
        }
        billTextField.endEditing(true)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton){
        print(pressedButtonValue)
        
        print(billTextField.text ?? 0)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        billTextField.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        
    }
        
    
}

