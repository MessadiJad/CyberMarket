//
//  FilterViewController.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/23/20.
//

import UIKit

class FilterViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var viewModel : FilterViewModel
    private let applyFilterButton = UIButton()
    private var resettBarButtonItem = UIBarButtonItem()
    private let layout = TagFlowLayout()
    let reuseIdentifier = "cell"
    
    init(_ viewModel: FilterViewModel ) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: TagFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.title = NSLocalizedString("FILTRE_TITLE", comment: "")
        collectionView.backgroundColor = .white
        let cancelBarButtonItem = UIBarButtonItem(title: NSLocalizedString("ANNULER_BUTTON", comment: ""), style: .plain, target: self, action: #selector(closeFilter))
        cancelBarButtonItem.tintColor = .black
        self.navigationItem.rightBarButtonItem  = cancelBarButtonItem
        
        resettBarButtonItem = UIBarButtonItem(title: NSLocalizedString("RESET_BUTTON", comment: ""), style: .done, target: self, action: #selector(resetFilter))
        resettBarButtonItem.tintColor = .black
        resettBarButtonItem.isEnabled = false
        self.navigationItem.leftBarButtonItem  = resettBarButtonItem
        setupApplyFilterButton()
        collectionView.register(TagViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        collectionView.collectionViewLayout = layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 30)
        collectionView.allowsMultipleSelection = false
        self.applyFilterButton.isEnabled = false
        self.applyFilterButton.backgroundColor = .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        DispatchQueue.main.async { [self] in
            if viewModel.getSortId() != Int()  {
                let indexPath = NSIndexPath(row: viewModel.getSortId() - 1 , section: 1)
                self.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
            }
            if viewModel.getCategory() != Int() {
                let indexPath = NSIndexPath(row: viewModel.getCategory() - 1 , section: 0)
                self.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
            }
            resettBarButtonItem.isEnabled = true
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? SectionHeader {
                switch indexPath.section {
                case 0:
                    sectionHeader.HeaderTitleLabel.text = NSLocalizedString("CATEGORY_SECTION_TITLE", comment: "")
                case 1:
                    sectionHeader.HeaderTitleLabel.text = NSLocalizedString("SORT_SECTION_TITLE", comment: "")
                default:
                    break
                }
                return sectionHeader
            }
            return UICollectionReusableView()
        } else { 
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.viewModel.categorys.count
        case 1:
            return self.viewModel.sortTitle.count
        default:
            break
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as? TagViewCell {
            switch indexPath.section {
            case 0:
                cell.itemTitleLabel.text = self.viewModel.categorys[indexPath.row].name
            case 1:
                cell.itemTitleLabel.text = self.viewModel.sortTitle[indexPath.row]
                if indexPath.row == self.viewModel.sortTitle.count - 1{
                    cell.iconImageView.image = UIImage(named: "urgent_icon")?.withRenderingMode(.alwaysTemplate)
                }
            default:
                break
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.applyFilterButton.isEnabled = true
        if indexPath.section == 0 {
            self.applyFilterButton.backgroundColor = self.viewModel.categorys[indexPath.row].color
        }else {
            self.applyFilterButton.backgroundColor = .black
        }
        resettBarButtonItem.isEnabled = true
        viewModel.currentIndexPath = indexPath
    }
    
    func setupApplyFilterButton() {
        applyFilterButton.create(NSLocalizedString("APPLY_BUTTON", comment: ""), titleColor: .white, backgroundColor: .black)
        applyFilterButton.addTarget(self, action:  #selector(applyFilter), for: .touchUpInside)
        applyFilterButton.tintColor = .white
        self.view.addSubview(applyFilterButton)
        
        applyFilterButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right:  view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 70, enableInsets: true)
    }
    
    @objc func closeFilter() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func resetFilter() {
        self.applyFilterButton.isEnabled = false
        self.applyFilterButton.backgroundColor = .lightGray
        resettBarButtonItem.isEnabled = false
        self.collectionView.deselectAllItems(animated: true)
        self.viewModel.resetFilter()
        self.viewModel.filter(controller: self, category_id: nil, sort_id: nil, active: false)
    }
    
    @objc func applyFilter(sender:UIButton){
        guard let indexPath = viewModel.currentIndexPath else { return }
        if (indexPath.section == 0) {
            viewModel.removeSortId()
            viewModel.category_id = viewModel.categorys[indexPath.row].id
            viewModel.saveCategory(id: viewModel.category_id)
        }else {
            viewModel.removeCategoryId()
            viewModel.sort_id = viewModel.sortId[indexPath.row]
            viewModel.saveSortId(id: indexPath.row + 1)
        }
        self.viewModel.filter(controller: self, category_id: viewModel.category_id, sort_id: viewModel.sort_id , active: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}
