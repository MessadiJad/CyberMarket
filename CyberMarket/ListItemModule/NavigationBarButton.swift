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
        filterButton = UIButton(type: UIButton.ButtonType.custom)
        if #available(iOS 13.0, *) {
            filterButton.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        } else {
            filterButton.setImage(UIImage(named: "filter-icon"), for: .normal)
        }
        filterButton.addTarget(self, action:  #selector(didSelectFilter), for: UIControl.Event.touchUpInside)
        filterButton.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        filterButton.tintColor = .black

        let barButton = UIBarButtonItem(customView: filterButton)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    
}
