//
//  ViewController.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import UIKit


class ListItemsViewController: UITableViewController {
    
    let cellReuseIdendifier = "itemCellId"
    
    private var viewModel = ListViewModel()
    var detailsCoordinator: DetailsItemCoordinator?
    var filterCoordinator: FilterCoordinator?
    let spinnerView = SpinnerView()
    var filterButton = UIButton()
    
    init(viewModel: ListViewModel ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        spinnerView.show(uiView: self.view)
        
        self.initNavigationBar()
        tableView.backgroundColor = .init(hex: "#f0f0f0")
        tableView.tableFooterView = UIView()
        tableView.register(ItemCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        fetchData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(fetchData), name: Notification.Name("RetryServiceNotificationIdentifier"), object: nil)

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    @objc func fetchData()  {
        viewModel.getCategory{ loaded in
            DispatchQueue.main.async { [self] in
            self.tableView.reloadData()
            }
        }
        
        viewModel.getItemList { loaded in
            if loaded {
                DispatchQueue.main.async { [self] in
                    spinnerView.hide()
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (viewModel.filteredItems.count == 0) {
            filterButton.isEnabled = false
        }else{ filterButton.isEnabled = true }
        return viewModel.filteredItems.count
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as? ItemCell {
            cell.item = viewModel.filteredItems[indexPath.row]
            if let list_category_id = viewModel.filteredItems[indexPath.row].category_id {
                cell.category = viewModel.categorys[list_category_id - 1]
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 8
        let horizentalPadding: CGFloat = 8
        
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.white.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: horizentalPadding/2, dy: verticalPadding/2)
        maskLayer.cornerRadius = 15
        cell.layer.mask = maskLayer
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigationController = self.navigationController {
            detailsCoordinator = DetailsItemCoordinator(navigationController: navigationController , item: self.viewModel.filteredItems[indexPath.row], category: self.viewModel.categorys[self.viewModel.filteredItems[indexPath.row].category_id - 1])
            detailsCoordinator?.start()
        }
    }
    
    @objc func didSelectFilter() {
        if let navigationController = self.navigationController {
            filterCoordinator = FilterCoordinator(navigationController: navigationController, items: viewModel.items, categorys: self.viewModel.categorys)
            filterCoordinator?.filterViewController.viewModel.delegate =  self.viewModel
            filterCoordinator?.start()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
}

