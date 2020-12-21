//
//  UIApplication+Extension.swift
//  Hermes
//
//  Created by Alessandro Marcon on 23/11/2020.
//

import Foundation
import UIKit

extension UIApplication {
    
    /// Get the top view controller
    func getTopViewController() -> UIViewController {
        return topViewControllerWithRootViewController(rootViewController: UIApplication.shared.windows[0].rootViewController!)
    }
    
    /// <#Description#>
    /// - Parameter rootViewController: <#rootViewController description#>
    private func topViewControllerWithRootViewController(rootViewController:UIViewController) -> UIViewController{
        if rootViewController is UITabBarController{
            let tabBarController = rootViewController as! UITabBarController
            return topViewControllerWithRootViewController(rootViewController: tabBarController.selectedViewController!)
        }
        if rootViewController is UINavigationController{
            let navBarController = rootViewController as! UINavigationController
            return topViewControllerWithRootViewController(rootViewController: navBarController.visibleViewController!)
        }
        if let presentedViewController = rootViewController.presentedViewController {
            return topViewControllerWithRootViewController(rootViewController: presentedViewController)
        }
        return rootViewController
    }
    
}
