//
//  ListCell.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import UIKit

class ItemCell: UITableViewCell {
    
    var item : Item? {
        didSet {
            self.itemImage.downloaded(from: item!.images_url)
            itemTitleLabel.text = item?.title
            let date = DateApp.dateLocal(fromString: (item?.creation_date)!, withFormat: .isoFull)
            itemCreatedDateLabel.text = DateApp.stringWithLocalTime(fromDate: date!, withFormat: .dateFormat)
            itemPriceLabel.text = String(item!.price) + " €"
        }
    }
    private let triangleView : TriangleView = {
        let triangleView = TriangleView()
        triangleView.backgroundColor = UIColor.clear
        return triangleView
    }()
    
    private let categoryView : UIView = {
        let categoryView = UIView()
        categoryView.backgroundColor = UIColor.red
        return categoryView
    }()
    
    
    private let itemTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let itemCreatedDateLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let itemPriceLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textAlignment = .right
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    private let itemImage : UIImageView = {
        let imgView = UIImageView(image:UIImage())
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(triangleView)
        addSubview(categoryView)
        addSubview(itemImage)
        addSubview(itemTitleLabel)
        addSubview(itemCreatedDateLabel)
        addSubview(itemPriceLabel)

        triangleView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50, enableInsets: false)
        
        categoryView.anchor(top: itemTitleLabel.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 300, enableInsets: false)
        
        itemImage.anchor(top: topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: Screen.width, height: 230, enableInsets: false)
        
        itemTitleLabel.anchor(top: nil, left: self.leftAnchor, bottom: bottomAnchor , right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 30, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)

        itemCreatedDateLabel.anchor(top: itemTitleLabel.bottomAnchor, left: self.leftAnchor, bottom: nil , right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
        
        itemPriceLabel.anchor(top: itemTitleLabel.bottomAnchor, left: nil, bottom: nil, right: itemCreatedDateLabel.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  

}
