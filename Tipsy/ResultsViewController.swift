//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Big Field Digital on 18/10/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var amountPerPerson: Float?
    var numberOfPeople: String?
    var tipPercentage: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", amountPerPerson ?? 0.0)
        
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercentage!) tip."
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
