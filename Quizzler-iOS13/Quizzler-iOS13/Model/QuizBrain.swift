//
//  quizBrain.swift
//  Quizzler-iOS13
//
//  Created by Arfa Saif on 2020-05-05.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let questionArray = [
       Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
       Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
       Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
       Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
       Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
       Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
       Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
       Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
       Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
       Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    var qNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer : String) -> Bool {
        if(userAnswer == questionArray[qNumber].correct_ans)
        {
            self.score += 1
            return true
        }else{
            return false
        }
        
        
    }
    func updateQuestion() -> String{
        return questionArray[qNumber].text
    }
    func getProgress() -> Float{
        let numQuestions = questionArray.count
        return Float(qNumber + 1) / Float(numQuestions)
    }
    mutating func nextQuestion(){
        let numQuestions = questionArray.count - 1
        
        if (self.qNumber < numQuestions)
        {
            self.qNumber = (self.qNumber + 1)
            
        } else {
            self.qNumber = 0
            self.score = 0
        }
        
    }
    func getCurrentScore() -> Int {
        return score
    }
    func getMultipleOptions()-> [String]
    {
        return questionArray[qNumber].answer
    }
}
