//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by FGT MAC on 11/24/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let question: String
    let optionalAnswers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String ) {
        question = q
        optionalAnswers = a
        self.correctAnswer = correctAnswer
    }
    
}
 
