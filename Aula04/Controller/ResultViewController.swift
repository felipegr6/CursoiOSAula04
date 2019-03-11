//
//  ResultViewController.swift
//  Aula04
//
//  Created by Virtual Machine on 11/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result: String?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultSlide: UISlider!
    @IBOutlet weak var CommentsTextView: UITextView!
    
    @IBOutlet weak var `switch`: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = result!
        resultSlide.value = Float(result!) ?? 0.0
    }

    @IBAction func changeValue(_ sender: Any) {
        resultLabel.text = String(resultSlide.value)
    }
    
    @IBAction func enableComments(_ sender: Any) {
        CommentsTextView.isEditable = `switch`.isOn
        CommentsTextView.isSelectable = `switch`.isOn
    }
}

extension ResultViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
    }
}
