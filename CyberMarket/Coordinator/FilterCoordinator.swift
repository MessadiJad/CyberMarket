//
//  FilterCoordinator.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/23/20.
//

import UIKit

final class FilterCoordinator: Coordinator {

    fileprivate let navigationController: UINavigationController
    let filterViewController: FilterViewController

    init(navigationController: UINavigationController,items: [Item], categorys: [Category]) {
        self.navigationController = navigationController
        let viewModel = FilterViewModel(items: items, categorys: categorys)
        self.filterViewController = FilterViewController(viewModel)
    }

    deinit {
    }

    func start() {
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: self.filterViewController)
        navBarOnModal.modalPresentationStyle = .fullScreen

        self.navigationController.present(navBarOnModal, animated: true, completion: nil)
    }

}

