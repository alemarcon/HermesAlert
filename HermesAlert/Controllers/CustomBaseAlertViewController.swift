//
//  CustomBaseAlertViewController.swift
//  Hermes
//
//  Created by Alessandro Marcon on 12/04/2019.
//  Copyright © 2019 Hermes. All rights reserved.
//

import UIKit

class HermesBasicAlertViewController: HermesAlertViewController {
    
    public enum BaseAlertButtonType {
        case dismissed
        case delegated
    }
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var alertIcon: UIImageView!
    
    var buttonType: BaseAlertButtonType = .dismissed
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        print("init nibName style")
        super.init(nibName: "CustomBaseAlertView", bundle: Bundle(identifier: "com.marcon.Hermes"))
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    convenience init(message: String = "", buttonType: BaseAlertButtonType) {
        self.init()
        customMessage = message
        self.buttonType = buttonType
    }
    
    convenience init(message: NSAttributedString, buttonType: BaseAlertButtonType) {
        self.init()
        customMessageAttributed = message
        self.buttonType = buttonType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.addTarget(self, action: #selector(confirmButtonDidTapped(_:)), for: .touchUpInside)
        
        if let image = icon {
            alertIcon.image = image
        }
    }
    
    override func configureAlertInterface() {
        alertView.layer.masksToBounds = true
        alertView.layer.cornerRadius = 22.0
        if( customMessage != "" ) {
            messageLabel.text = customMessage
        } else {
            messageLabel.attributedText = customMessageAttributed
        }
    }
    
    @IBAction override func confirmButtonDidTapped(_ sender: UIButton) {
        if( buttonType == .dismissed ) {
            dismiss(animated: true, completion: nil)
        } else {
            delegate?.confirmButtonDidPressed(sender: self, options: nil)
        }
    }
    
    
}

//protocol CustomBaseAlertViewControllerDelegate : class {
//    func confirmButtonDidTap(_ sender: CustomBaseAlertViewController)
//}
