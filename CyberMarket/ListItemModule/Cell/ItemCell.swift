//
//  ListCell.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import UIKit

class ItemCell: UITableViewCell {
    var urgentImageView = UIImageView()
    let itemTitleLabel = UILabel()
    let itemCreatedDateLabel = UILabel()
    let itemPriceLabel = UILabel()
    var itemImage = UIImageView()
    let categoryView = UIView()
    
    var category : Category? {
        didSet {
            setupCategoryView(color: category!.color)
            itemPriceLabel.backgroundColor = category!.color
        }
    }
    
    var item : Item? {
        didSet {
            setupUrgentIcon(urgent: item!.is_urgent)
            setupItemImage(imageUrl: item!.images_url)
            setupItemTitleLabel(title: item!.title)
            setupItemCreatedDateLabel(date: DateApp.dateLocal(fromString: (item?.creation_date)!, withFormat: .isoFull)!)
            setupItemPriceLabel(price:  String(item!.price) + " €")
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUrgentIcon(urgent: Bool){
        if #available(iOS 13.0, *) {
            urgentImageView.image = UIImage(systemName: "exclamationmark.triangle")?.withRenderingMode(.alwaysTemplate)
        } else {
            urgentImageView.image = UIImage(named: "urgent-icon")?.withRenderingMode(.alwaysTemplate)
        }
        urgentImageView.tintColor = UIColor.red
        urgentImageView.contentMode = UIView.ContentMode.scaleAspectFit
        urgentImageView.layer.masksToBounds = true
        urgentImageView.isHidden = !urgent
        addSubview(urgentImageView)
        urgentImageView.anchor(top: self.topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 35, height: 35, enableInsets: false)
    }
    
    func setupCategoryView(color: UIColor){
        categoryView.backgroundColor = color
        addSubview(categoryView)
        
        categoryView.anchor(top: self.topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 15, height: 0, enableInsets: true)
    }
    
    func setupItemImage(imageUrl: String){
        itemImage = UIImageView(image:UIImage())
        itemImage.contentMode = .scaleToFill
        itemImage.downloaded(from: imageUrl)
        addSubview(itemImage)
        
        itemImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Screen.width, height: 230, enableInsets: false)
    }
    
    func setupItemTitleLabel(title: String){
        itemTitleLabel.textColor = .black
        itemTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        itemTitleLabel.textAlignment = .left
        itemTitleLabel.numberOfLines = 0
        itemTitleLabel.text = title
        addSubview(itemTitleLabel)
        
        itemTitleLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor , right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 30, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
    }
    
    func setupItemCreatedDateLabel(date: Date){
        itemCreatedDateLabel.text = DateApp.stringWithLocalTime(fromDate: date, withFormat: .dateFormat)
        itemCreatedDateLabel.textColor = .lightGray
        itemCreatedDateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        itemCreatedDateLabel.textAlignment = .left
        itemCreatedDateLabel.text = DateApp.stringWithLocalTime(fromDate: date, withFormat: .dateFormat)
        addSubview(itemCreatedDateLabel)
        
        itemCreatedDateLabel.anchor(top: itemTitleLabel.bottomAnchor, left: self.leftAnchor, bottom: nil , right: nil, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
    }
    
    func setupItemPriceLabel(price: String){
        itemPriceLabel.textColor = .white
        itemPriceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        itemPriceLabel.textAlignment = .center
        itemPriceLabel.numberOfLines = 0
        itemPriceLabel.text = price
        addSubview(itemPriceLabel)
        
        itemPriceLabel.anchor(top: nil, left: nil, bottom: self.bottomAnchor, right:self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 80, height: 35, enableInsets: false)
    }
    
}
