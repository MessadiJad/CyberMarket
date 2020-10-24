//
//  TagView.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/23/20.
//

import UIKit

class TagViewCell: UICollectionViewCell {
    let itemTitleLabel = UILabel()
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? UIColor.black : UIColor.white
            itemTitleLabel.textColor =  isSelected ? UIColor.white : UIColor.black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        addSubview(itemTitleLabel)
        
        itemTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 15, paddingRight: 15, width: 0, height: 0, enableInsets: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
