//
//  NavigationBarButton.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//
import UIKit
import Foundation


extension ListItemsViewController{
    
    func initNavigationBar() {
        self.title = AppName
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        button.addTarget(self, action:  #selector(didSelectFilter), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        button.tintColor = UIColor.black

        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    
}
