//
//  ViewController.swift
//  otp
//
//  Created by Andy Marthin on 08/03/18.
//  Copyright © 2018 Andy Marthin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textOne: UITextField!
    @IBOutlet weak var textTwo: UITextField!
    @IBOutlet weak var textFour: UITextField!
    @IBOutlet weak var textThree: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        textOne.keyboardType = UIKeyboardType.numberPad
        textTwo.keyboardType = UIKeyboardType.numberPad
        textThree.keyboardType = UIKeyboardType.numberPad
        textFour.keyboardType = UIKeyboardType.numberPad
        
        textOne.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        textTwo.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        textThree.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        textFour.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textOne.becomeFirstResponder()
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        
        if text?.utf8.count == 1 {
            switch textField{
            case textOne:
                textTwo.becomeFirstResponder()
            case textTwo:
                textThree.becomeFirstResponder()
            case textThree:
                textFour.becomeFirstResponder()
            case textFour:
                textFour.resignFirstResponder()
            default:
                break
            }
        }
        if text?.utf8.count == 0{
            switch textField{
            case textFour:
                textThree.becomeFirstResponder()
            case textThree:
                textTwo.becomeFirstResponder()
            case textTwo:
                textOne.becomeFirstResponder()
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

