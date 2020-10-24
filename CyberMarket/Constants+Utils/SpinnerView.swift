import UIKit

class SpinnerView {
    var spinner = UIActivityIndicatorView(style: .white)
    var uiView = UIView()
    var containerView = UIView()
    var retryButton = UIButton()
    var currentWindow: UIWindow?

    func setup(uiView: UIView){
        containerView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        containerView.frame = CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = true

        spinner.color = .white
        containerView.addSubview(spinner)
        currentWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        currentWindow!.addSubview(containerView)
        spinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        currentWindow!.addSubview(retryButton)

        retryButton.backgroundColor = .clear
        retryButton.setTitle("Réessayer", for: .normal)
        retryButton.layer.borderWidth = 1
        retryButton.layer.borderColor = UIColor.white.cgColor
        retryButton.setTitleColor(UIColor.white, for: .normal)
        retryButton.setTitleColor(UIColor.black, for: .highlighted)

        retryButton.layer.cornerRadius = 20
        retryButton.anchor(top: nil, left: nil, bottom: currentWindow?.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 50, paddingRight: 0, width: 100, height: 40, enableInsets: false)
        retryButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true

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
}
