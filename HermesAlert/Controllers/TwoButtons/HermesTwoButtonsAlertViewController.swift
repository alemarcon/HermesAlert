//
//  CustomTwoButtonsAlertViewController.swift
//  Poshmap
//
//  Created by Alessandro Marcon on 15/04/2019.
//  Copyright © 2019 Poshmap. All rights reserved.
//

import UIKit

class HermesTwoButtonsAlertViewController: HermesAlertViewController {
    
    @IBOutlet weak var alertContainer: UIView!
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertMessageLabel: UILabel!
    @IBOutlet weak var alertConfirmButton: UIButton!
    @IBOutlet weak var alertCancelButton: UIButton!
    @IBOutlet weak var alertIconImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, message: String) {
        self.init()
        alertTitle = title
        alertMessge = message
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        let bundle = Bundle(for: HermesSimpleAlertViewController.classForCoder())
        super.init(nibName: HermesConst.TWO_BUTTON_XIB, bundle: bundle)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func customizeAlertInterface() {
        alertContainer.layer.masksToBounds = true
        alertContainer.layer.cornerRadius = 22.0
    }
    
    // MARK: - Icon customization
    override func customizeIcon() {
        if let image = icon {
            alertIconImageView.image = image
        }
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
    
    // MARK: - Cancel button customization
    override func customizeCancelButton() {
        alertCancelButton.addTarget(self, action: #selector(cancelButtonDidTapped(_:)), for: .touchUpInside)
        
        if let confirm = cancelButtonTitle {
            alertCancelButton.setTitle(confirm, for: .normal)
        }
    }
    
    
    @IBAction override func confirmButtonDidTapped(_ sender: UIButton) {
        dismiss(animated: true) {
            let options: [HermesParam:Any]
            let btnName = self.alertConfirmButton.currentTitle ?? "-"
            options = [.reason: "\(btnName) button tap"]
            self.delegate?.controllerConfirmButtonDidPressed(sender: self, options: options)
        }
    }
    
    @IBAction override func cancelButtonDidTapped(_ sender: UIButton) {
        dismiss(animated: true) {
            let options: [HermesParam:Any]
            let btnName = self.alertConfirmButton.currentTitle ?? "-"
            options = [.reason: "\(btnName) button tap"]
            self.delegate?.controllerCancelButtonDidPressed(sender: self, options: options)
        }
    }
    
    override func showAlert() {
        let vc = UIApplication.shared.getTopViewController()
        vc.present(self, animated: true, completion: nil)
    }
    
    //MARK: - Not implemented
    override func customizeCheckboxMessage() { }
    
    override func customizeCheckboxImages() { }
}
