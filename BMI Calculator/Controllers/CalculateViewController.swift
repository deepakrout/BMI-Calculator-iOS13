//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Deepak Rout on 06/17/2020.
//  Copyright © 2019 Deepak Rout. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%dkg", Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height, weight)
        
        self.performSegue(withIdentifier: "gotoResults", sender: self)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResults" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.bmiValue = calculatorBrain.getBMIValue()
            resultVC.bmiAdvice = calculatorBrain.getAdvice()
            resultVC.bmiColor = calculatorBrain.getColor()
            
        }
    }
}

