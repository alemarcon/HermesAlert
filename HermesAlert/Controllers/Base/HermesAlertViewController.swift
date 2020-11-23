//
//  HermesBaseAlertViewController.swift
//  Hermes
//
//  Created by Alessandro Marcon on 20/11/2020.
//

import UIKit

//MARK: - View controllers response delegate
protocol HermesAlertViewControllerResponseDelegate {
    func controllerConfirmButtonDidPressed(sender: HermesAlertViewController, options: [HermesParam:Any]?)
    func controllerCancelButtonDidPressed(sender: HermesAlertViewController, options: [HermesParam:Any]?)
}

class HermesAlertViewController: UIViewController {
    
    // The response delegate object
    var delegate: HermesAlertViewControllerResponseDelegate?
    
    //MARK: - Alert title properties
    // Alert title
    var alertTitle: String?
    // Color for alert with title
    var alertTitleColor: UIColor?
    
    //MARK: - Alert message properties
    // Alert message
    var alertMessge: String?
    // Color for alert message
    var alertMessageColor: UIColor?
    // Alert message as attributed string
    var customMessageAttributed: NSAttributedString?
    
    //MARK: - Alert icon properties
    // Icon image
    var icon: UIImage?
    
    //MARK: - Alert cancel button properties
    // Custom cancel button title
    var cancelButtonTitle: String?
    // Confirm button background color
    var cancelButtonColor: UIColor?
    
    //MARK: - Alert confirm button properties
    // Custom confirm button title
    var confirmButtonTitle: String?
    // Confirm button background color
    var confirmButtonColor: UIColor?
    
    //MARK: - Alert Checkbox
    // Checkbox message
    var checkboxMessage: String?
    // Checkbox custom unchecked image
    var uncheckedImage: UIImage?
    // Checkbox custom hecked image
    var checkedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customizeAlertInterface()
        //Check and customize icon
        customizeIcon()
        //Check and customize title label
        customizeTitleLabel()
        //Check and customize message label
        customizeMessageLabel()
        //Check and customize checkbox message label
        customizeCheckboxMessage()
        //Check and customize checkbox images
        customizeCheckboxImages()
        //Check and customize confirm button
        customizeConfirmButton()
        //Check and customize cancel button
        customizeCancelButton()
    }
    
    /// Configure alert graphic interface
    func customizeAlertInterface() {
        fatalError("configureAlertInterface has not been implemented")
    }
    
    //MARK: - Icon
    /// Set the alert icon choosing from the set of existing icon
    /// - Parameter name: The name of icon to set
    func setAlertIcon(by name: String) {
        self.icon = UIImage(named: name, in: Bundle(for: HermesAlertViewController.self), compatibleWith: nil)
        
    }
    
    /// Set a custom icon
    /// - Parameter image: The custom icon to set
    func setCustomIcon(from image: UIImage) {
        self.icon = image
    }
    
    func customizeIcon() {
        fatalError("customizeIcon has not been implemented")
    }
    
    //MARK: - Title label
    /// Customize title color
    /// - Parameter color: UIColor for title
    func setAlertTitleColor(_ color: UIColor) {
        self.alertTitleColor = color
    }
    
    /// Customize alert title
    /// - Parameter text: Custom title
    func setAlertTitle(_ text: String) {
        self.alertTitle = text
    }
    
    func customizeTitleLabel() {
        fatalError("customizeTitleLabel has not been implemented")
    }
    
    //MARK: - Message label
    /// Customize title color
    /// - Parameter color: UIColor for title
    func setAlertMessageColor(_ color: UIColor) {
        self.alertMessageColor = color
    }
    
    /// Customize alert message
    /// - Parameter text: Custom title
    func setAlertMessageText(_ text: String) {
        self.alertTitle = text
    }
    
    func customizeMessageLabel() {
        fatalError("customizeMessageLabel has not been implemented")
    }
    
    //MARK: - Checkbox message
    
    /// Set custom checkbox message
    /// - Parameter text: Checkbox message
    func setCheckboxMessage(_ text: String) {
        self.checkboxMessage = text
    }
    
    /// Customize checkbox message
    func customizeCheckboxMessage() {
        fatalError("customizeCheckboxMessage has not been implemented")
    }
    
    //MARK: - Checkbox image
    /// <#Description#>
    /// - Parameters:
    ///   - checked: <#checked description#>
    ///   - unchecked: <#unchecked description#>
    func setCheckboxImages(checked: UIImage, unchecked: UIImage) {
        self.uncheckedImage = unchecked
        self.checkedImage = checked
    }
    
    /// Customize checkbox image
    func customizeCheckboxImages() {
        fatalError("customizeCheckboxImage has not been implemented")
    }

    //MARK: - Confirm button
    /// Customize confirm button title
    /// - Parameter title: New button title
    func setConfirmButton(title: String) {
        self.confirmButtonTitle = title
    }
    
    /// Set cancel button background color
    /// - Parameter color: UIColo for background
    func setConfirmButtonColor(_ color: UIColor) {
        self.confirmButtonColor = color
    }
    
    func customizeConfirmButton() {
        fatalError("customizeConfirmButton has not been implemented")
    }
    
    //MARK: - Cancel button
    /// Customize cancel button title
    /// - Parameter title: New button title
    func setCancelButton(title: String) {
        self.cancelButtonTitle = title
    }
    
    /// Set cancel button background color
    /// - Parameter color: UIColo for background
    func setCancelButtonColor(_ color: UIColor) {
        self.cancelButtonColor = color
    }
    
    func customizeCancelButton() {
        fatalError("customizeCancelButton has not been implemented")
    }
    
    //MARK: - Buttons actions
    /// Base function for confirm button of alert
    /// - Parameter sender: The button who send the action
    @IBAction func confirmButtonDidTapped(_ sender: UIButton) {

    }
    
    /// Base function for cancel button of alert
    /// - Parameter sender: The button who send the action
    @IBAction func cancelButtonDidTapped(_ sender: UIButton) {

    }
    
    //MARK: - Show methods
    /// Show alert in current view controller
    func showAlert() {
        fatalError("showViewController has not been implemented")
    }
}

// MARK: - Transition delegate
extension HermesAlertViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BounceAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeOutAnimationController()
    }
}
