//
//  DetailsItemCoordinator.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import UIKit

final class DetailsItemCoordinator: Coordinator {

    fileprivate let navigationController: UINavigationController
    fileprivate let detailsItemViewController: DetailsItemViewController

    init(navigationController: UINavigationController, item: Item, category: Category) {
        self.navigationController = navigationController
        let viewModel = DetailsItemViewModel(item: item, categoryName: category)
        self.detailsItemViewController = DetailsItemViewController(viewModel: viewModel)
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {
        self.navigationController.show(self.detailsItemViewController, sender: nil)
    }

}

