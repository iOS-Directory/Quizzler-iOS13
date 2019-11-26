//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by FGT MAC on 11/25/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    //Array of questions to be display
    //Each question is an instance or a copy of the Question struct
    let quiz = [
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
    
    //Start with first question in the array
    var currentQuestion = 0
    var score = 0
    
    //Check amount of question in array to prevent going over the total
    //Because this method is mutating the currentQuestion variable
    //the mutating keyword must be use to reconstruct the struct
    mutating func nextQuestion(){
        if(currentQuestion < quiz.count - 1){
            currentQuestion += 1
        }else{
            currentQuestion = 0
            score = 0
        }
    }
    
    //Check if the user answer match the actual answer
    mutating func checkAnswer (_ userAnswer: String) -> Bool{
        let actualAnswer = quiz[currentQuestion].correctAnswer
        //Logic for correct incorrect answers
        if( userAnswer == actualAnswer){
            score += 1
            return true
        }else{
            return false
        }
    }
    
    //Gets the current question to send back the text to be display in the label
    func getQuestionText()-> String{
        return quiz[currentQuestion].question
    }
    
    //Gets the text for answers
     func getAnswerText()-> [String]{
        return quiz[currentQuestion].optionalAnswers
     }
    
    //Returns a Float number to show the progress bar
    func getProgress()-> Float {
        let completionPercentage = Float(currentQuestion + 1) / Float(quiz.count)
        return completionPercentage
    }
    
    //Get score
    func getScore()-> String{
        return String("Score: \(score)")
    }
    
}
