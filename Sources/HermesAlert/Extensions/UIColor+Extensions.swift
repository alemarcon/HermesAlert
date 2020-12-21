//
//  UIColor+Extensions.swift
//  Hermes
//
//  Created by Alessandro Marcon on 20/11/2020.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
    struct Hermes {
        static let info = UIColor(hex: 0x49A7E8)
        static let warning = UIColor(hex: 0xE69F40)
        static let error = UIColor(hex: 0xC74F45)
        static let success = UIColor(hex: 0x60B157)
    }
}
