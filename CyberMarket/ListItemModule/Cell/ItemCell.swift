//
//  ItemCell.swift
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
            if let catg = category {
                setupCategoryView(color: catg.color)
                itemPriceLabel.backgroundColor = catg.color
            }
        }
    }
    
    var item : Item? {
        didSet {
            if let itm = item {
                setupUrgentIcon(urgent: itm.is_urgent)
                setupItemImage(imageUrl: itm.images_url)
                setupItemTitleLabel(title: itm.title)
                setupItemPriceLabel(price:  String(itm.price) + " €")
                if let date = DateApp.dateLocal(fromString: itm.creation_date, withFormat: .isoFull) {
                    setupItemCreatedDateLabel(date: date)
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUrgentIcon(urgent: Bool){
        urgentImageView.image = UIImage(named: "urgent_icon")?.withRenderingMode(.alwaysTemplate)
        urgentImageView.tintColor = .init(hex: "#ff6961")
        urgentImageView.contentMode = UIView.ContentMode.scaleAspectFit
        urgentImageView.layer.masksToBounds = true
        urgentImageView.isHidden = !urgent
        addSubview(urgentImageView)
        urgentImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 30, height: 30, enableInsets: false)
    }
    
    func setupCategoryView(color: UIColor){
        categoryView.backgroundColor = color
        addSubview(categoryView)
        
        categoryView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 15, height: 0, enableInsets: true)
    }
    
    func setupItemImage(imageUrl: String){
        itemImage.removeFromSuperview()
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
        
        itemTitleLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor , right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 30, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    func setupItemCreatedDateLabel(date: Date){
        itemCreatedDateLabel.text = DateApp.stringWithLocalTime(fromDate: date, withFormat: .dateFormat)
        itemCreatedDateLabel.textColor = .lightGray
        itemCreatedDateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        itemCreatedDateLabel.textAlignment = .left
        itemCreatedDateLabel.text = DateApp.stringWithLocalTime(fromDate: date, withFormat: .dateFormat)
        addSubview(itemCreatedDateLabel)
        
        itemCreatedDateLabel.anchor(top: itemTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil , right: itemPriceLabel.leftAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    func setupItemPriceLabel(price: String){
        itemPriceLabel.textColor = .white
        itemPriceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        itemPriceLabel.textAlignment = .center
        itemPriceLabel.numberOfLines = 0
        itemPriceLabel.text = price
        addSubview(itemPriceLabel)
        
        itemPriceLabel.anchor(top: nil, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 80, height: 35, enableInsets: false)
    }
    
}
