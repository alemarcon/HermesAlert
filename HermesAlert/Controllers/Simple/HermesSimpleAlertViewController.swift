//
//  HermesBasicAlertViewController.swift
//  Hermes basic 5 lines alert view controller
//
//  Created by Alessandro Marcon on 12/04/2019.
//  Copyright © 2019 Hermes. All rights reserved.
//

import UIKit

class HermesSimpleAlertViewController: HermesAlertViewController {
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertConfirmButton: UIButton!
    @IBOutlet weak var alertMessageLabel: UILabel!
    @IBOutlet weak var alertIconImageView: UIImageView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        let bundle = Bundle(for: HermesSimpleAlertViewController.classForCoder())
        super.init(nibName: HermesConst.SIMPLE_ALERT_XIB, bundle: bundle)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    convenience init(message: String = "") {
        self.init()
        alertMessge = message
        customMessageAttributed = nil
    }
    
    convenience init(message: NSAttributedString) {
        self.init()
        customMessageAttributed = message
        alertMessge = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Basic UI Customization
    override func customizeAlertInterface() {
        alertView.layer.masksToBounds = true
        alertView.layer.cornerRadius = 22.0
    }
    
    // MARK: - Icon customization
    override func customizeIcon() {
        if let image = icon {
            alertIconImageView.image = image
        }
    }
    
    // MARK: - Message customization
    override func customizeMessageLabel() {
        if let message = alertMessge {
            alertMessageLabel.text = message
        }
        
        if let attrMessage = customMessageAttributed {
            alertMessageLabel.attributedText = attrMessage
        }
    }
    
    // MARK: - Confirm button customization
    override func customizeConfirmButton() {
        alertConfirmButton.addTarget(self, action: #selector(confirmButtonDidTapped(_:)), for: .touchUpInside)
        
        if let confirm = confirmButtonTitle {
            alertConfirmButton.setTitle(confirm, for: .normal)
        }
        
        if let color = confirmButtonColor {
            alertConfirmButton.backgroundColor = color
        }
    }
    
    override func showAlert() {
        let vc = UIApplication.shared.getTopViewController()
        vc.present(self, animated: true, completion: nil)
    }
    
    @IBAction override func confirmButtonDidTapped(_ sender: UIButton) {
        dismiss(animated: true) {
            let options: [HermesParam:String]
            let btnName = self.alertConfirmButton.currentTitle ?? "-"
            options = [.reason: "Dismissed on \(btnName) button tap"]
            self.delegate?.controllerConfirmButtonDidPressed(sender: self, options: options)
        }
    }
    
    // MARK: - Not implemented
    override func customizeTitleLabel() { }
    
    override func customizeCancelButton() { }
    
    override func customizeCheckboxImages() { }
    
    override func customizeCheckboxMessage() { }
    
    
}
