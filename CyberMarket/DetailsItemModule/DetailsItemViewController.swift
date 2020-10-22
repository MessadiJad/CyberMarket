//
//  DetailsItemViewController.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import UIKit

class DetailsItemViewController: UIViewController {

    private var viewModel : DetailsItemViewModel

    private let itemPriceLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .right
        lbl.numberOfLines = 0
        return lbl
    }()

    private let itemNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.clipsToBounds = true
        return lbl
    }()

    private let itemDateLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .right
        lbl.numberOfLines = 0
        return lbl
    }()

    private let itemDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    private let itemImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()

    private let urgentImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named:"urgent"))
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()

    // MARK: - INIT
    init(viewModel: DetailsItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    // MARK: - UI SETUP
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(itemImage)
        self.view.addSubview(urgentImage)
        self.view.addSubview(itemNameLabel)
        self.view.addSubview(itemDateLabel)
        self.view.addSubview(itemPriceLabel)
        self.view.addSubview(itemDescriptionLabel)

        self.view.backgroundColor = .white
     
        itemImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop:0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 300, enableInsets: true)
        urgentImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft:0, paddingBottom: 0, paddingRight: 0, width: 200, height: 200, enableInsets: true)
        itemNameLabel.anchor(top: itemImage.bottomAnchor, left: itemImage.leftAnchor, bottom: nil, right: itemImage.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
        itemDateLabel.anchor(top: itemNameLabel.bottomAnchor, left: itemImage.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
        itemPriceLabel.anchor(top: itemNameLabel.bottomAnchor, left: nil, bottom: nil, right:  itemImage.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
        itemDescriptionLabel.anchor(top: itemPriceLabel.bottomAnchor, left: itemImage.leftAnchor, bottom: view.bottomAnchor, right:  itemImage.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
        setupUI()

   }

    private func setupUI() {
        self.title = "viewModel.category.name"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        itemNameLabel.text = "viewModel.title"
        itemNameLabel.textColor = .white
        itemDescriptionLabel.text = "viewModel.description"
//        if let url =  viewModel.largeImageUrl {
//            _ = itemImage.loadImageUsingCache(withUrl: url)
//        }
//        if let date =  viewModel.getCreationDate() {
//            itemDateLabel.text = date
//        }
        itemPriceLabel.text = "viewModel.price)) €"
    }
}
