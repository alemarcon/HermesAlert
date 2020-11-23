//
//  HermesAlertDelegate.swift
//  Hermes
//
//  Created by Alessandro Marcon on 20/11/2020.
//

import Foundation
import UIKit

//MARK: - Hermes button delegate
public protocol HermesAlertDelegate {
    
    /// Confirm button operation delegate
    /// - Parameter options: <#options description#>
    func confirmButtonDidTapped(sender: UIViewController, with options: [HermesParam:Any]?)
    
    /// Cancel button operation delegate
    /// - Parameter options: <#options description#>
    func cancelButtonDidTapped(sender: UIViewController, with options: [HermesParam:Any]?)
}

//MARK: - Hermes delegate default implementation
public extension HermesAlertDelegate {
    
    // cancelButtonDidTapped has a default implementation because is not present in all alert
    // If user want to intercept cancel button, must implement this
    func cancelButtonDidTapped(sender: UIViewController, with options: [HermesParam:Any]?) {
        print("cancelButtonDidTapped(options:) default imlementations")
    }
}
