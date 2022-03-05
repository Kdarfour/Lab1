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
    }
    
    @IBAction func didTap(_ sender: Any) {
        frontLabel.isHidden = true
        
    }
    
}

