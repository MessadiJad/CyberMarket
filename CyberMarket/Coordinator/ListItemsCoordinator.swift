//
//  ListItemsCoordinator.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import UIKit

final class ListItemsCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let listItemController: ListItemsViewController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let viewModel = ListViewModel()
        self.listItemController = ListItemsViewController(viewModel: viewModel)
    }
    
    deinit {
        print("deallocing \(self)")
    }
    
    func start() {
        navigationController.show(listItemController, sender: self)
    }
    
}




