//
//  CustomInstagramStyleAlertViewController.swift
//  Poshmap
//
//  Created by Alessandro Marcon on 22/08/2019.
//  Copyright © 2019 Poshmap. All rights reserved.
//

import UIKit

class HermesInstagramAlertViewController: HermesAlertViewController {
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertConfirmButton: UIButton!
    @IBOutlet weak var alertCancelButton: UIButton!
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertMessageLabel: UILabel!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        super.init(nibName: HermesConst.IG_ALERT_XIB, bundle: Bundle(identifier: HermesConst.myBundle))
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, message: String) {
        self.init()
        alertTitle = title
        alertMessge = message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func customizeAlertInterface() {
        alertView.layer.masksToBounds = true
        alertView.layer.cornerRadius = 22.0
    }
    
    // MARK: - Title customization
    override func customizeTitleLabel() {
        
        // Check if there is a custom title and set it
        if let title = alertTitle {
            alertTitleLabel.text = title
        }
        
        if let titleColor = alertTitleColor {
            self.alertTitleLabel.textColor = titleColor
        }
    }
    
    // MARK: - Message customization
    override func customizeMessageLabel() {
        // Check if there is a custom message and set it
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
        
        // Check if there is a confirm custom title and set it
        if let confirm = confirmButtonTitle {
            alertConfirmButton.setTitle(confirm, for: .normal)
        }
        
    }
    
    // MARK: - Cancel button customization
    override func customizeCancelButton() {
        alertCancelButton.addTarget(self, action: #selector(cancelButtonDidTapped(_:)), for: .touchUpInside)
        
        // Check if there is a cancel custom title and set it
        if let confirm = cancelButtonTitle {
            alertCancelButton.setTitle(confirm, for: .normal)
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
    
    @IBAction override func cancelButtonDidTapped(_ sender: UIButton) {
        dismiss(animated: true) {
            let options: [HermesParam:String]
            let btnName = self.alertCancelButton.currentTitle ?? "-"
            options = [.reason: "Dismissed on \(btnName) button tap"]
            self.delegate?.controllerConfirmButtonDidPressed(sender: self, options: options)
        }
    }
    
    // MARK: - Not implemented
    override func customizeIcon() { }
    
    override func customizeCheckboxMessage() { }
    
    override func customizeCheckboxImages() { }
}
