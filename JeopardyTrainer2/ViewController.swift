//
//  ViewController.swift
//  JeopardyTrainer2
//
//  Created by Joseph Marasco on 12/13/19.
//  Copyright © 2019 Joseph Marasco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var category0Label: UILabel!
    @IBOutlet var category0Buttons: [UIButton]!
    @IBOutlet weak var totalQuestionsLabel: UILabel!
    @IBOutlet weak var answersCorrectLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var categories: Categories!
    var currentCategories = Categories()
    var clues = Clues()
    var clueNumberToShow = 0
    var selectedCategoryNumber = 0
    var totalQuestionSeen = 0
    var answerCorrect = 0 {
        didSet {
            answersCorrectLabel.text = "\(answerCorrect)"
        }
    }
    
    var score = 0 {
        didSet {
            if score < 0 {
                scoreLabel.textColor = .red
            } else {
                scoreLabel.textColor = .systemBlue
            }
            scoreLabel.text = "$\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = Categories()
        loadCategories()
    }
    
    func loadCategories() {
        categories.categoryArray = []
        currentCategories.categoryArray.removeAll()
        categories.getData {
            self.currentCategories.categoryArray.append(self.categories.categoryArray.randomElement()!)
            self.category0Label.text = self.currentCategories.categoryArray[0].title
            self.loadClues()
        }
    }
    
    func loadClues() {
        
        for button in category0Buttons {
            button.isEnabled = true
            button.backgroundColor = .systemBlue
        }
            
        self.clues.cluesArray = []
        self.clues.id = self.currentCategories.categoryArray[0].id
        self.clues.getData {
            for i in 0..<self.category0Buttons.count {
                self.category0Buttons[i].setTitle("$\(self.clues.cluesArray[i].value)", for: .normal)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentQuestion" {
            let destination = segue.destination as! QuestionsViewController
            destination.clue = clues.cluesArray[clueNumberToShow]
            destination.categoryTitle = self.currentCategories.categoryArray[selectedCategoryNumber].title
        }
    }
    
    @IBAction func segueAfterYesPressed(segue: UIStoryboardSegue) {
        answerCorrect += 1
        score = score + clues.cluesArray[clueNumberToShow].value
        
    }
    
    @IBAction func segueAfterNoPressed(segue: UIStoryboardSegue) {
        score = score - clues.cluesArray[clueNumberToShow].value
        
    }
    
    @IBAction func loadButtonPressed(_ sender: UIBarButtonItem) {
        
        loadCategories()
    }
    
    @IBAction func category0ButtonPressed(_ sender: UIButton) {
        selectedCategoryNumber = 0
        clueNumberToShow = sender.tag
        totalQuestionSeen += 1
        totalQuestionsLabel.text = "\(totalQuestionSeen)"
        sender.isEnabled = false
        sender.backgroundColor = .lightGray
        sender.setTitle("", for: .normal)
        performSegue(withIdentifier: "PresentQuestion", sender: sender)
    }
    
}

