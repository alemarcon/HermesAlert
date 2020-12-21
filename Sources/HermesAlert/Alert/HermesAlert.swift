//
//  HermesAlert.swift
//  Hermes
//
//  Created by Alessandro Marcon on 20/11/2020.
//

import Foundation
import UIKit

public class Hermes {
    
    // Base view controller to show
    private var _alert: HermesAlertViewController?
    // Response delegate
    public var delegate: HermesAlertDelegate?
    
    // MARK: -  Initializer
    public init(title: String = "Hey!", message: String, checkboxMessage: String = "", alert: HermesAlertType = .simple) {
        switch alert {
        case .simple:
            _alert = HermesSimpleAlertViewController(message: message)
        case .twoButtons:
            _alert = HermesTwoButtonsAlertViewController(title: title, message: message)
        case .instagram:
            _alert = HermesInstagramAlertViewController(title: title, message: message)
        case .checkbox:
            _alert = HermesCheckboxViewController(title: title, message: message, checkboxMessage: checkboxMessage)
        case .textfield:
            _alert = HermesTextFieldAlertViewController(title: title, message: message)
        }
        
        _alert?.delegate = self
    }
    
    //MARK: - Icon
    /// Set an icon choosing from the Assets catalog
    /// - Parameter type: The image selected
    public func alertIcon(type of: AlertIconType) {
        var currentAlertColor = UIColor()
        
        _alert?.setAlertIcon(by: of.rawValue)
        switch of {
        case .error:
            currentAlertColor = UIColor.Hermes.error
        case .warning:
            currentAlertColor = UIColor.Hermes.warning
        case .success:
            currentAlertColor = UIColor.Hermes.success
        case .information:
            currentAlertColor = UIColor.Hermes.info
        }
        
        _alert?.setAlertTitleColor(currentAlertColor)
        _alert?.confirmButtonColor = currentAlertColor
    }
    
    /// Choose a custom image icon
    /// - Parameter image: Custom image
    public func customIcon(image: UIImage) {
        _alert?.setCustomIcon(from: image)
    }
    
    //MARK: - Confirm button
    /// Set custom color for confirm button
    /// - Parameter color: <#color description#>
    public func confirmButtonColor(_ color: UIColor) {
        _alert?.confirmButtonColor = color
    }
    
    /// Set custom confirm button title label
    /// - Parameter text: <#text description#>
    public func confirmButtonTitle(_ text: String) {
        _alert?.setConfirmButton(title: text)
    }
    
    //MARK: - Cancel button
    /// Set custom color for cancel button
    /// - Parameter color: Custom color
    public func cancelButtonColor(_ color: UIColor) {
        _alert?.setCancelButtonColor(color)
    }
    
    /// Set custom cancel button title label
    /// - Parameter text: <#text description#>
    public func cancelButtonTitle(_ text: String) {
        _alert?.setCancelButton(title: text)
    }
    
    //MARK: - Alert Title
    /// Set custom alert title label color
    /// - Parameter color: Color
    public func titleColor(_ color: UIColor) {
        _alert?.setAlertTitleColor(color)
    }
    
    /// Set custom alert title
    /// - Parameter text: Custom title
    public func title(_ text: String) {
        _alert?.setAlertTitle(text)
    }
    
    //MARK: - Checkbox message
    public func checkboxMessage(_ text: String) {
        _alert?.setCheckboxMessage(text)
    }
    
    //MARK: - Checkbox images
    
    /// Set custom image for checkbox. Image size is 30x30
    /// - Parameters:
    ///   - checked: Custom checked image
    ///   - unchecked: Custom unchecked image
    public func checkboxImages(checked: UIImage, unchecked: UIImage) {
        _alert?.setCheckboxImages(checked: checked, unchecked: unchecked)
    }
    
    //MARK: - Show methods
    /// Show view controller alert
    public func show() {
        _alert?.showAlert()
    }
    
}

//MARK: - Response delegate
extension Hermes: HermesAlertViewControllerResponseDelegate {
    
    func controllerConfirmButtonDidPressed(sender: HermesAlertViewController, options: [HermesParam:Any]?) {
        print("controllerConfirmButtonDidPressed \(options?[.reason] ?? "-")")
        delegate?.confirmButtonDidTapped(sender: sender, with: options)
    }
    
    func controllerCancelButtonDidPressed(sender: HermesAlertViewController, options: [HermesParam:Any]?) {
        print("controllerCancelButtonDidPressed")
        delegate?.cancelButtonDidTapped(sender: sender, with: options)
    }
    
}
