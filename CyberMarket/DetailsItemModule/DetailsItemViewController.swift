//
//  DetailsItemViewController.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import UIKit

class DetailsItemViewController: UIViewController {
    
    var viewModel : DetailsItemViewModel
    
    let itemImageView = UIImageView()
    let itemNameLabel = UILabel()
    let itemDateLabel = UILabel()
    let itemDescriptionTextView = UITextView()
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
        setupImageItem(imageUrl: viewModel.thumbImageUrl!)
        setupItemNameLabel(name: viewModel.title)
        setupItemDateLabel(date: DateApp.stringWithLocalTime(fromDate: viewModel.creation_date!, withFormat: .dateFormat) )
        setupItemDiscriptionTextView(description: viewModel.description)
        setupItemPriceView(price: "  \(String(viewModel.price)) €")
        setupUrgentIndicator(urgent: viewModel.isUrgent)
        setupCategoryViewIndicator(color: viewModel.categoryName.color)
    }
    
    func setupImageItem(imageUrl: String) {
        itemImageView.contentMode = .scaleToFill
        itemImageView.downloaded(from: imageUrl)
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(itemImageView)
        
        itemImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 300, enableInsets: true)
    }
    
    func setupItemNameLabel(name: String){
        itemNameLabel.textColor = .black
        itemNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        itemNameLabel.textAlignment = .left
        itemNameLabel.numberOfLines = 0
        itemNameLabel.clipsToBounds = true
        itemNameLabel.text = name
        self.view.addSubview(itemNameLabel)
        
        itemNameLabel.anchor(top: itemImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
    }
    
    func setupItemDateLabel(date: String) {
        itemDateLabel.textColor = .darkGray
        itemDateLabel.font = UIFont.systemFont(ofSize: 13)
        itemDateLabel.textAlignment = .left
        itemDateLabel.numberOfLines = 0
        itemDateLabel.text = date
        self.view.addSubview(itemDateLabel)
        
        itemDateLabel.anchor(top: itemNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
    }
    
    func setupItemDiscriptionTextView(description: String) {
        itemDescriptionTextView.textColor = .black
        itemDescriptionTextView.font = UIFont.systemFont(ofSize: 15)
        itemDescriptionTextView.textAlignment = .justified
        itemDescriptionTextView.text = description
        itemDescriptionTextView.isSelectable = false
        itemDescriptionTextView.isEditable = false
        self.view.addSubview(itemDescriptionTextView)
        
        itemDescriptionTextView.anchor(top: itemDateLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right:  view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 70, paddingRight: 10, width: 0, height: 0, enableInsets: true)
    }
    
    func setupItemPriceView(price: String) {
        itemPriceButton.backgroundColor = viewModel.categoryName.color
        itemPriceButton.setTitle(price, for: .normal)
        itemPriceButton.setTitleColor(UIColor.white, for: .normal)
        if #available(iOS 13.0, *) {
            itemPriceButton.setImage(UIImage(systemName: "cart") , for: .normal)
        } else {
            itemPriceButton.setImage(UIImage(named: "cart-icon")?.withRenderingMode(.alwaysTemplate) , for: .normal)
        }
        itemPriceButton.tintColor = UIColor.white
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
        urgentImageView.tintColor = UIColor.red
        urgentImageView.contentMode = UIView.ContentMode.scaleAspectFit
        let rightBarButton = UIBarButtonItem(customView: urgentImageView)
        if urgent { self.navigationItem.rightBarButtonItem = rightBarButton }
    }
    
    func setupCategoryViewIndicator(color: UIColor) {
        categoryViewIndicator.backgroundColor = color
        self.view.addSubview(categoryViewIndicator)
        
        categoryViewIndicator.anchor(top: itemImageView.bottomAnchor, left: view.leftAnchor, bottom: itemDateLabel.bottomAnchor, right:  nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 0, enableInsets: true)
    }
    
}
