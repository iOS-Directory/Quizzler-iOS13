//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Liked all the components
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Getting the questions, answers and methods from Model
    var quizBrain = QuizBrain()
    
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Updating ui after app loads
        updateUi()
    }
    
    
    // When any button is pressed it will trigger these actions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //Name of the button being pressed
        let userAnswer = sender.currentTitle
        
        //Checking if the button pressed match the actual answer
        let userGoItRight = quizBrain.checkAnswer(userAnswer!)
        
        //Prevent to not go over the actual amount of questions in the array
        quizBrain.nextQuestion()
        
        //Change background color on the pressed button
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            sender.alpha = 1
        })
        
        //Logic for correct incorrect answers
        if userGoItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        //update user interface by invoking the func
        updateUi()
    }
    
    //Update diferent elements of the user interface
    func updateUi(){
        //Kepp track of score
            scoreLabel.text = quizBrain.getScore()
        
        //Set the Label equal to the current question and updates after each click
        questionLabel.text = quizBrain.getQuestionText()
        
        //Sets the Progress bar equal to the returned Float
        progressBar.progress = quizBrain.getProgress()
        
        
        //update button background from red/green back to clear with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        })
    }
}

