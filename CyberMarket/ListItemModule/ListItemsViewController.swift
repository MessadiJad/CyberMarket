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

    
    init(viewModel: ListViewModel ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        initNavigationBar()
        tableView.backgroundColor = UIColor.init(hex: "#EBEBEB")
        tableView.register(ItemCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        viewModel.getItemList { loaded in
            if loaded {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! ItemCell
        cell.item = viewModel.items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailsCoordinator = DetailsItemCoordinator(navigationController: self.navigationController!, item: self.viewModel.items[indexPath.row], category: self.viewModel.categorys[self.viewModel.items[indexPath.row].category_id - 1])
        detailsCoordinator?.start()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 5

        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.white.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)

    }
}
