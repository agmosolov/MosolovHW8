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
    var animalCounter: [Character] = []
    
    var dogCounter = 0
    var catCounter = 0
    var rabbitCounter = 0
    var turtleCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for animal in relustsOfQuiz {
            animalCounter.append(animal.animal.rawValue)
            }
            
        print(animalCounter)
        
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
        
        print(dogCounter)
        print(catCounter)
        print(rabbitCounter)
        print(turtleCounter)
       
        
        }
    
    
        
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
