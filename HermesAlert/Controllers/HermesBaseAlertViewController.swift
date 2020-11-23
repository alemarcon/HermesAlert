//
//  HermesBaseAlertViewController.swift
//  Hermes
//
//  Created by Alessandro Marcon on 20/11/2020.
//

import UIKit

//MARK: - View controllers response delegate
protocol HermesBaseAlertViewControllerResponseDelegate {
    func confirmButtonDidPressed(sender: HermesAlertViewController, options: [String:String]?)
    func cancelButtonDidPressed(options: [String:String]?)
}

class HermesAlertViewController: UIViewController {
    
    // The response delegate object
    var delegate: HermesBaseAlertViewControllerResponseDelegate?
    // Alert message
    var customMessage = ""
    // Alert message as attributed string
    var customMessageAttributed = NSAttributedString()
    
    var icon: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureAlertInterface()
    }
    
    /// Configure alert graphic interface
    func configureAlertInterface() {
        fatalError("configureAlertInterface() has not been implemented")
    }
    
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
    
    /// Base function for confirm button of alert
    /// - Parameter sender: The button who send the action
    @IBAction func confirmButtonDidTapped(_ sender: UIButton) {
        fatalError("confirmButtonDidTapped() has not been implemented")
    }
    
    /// Base function for cancel button of alert
    /// - Parameter sender: The button who send the action
    @IBAction func cancelButtonDidTapped(_ sender: UIButton) {
        fatalError("cancelButtonDidTapped(_ :) has not been implemented")
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
