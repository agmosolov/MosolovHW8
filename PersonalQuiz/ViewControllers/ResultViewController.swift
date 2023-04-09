//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultWithEmojiLabel: UILabel!
    @IBOutlet var resultWithDescriptionLabel: UILabel!
   
    var relustsOfQuiz: [Answer]!
    private var animalCounter: [Character] = []
    
    private var dogCounter = 0
    private var catCounter = 0
    private var rabbitCounter = 0
    private var turtleCounter = 0
    
    private var winner: Character!
    private var winnerDefinition: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for animal in relustsOfQuiz {
            animalCounter.append(animal.animal.rawValue)
        }
        
        for animal in animalCounter {
            switch animal {
            case Animal.dog.rawValue:
                dogCounter += 1
            case Animal.cat.rawValue:
                catCounter += 1
            case Animal.rabbit.rawValue:
                rabbitCounter += 1
            case Animal.turtle.rawValue:
                turtleCounter += 1
            default:
                break
            }
        }
        
        let finalScore = [
            Animal.dog.rawValue : dogCounter,
            Animal.cat.rawValue : catCounter,
            Animal.rabbit.rawValue : rabbitCounter,
            Animal.turtle.rawValue : turtleCounter
        ]
        
        
        let maxResult = finalScore.values.max()
        
        
        if finalScore[Animal.dog.rawValue] == maxResult {
            winner = Animal.dog.rawValue
        } else if finalScore[Animal.cat.rawValue] == maxResult {
            winner = Animal.cat.rawValue
        } else if finalScore[Animal.rabbit.rawValue] == maxResult {
            winner = Animal.rabbit.rawValue
        } else {
            winner = Animal.turtle.rawValue
        }
        
        resultWithEmojiLabel.text = "Вы - \(winner!)"
        
        switch winner {
        case Animal.dog.rawValue:
            winnerDefinition = Animal.dog.definition
        case Animal.cat.rawValue:
            winnerDefinition = Animal.cat.definition
        case Animal.rabbit.rawValue:
            winnerDefinition = Animal.rabbit.definition
        case Animal.turtle.rawValue:
            winnerDefinition = Animal.turtle.definition
        default:
            break
        }
        
        resultWithDescriptionLabel.text = winnerDefinition
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
