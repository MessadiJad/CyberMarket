//
//  DetailsItemViewController.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import UIKit

class DetailsItemViewController: UIViewController {
    
    var viewModel : DetailsItemViewModel
    var scrollView = UIScrollView()
    let itemImageView = UIImageView()
    let itemNameLabel = UILabel()
    let itemDateLabel = UILabel()
    let itemDescriptionLabel = UILabel()
    let itemPriceButton = UIButton()
    var urgentImageView = UIImageView()
    var categoryViewIndicator = UIView()
    
    init(viewModel: DetailsItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = viewModel.categoryName.name
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        self.navigationController?.navigationBar.tintColor = .black
        setupUI()
    }
    
    private func setupUI() {
        setupScrollView()
        if let thumbImageUrl = viewModel.thumbImageUrl {
            setupImageItem(imageUrl: thumbImageUrl)
        }
        setupItemNameLabel(name: viewModel.title)
        if let creation_date = viewModel.creation_date {
            setupItemDateLabel(date: DateApp.stringWithLocalTime(fromDate: creation_date, withFormat: .dateFormat) )
        }
        setupItemDiscriptionLabel(description: viewModel.description)
        setupItemPriceView(price: "  \(String(viewModel.price)) €")
        setupUrgentIndicator(urgent: viewModel.isUrgent)
        setupCategoryViewIndicator(color: viewModel.categoryName.color)
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
    }
    
    func setupImageItem(imageUrl: String) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.clipsToBounds = true
        itemImageView.downloaded(from: imageUrl)
        scrollView.addSubview(itemImageView)
        
        itemImageView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 300, enableInsets: true)
    }
    
    func setupItemNameLabel(name: String){
        itemNameLabel.textColor = .black
        itemNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        itemNameLabel.textAlignment = .left
        itemNameLabel.numberOfLines = 0
        itemNameLabel.clipsToBounds = true
        itemNameLabel.text = name
        scrollView.addSubview(itemNameLabel)
        
        itemNameLabel.anchor(top: itemImageView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
    }
    
    func setupItemDateLabel(date: String) {
        itemDateLabel.textColor = .darkGray
        itemDateLabel.font = UIFont.systemFont(ofSize: 13)
        itemDateLabel.textAlignment = .left
        itemDateLabel.numberOfLines = 10
        itemDateLabel.text = date
        scrollView.addSubview(itemDateLabel)
        
        itemDateLabel.anchor(top: itemNameLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
    }
    
    func setupItemDiscriptionLabel(description: String) {
        scrollView.addSubview(itemDescriptionLabel)

        itemDescriptionLabel.textColor = .black
        itemDescriptionLabel.font = UIFont.systemFont(ofSize: 17)
        itemDescriptionLabel.numberOfLines = 0
        itemDescriptionLabel.textAlignment = .left
        itemDescriptionLabel.text = description
        
        itemDescriptionLabel.anchor(top: itemDateLabel.bottomAnchor, left: itemImageView.leftAnchor, bottom: scrollView.bottomAnchor, right:  view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom:80, paddingRight: 10, width: 0, height: 0, enableInsets: true)
        
    }
    
    func setupItemPriceView(price: String) {
        itemPriceButton.create(price, titleColor: .white, backgroundColor: viewModel.categoryName.color)
        if #available(iOS 13.0, *) {
            itemPriceButton.setImage(UIImage(systemName: "cart") , for: .normal)
        } else {
            itemPriceButton.setImage(UIImage(named: "cart-icon")?.withRenderingMode(.alwaysTemplate) , for: .normal)
        }
        itemPriceButton.tintColor = .white
        self.view.addSubview(itemPriceButton)
        
        itemPriceButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right:  view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 70, enableInsets: true)
    }
    
    func setupUrgentIndicator(urgent: Bool) {
        urgentImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        if #available(iOS 13.0, *) {
            urgentImageView.image = UIImage(systemName: "exclamationmark.triangle")?.withRenderingMode(.alwaysTemplate)
        } else {
            urgentImageView.image = UIImage(named: "urgent-icon")?.withRenderingMode(.alwaysTemplate)
        }
        urgentImageView.tintColor = .red
        urgentImageView.contentMode = UIView.ContentMode.scaleAspectFit
        let rightBarButton = UIBarButtonItem(customView: urgentImageView)
        if urgent { self.navigationItem.rightBarButtonItem = rightBarButton }
    }
    
    func setupCategoryViewIndicator(color: UIColor) {
        categoryViewIndicator.backgroundColor = color
        scrollView.addSubview(categoryViewIndicator)
        
        categoryViewIndicator.anchor(top: itemImageView.bottomAnchor, left: scrollView.leftAnchor, bottom: itemDateLabel.bottomAnchor, right:  nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, enableInsets: true)
    }
    
}
