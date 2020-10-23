import UIKit

class FilterViewController: UICollectionViewController {
    private var viewModel : FilterViewModel
    let applyFilterButton = UIButton()
    let reuseIdentifier = "cell"
    
    init(viewModel: FilterViewModel ) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
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
        
        let resettBarButtonItem = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(resetFilter))
        resettBarButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem  = resettBarButtonItem
        setupApplyFilterButton()
        collectionView.register(TagViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
               flowLayout.estimatedItemSize = CGSize(width: 1, height:1)
           }
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 20, left: 8, bottom: 5, right: 8)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.categorys.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TagViewCell
        cell.itemTitleLabel.text = self.viewModel.categorys[indexPath.row].name
        cell.sizeToFit()
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print("You selected cell #\(indexPath.item)!")
    }
    
    func setupApplyFilterButton() {
        applyFilterButton.backgroundColor = UIColor.black
        applyFilterButton.setTitle("Appliquer", for: .normal)
        applyFilterButton.setTitleColor(UIColor.white, for: .normal)
        applyFilterButton.tintColor = UIColor.white
        self.view.addSubview(applyFilterButton)
        
        applyFilterButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right:  view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 5, height: 70, enableInsets: true)
    }
    
    @objc func closeFilter() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func resetFilter() {
    }
}
