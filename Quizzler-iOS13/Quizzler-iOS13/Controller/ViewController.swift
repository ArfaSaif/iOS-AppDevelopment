//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton2: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    @IBAction func answerKeyPressed(_ sender: UIButton) {
        
        let guess = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(guess)
        
        if(userGotItRight)
        {
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
         
        self.updateUI()// do stuff 42 seconds later
       }
        
        
               
    }
   
    func updateUI(){
        questionText.text = quizBrain.updateQuestion()
        trueButton.setTitle(quizBrain.getMultipleOptions()[0], for: .normal)
        falseButton.setTitle(quizBrain.getMultipleOptions()[1], for: .normal)
        trueButton2.setTitle(quizBrain.getMultipleOptions()[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getCurrentScore()) "
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        trueButton2.backgroundColor = UIColor.clear
    }
    
}

