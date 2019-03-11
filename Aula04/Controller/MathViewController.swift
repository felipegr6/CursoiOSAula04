//
//  MainViewController.swift
//  Aula04
//
//  Created by Virtual Machine on 11/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var numberOneTextField: UITextField!
    @IBOutlet weak var numberTwoTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var operationSegControl: UISegmentedControl!
    
    var ops: Operation = .sum
    var result:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func operationAction(_ sender: Any) {
        ops = Operation(rawValue: operationSegControl.selectedSegmentIndex) ?? .sum
    }
    
    @IBAction func submit(_ sender: Any) {
        let numberOneText = numberOneTextField.text!
        let numberTwoText = numberTwoTextField.text!
        
        guard let number01 = Double(numberOneText), let number02 = Double(numberTwoText) else {
            print("Não pode converter os números")
            return
        }
        
        switch ops {
        case .sum:
            result = number01 + number02
        case .minus:
            result = number01 - number02
        case .times:
            result = number01 * number02
        case .division:
            result = number01 / number02
        }
        
        resultLabel.text = String(result)
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        performSegue(withIdentifier: "showNext", sender: String(result))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == "showNext" {
            let nextVC = segue.destination as? ResultViewController
            nextVC?.result = sender as? String
        }
    }
    
    enum Operation:Int {
        case sum, minus, times, division
    }
    
    
}
