//
//  Colors.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import Foundation
import UIKit

struct Colors {
    
    static let white: UIColor = UIColor.white
    static let red: UIColor = UIColor.red
    static let green: UIColor = UIColor.green
    static let blue: UIColor = UIColor.blue
    static let black: UIColor = UIColor.black
    
    
}

extension UIColor {
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
