//
//  TagViewCell.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/23/20.
//

import UIKit

class TagViewCell: UICollectionViewCell {
    let itemTitleLabel = UILabel()
    let iconImageView = UIImageView()
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? .black : .white
            itemTitleLabel.textColor =  isSelected ? .white : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        iconImageView.tintColor = .init(hex: "#ff6961")
        addSubview(itemTitleLabel)
        addSubview(iconImageView)
        
        itemTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 15, paddingRight: 15, width: 0, height: 0, enableInsets: true)
        iconImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop:6, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 0, height: 0, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SectionHeader: UICollectionReusableView {
    let HeaderTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderTitle()
    }
    
    func setupHeaderTitle() {
        HeaderTitleLabel.textColor = .lightGray
        HeaderTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        HeaderTitleLabel.sizeToFit()
        addSubview(HeaderTitleLabel)
        
        HeaderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        HeaderTitleLabel.topAnchor.constraint(equalTo: self.topAnchor,  constant: 5).isActive = true
        HeaderTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        HeaderTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
