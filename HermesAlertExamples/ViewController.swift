//
//  ViewController.swift
//  HermesAlertExamples
//
//  Created by Alessandro Marcon on 23/11/2020.
//

import UIKit
import HermesAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // This is an identifier used for UI test porpouse
        view.accessibilityIdentifier = "mainViewController"
    }


    @IBAction func showSimpleAlert(_ sender: UIButton) {
        Hermes(message: "Hey, i'm a Simple Alert!").show()
    }
    
    
    @IBAction func showTwoButtonsAlert(_ sender: UIButton) {
        Hermes(title: "2 Buttons", message: "Here you can choose OK or Cancel", alert: .twoButtons).show()
    }
    
    
    @IBAction func showInstagramStyleAlert(_ sender: UIButton) {
        Hermes(title: "Instagram", message: "Do you like Instagram style?", alert: .instagram).show()
    }
    
    
    @IBAction func showTextFieldAlert(_ sender: UIButton) {
        Hermes(title: "Input text", message: "Insert your text down here!", alert: .textfield).show()
    }
    
    
    @IBAction func showCheckBoxAlert(_ sender: UIButton) {
        let checkboxAlert = Hermes(title: "Options alert", message: "Use me for remember user preference!", checkboxMessage: "Remember", alert: .checkbox)
        checkboxAlert.delegate = self
        checkboxAlert.show()
    }
    
}

extension ViewController: HermesAlertDelegate {
    
    func confirmButtonDidTapped(sender: UIViewController, with options: [HermesParam : Any]?) {
        // If you implemente HermesAlertDelegate, here you will confirm tap button response and
        // in case of textfield or checkbox alert, you will have text inserted, or checkbox state
        // selected by user
        
        if let options = options {
            if let checkbox = options[.checked] {
                print("User selected checkbox alert? \(checkbox)")
            }
            
            if let text = options[.textValue] {
                print("User typed \(text)")
            }
        }
    }
}
