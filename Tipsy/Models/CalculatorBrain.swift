//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Big Field Digital on 19/10/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    func getTipPercentage(zeroPctButton: UIButton, tenPctButton: UIButton, twentyPctButton: UIButton) -> Float {
        if zeroPctButton.isSelected == true {
            return Float(0) / Float(100)
        }
        if tenPctButton.isSelected == true {
            return Float(10) / Float(100)
        }
        if twentyPctButton.isSelected == true {
            return Float(20) / Float(100)
        }        
        return 0.0
    }
    
    func calculateTip(totalBill: Float, tipPercentage: Float, numberOfPeople: Float) -> Float {
        let tipAmount = totalBill * tipPercentage
        let totalAmount = totalBill + tipAmount
        let amountPerperson = totalAmount / numberOfPeople
        return amountPerperson
    }
    
}
