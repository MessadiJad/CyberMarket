import UIKit

protocol FilterViewControllerDelegate:class {
    func filterd(_ controller: FilterViewController, category_id: Int?,sort_id:Int?, active: Bool)
}

class FilterViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    weak var delegate: FilterViewControllerDelegate?
    var currentIndexPath : IndexPath?

    private var viewModel : FilterViewModel
    let applyFilterButton = UIButton()
    var resettBarButtonItem = UIBarButtonItem()
    let layout = TagFlowLayout()
    
    let reuseIdentifier = "cell"
    
    init(viewModel: FilterViewModel ) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: TagFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        collectionView.backgroundColor = UIColor.white
        self.title = "Filtre"
        let cancelBarButtonItem = UIBarButtonItem(title: "Annuler", style: .plain, target: self, action: #selector(closeFilter))
        cancelBarButtonItem.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem  = cancelBarButtonItem
        
        resettBarButtonItem = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(resetFilter))
        resettBarButtonItem.tintColor = UIColor.black
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
        self.applyFilterButton.backgroundColor = UIColor.lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        DispatchQueue.main.async { [self] in
            let savedCategoyId = UserDefaults.standard.integer(forKey: "category_id")
            if savedCategoyId != Int() {
                let indexPath = NSIndexPath(row: savedCategoyId - 1 , section: 0)
                    self.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
                resettBarButtonItem.isEnabled = true
            }
     
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            switch indexPath.section {
            case 0:
                sectionHeader.label.text = "Categorie"
            case 1:
                sectionHeader.label.text = "Tri"
            default:
                break
            }
             return sectionHeader
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TagViewCell
        switch indexPath.section {
        case 0:
            cell.itemTitleLabel.text = self.viewModel.categorys[indexPath.row].name
        case 1:
            cell.itemTitleLabel.text = self.viewModel.sortTitle[indexPath.row]
        default:
            break
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.applyFilterButton.isEnabled = true
        self.applyFilterButton.backgroundColor = UIColor.black
        resettBarButtonItem.isEnabled = true
        
        currentIndexPath = indexPath
        
    }
    
    func setupApplyFilterButton() {
        applyFilterButton.backgroundColor = UIColor.black
        applyFilterButton.setTitle("Appliquer", for: .normal)
        applyFilterButton.setTitleColor(UIColor.white, for: .normal)
        applyFilterButton.addTarget(self, action:  #selector(applyFilter), for: .touchUpInside)
        applyFilterButton.tintColor = UIColor.white
        self.view.addSubview(applyFilterButton)
        
        applyFilterButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right:  view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 70, enableInsets: true)
    }
    
    @objc func closeFilter() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func resetFilter() {
        self.applyFilterButton.isEnabled = false
        self.applyFilterButton.backgroundColor = UIColor.lightGray
        resettBarButtonItem.isEnabled = false
        self.collectionView.deselectAllItems(animated: true)
        UserDefaults.standard.removeObject(forKey: "category_id")
        delegate?.filterd(self, category_id: nil, sort_id: nil, active: false)
    }
    
    @objc func applyFilter(sender:UIButton){
        let category_id = viewModel.categorys[currentIndexPath!.row].id
        let sort_id = viewModel.sortId[currentIndexPath!.row]

        delegate?.filterd(self, category_id: category_id, sort_id: sort_id , active: true)
        let saveLastChoose = category_id! + sort_id
        UserDefaults.standard.set(saveLastChoose, forKey: "category_id")
        self.dismiss(animated: true, completion: nil)
    }
    
}
