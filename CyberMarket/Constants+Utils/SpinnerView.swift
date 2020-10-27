//
//  SpinnerView.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/26/20.
//

import UIKit

class SpinnerView {
    var spinner = UIActivityIndicatorView(style: .white)
    var uiView = UIView()
    var containerView = UIView()
    var retryButton = UIButton()
    var currentWindow: UIWindow?
    
    func setup(uiView: UIView){
        
        if let currentWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            currentWindow.addSubview(containerView)
            if !Reachability.isConnectedToNetwork() {
                currentWindow.addSubview(retryButton)
                retryButton.anchor(top: nil, left: nil, bottom: currentWindow.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 50, paddingRight: 0, width: 100, height: 40, enableInsets: false)
                retryButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
                
            }
        }
        
        containerView.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        containerView.frame = CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = true
        
        spinner.color = .white
        containerView.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        retryButton.create(NSLocalizedString("RETRY_BUTTON", comment: ""), titleColor: UIColor.white, backgroundColor: UIColor.clear)
        retryButton.addTarget(self, action:  #selector(postRetryService), for: UIControl.Event.touchUpInside)
        retryButton.layer.borderWidth = 1
        retryButton.layer.borderColor = UIColor.white.cgColor
        retryButton.setTitleColor(.black, for: .highlighted)
        
        retryButton.layer.cornerRadius = 20
    }
    
    func show(uiView: UIView) {
        setup(uiView: uiView)
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func hide(){
        spinner.isHidden = true
        spinner.stopAnimating()
        containerView.isHidden = true
        containerView.removeFromSuperview()
        spinner.removeFromSuperview()
        retryButton.removeFromSuperview()
    }
    
    func isHidden() -> Bool{
        if spinner.isHidden == false{
            return false
        }
        else{
            return true
        }
    }
    
    @objc func postRetryService() {
        NotificationCenter.default.post(name: Notification.Name("RetryServiceNotificationIdentifier"), object: nil)
    }
}
