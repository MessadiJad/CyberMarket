//
//  ViewController.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import UIKit

class ListViewController: UITableViewController {
    
    
    let cellReuseIdendifier = "itemCellId"
    
    private let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        
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
        
    }
    
}

