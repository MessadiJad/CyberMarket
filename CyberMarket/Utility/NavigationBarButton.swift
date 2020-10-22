//
//  NavigationBarButton.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//
import UIKit
import Foundation

public enum direction {
    case right
    case left
}
extension ListItemsViewController{
    
    func initNavigationBar() {
        self.title = AppName
        self.addNavigationBarButton(imageName:"arrow.clockwise" , direction:.left)
        self.addNavigationBarButton(imageName:"arrow.up.arrow.down" , direction:.right)
    }
    
    func addNavigationBarButton(imageName:String,direction:direction){
        var image = UIImage(systemName: imageName)
        image = image?.withRenderingMode(.alwaysOriginal)
        switch direction {
        case .left:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action:nil)
        case .right:
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action:nil)
        }
    }
        
}
