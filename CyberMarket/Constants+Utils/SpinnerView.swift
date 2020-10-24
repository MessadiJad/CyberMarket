import UIKit

class SpinnerView {
    var spinner = UIActivityIndicatorView(style: .white)
    var uiView = UIView()
    var containerView = UIView()
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
