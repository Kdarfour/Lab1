//
//  ViewController.swift
//  Lab1
//
//  Created by Kelvin Owiredu Darfour on 26/02/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
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
        frontLabel.text = question
        backLabel.text = answer
    }
    @IBOutlet weak var card: UIView!

    
}

