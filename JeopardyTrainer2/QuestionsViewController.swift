//
//  QuestionsViewController.swift
//  JeopardyTrainer2
//
//  Created by Joseph Marasco on 12/13/19.
//  Copyright © 2019 Joseph Marasco. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var getItRightLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    
    var clue: Clue!
    var categoryTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if clue == nil {
            questionLabel.text = "ERROR: clue was nil"
        }
        if categoryTitle == nil {
            questionLabel.text = "ERROR: category title was nil"
        }
        categoryTitleLabel.text = "Category: \(categoryTitle!)"
        questionLabel.text = clue.question
        answerLabel.text = clue.answer
    }
    
    @IBAction func showAnswerButtonPressed(_ sender: UIButton) {
        showAnswerButton.isHidden = true
        answerLabel.isHidden = false
        getItRightLabel.isHidden = false
        yesButton.isHidden = false
        noButton.isHidden = false
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
    }
    

}
