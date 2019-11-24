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
    let quiz = [
    "Four + Two is equal to Six",
    "Five - Three is greater than One",
    "Three + Eight is less than Ten"
    ]
    //Start with first question
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
    }

    //Here I Linked the true button and changed the
    //type to uiButton and then drag the dot to the
    //false button as well
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if(questionNumber < quiz.count - 1){
            print(questionNumber)
            questionNumber += 1
            updateUi()
        }else{
            questionLabel.text = "Completed!"
        }
 
//        if(sender.currentTitle! == "True"){
//            print("Correct")
//        }else{
//            print("Incorrect!")
//        }
    }
    
    //Create function to avoid repeating code
    func updateUi(){
        questionLabel.text = quiz[questionNumber]
    }

}

