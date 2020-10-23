//
//  TagView.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/23/20.
//

import UIKit

class TagViewCell: UICollectionViewCell {
    let itemTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        itemTitleLabel.textColor = UIColor.black
        addSubview(itemTitleLabel)
        
    
        itemTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
