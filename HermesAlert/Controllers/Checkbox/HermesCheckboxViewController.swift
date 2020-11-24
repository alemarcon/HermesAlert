//
//  CustomBaseAlertRememberViewController.swift
//  Poshmap
//
//  Created by Alessandro Marcon on 30/08/2019.
//  Copyright © 2019 Poshmap. All rights reserved.
//

import UIKit

class HermesCheckboxViewController: HermesAlertViewController {
    
    @IBOutlet var alertView: UIView!
    @IBOutlet var alertTitleLabel: UILabel!
    @IBOutlet var alertMessageLabel: UILabel!
    @IBOutlet var alertCheckboxButton: UIButton!
    @IBOutlet var alertCheckboxMessage: UILabel!
    @IBOutlet var alertConfirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let bundle = Bundle(for: HermesSimpleAlertViewController.classForCoder())
        super.init(nibName: HermesConst.CHECKBOX_XIB, bundle: bundle)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    convenience init(title: String, message: String, checkboxMessage: String) {
        self.init()
        alertTitle = title
        alertMessge = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func customizeAlertInterface() {
        let bundle = Bundle(for: HermesSimpleAlertViewController.classForCoder())
        alertCheckboxButton.setImage(UIImage(named: "checked", in: bundle, compatibleWith: nil), for: .selected)
        alertCheckboxButton.setImage(UIImage(named: "circle", in: bundle, compatibleWith: nil), for: .normal)
        
        alertView.layer.masksToBounds = true
        alertView.layer.cornerRadius = 22.0
    }
    
    // MARK: - Title customization
    override func customizeTitleLabel() {
        
        if let title = alertTitle {
            alertTitleLabel.text = title
        }
        
        if let titleColor = alertTitleColor {
            self.alertTitleLabel.textColor = titleColor
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
    
    //MARK: - Checkbox customization
    /// Set a custom message for checkbox
    override func customizeCheckboxMessage() {
        if let message = checkboxMessage {
            alertCheckboxMessage.text = message
        }
    }
    
    /// Set custom images for check and uncheck image status
    override func customizeCheckboxImages() {
        if let checked = checkedImage {
            alertCheckboxButton.setImage(checked, for: .selected)
        }
        
        if let unchecked = uncheckedImage {
            alertCheckboxButton.setImage(unchecked, for: .normal)
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
    
    /// <#Description#>
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func showPreference(_ sender: UIButton) {
        alertCheckboxButton.isSelected = !alertCheckboxButton.isSelected
    }
    
    @IBAction override func confirmButtonDidTapped(_ sender: UIButton) {
        dismiss(animated: true) {
            let btnName = self.alertConfirmButton.currentTitle ?? "-"
            let options: [HermesParam:Any]
            options = [
                .reason: "\(btnName) button tap",
                .checked: self.alertCheckboxButton.state == .selected ? true : false
            ]
            self.delegate?.controllerConfirmButtonDidPressed(sender: self, options: options)
        }
    }
    
    override func showAlert() {
        let vc = UIApplication.shared.getTopViewController()
        vc.present(self, animated: true, completion: nil)
    }
    
    //MARK: - Unused
    override func customizeCancelButton() { }
    
    override func customizeIcon() { }
    
}
