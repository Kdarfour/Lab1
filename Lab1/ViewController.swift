//
//  ViewController.swift
//  Lab1
//
//  Created by Kelvin Owiredu Darfour on 26/02/2022.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        card.layer.cornerRadius = 20.0
        
        backLabel.clipsToBounds = true
        frontLabel.clipsToBounds = true
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        readSavedFlashcards()
        
        if flashcards.count == 0{
        updateFLashcards(question: "Who was the first man to land on the Moon?", answer: "Neil Armstrong")
        }else {
            updateLabels()
            updateNextPrevButtons()
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationControlller = segue.destination as! UINavigationController
        let creationController = navigationControlller.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
    
    
    @IBAction func didTap(_ sender: Any) {
       
        if frontLabel.isHidden{
                frontLabel.isHidden = false
        }else{
            frontLabel.isHidden = true
        }
    }
    
    func updateFLashcards(question: String, answer: String){
        let flashcard = Flashcard(question: question, answer: answer)
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        flashcards.append(flashcard)
        currentIndex = flashcards.count - 1
        print("Added new flashcard")
        print("We now have \(flashcards.count) flashcards")
        print("Our current Index is \(currentIndex)")
        
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons(){
        
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        } else{
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0{
            prevButton.isEnabled = false
        } else{
            prevButton.isEnabled = true
        }
    }
    func updateLabels(){
        
        let currentFlashcard = flashcards[currentIndex]
        
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
         currentIndex = currentIndex - 1
        
        updateLabels()
        
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        currentIndex = currentIndex + 1
       
        updateLabels()
       
        updateNextPrevButtons()
    }
    
    func saveAllFlashcardsToDisk(){
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return  ["question": card.question, "answer": card.answer]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards(){
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            let savedCards = dictionaryArray.map{ dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    @IBOutlet weak var card: UIView!

    
}

