//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    var splitResult: Float = 0.0
    var tipPercentageLabel: String = ""
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        if sender.titleLabel?.text == "0%"  {
            tipPercentageLabel = sender.titleLabel!.text!
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
        
        if sender.titleLabel?.text == "10%"  {
            tipPercentageLabel = sender.titleLabel!.text!
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        }
        
        if sender.titleLabel?.text == "20%"  {
            tipPercentageLabel = sender.titleLabel!.text!
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = Float(billTextField.text!) ?? 0.0
        let numberOfPeople = Float(splitNumberLabel.text!) ?? 0.0
        
        var tipPercentage: Float = calculatorBrain.getTipPercentage(zeroPctButton: zeroPctButton, tenPctButton: tenPctButton, twentyPctButton: twentyPctButton)
        
        let amountPerPerson = calculatorBrain.calculateTip(totalBill: billAmount, tipPercentage: tipPercentage, numberOfPeople: numberOfPeople)
        
         splitResult = amountPerPerson
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amountPerPerson = splitResult
            destinationVC.numberOfPeople = splitNumberLabel.text!
            destinationVC.tipPercentage = tipPercentageLabel
        }
    }
    

    
    
}

