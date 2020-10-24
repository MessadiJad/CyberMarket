//
//  Colors.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hexString).scanHexInt32(&int)
        let a, r, g, b: UInt32
        
        switch hexString.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

    static func randomColor(seed: String) -> UIColor {
        var total: Int = 0
        for u in seed.unicodeScalars {
            total += Int(UInt32(u))
        }
        srand48(total * 200)
        let r = CGFloat(drand48())
        srand48(total)
        let g = CGFloat(drand48())
        srand48(total / 200)
        let b = CGFloat(drand48())
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
