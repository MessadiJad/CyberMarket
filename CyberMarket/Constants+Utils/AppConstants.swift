//
//  AppConstants.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import UIKit

let Application                         = UIApplication.shared.delegate as! AppDelegate
var AppName: String {return Bundle.main.infoDictionary!["CFBundleName"] as! String}
var AppDisplayName: String {return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String}

let Screen                  = UIScreen.main.bounds.size
