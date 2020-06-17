//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Deepak Kumar Rout on 6/17/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(_ height: Float, _ weight: Float) -> Void {
        let bmiValue = weight / pow(height, 2)
        bmi = BMI(value: bmiValue, advice: findCategory(bmiValue).0, color: findCategory(bmiValue).1)
    }
    
    func findCategory(_ bmiValue: Float) -> (String, UIColor) {
        if bmiValue < 18.5 {
            return ("Eat More Pie", #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            return ("Fit as a fiddle", #colorLiteral(red: 0, green: 0.7024405599, blue: 0, alpha: 1))
        } else {
            return ("Eat less pies", #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        }
    }
    
    func  getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
            
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0 )
    }
}
