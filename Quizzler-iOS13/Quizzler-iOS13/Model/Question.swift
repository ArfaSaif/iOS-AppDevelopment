//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Arfa Saif on 2020-05-02.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct Question {
    let text : String
    let answer : [String]
    let correct_ans : String
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        correct_ans = correctAnswer
        
    }
}
