//
//  AppCoordinator.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import UIKit

class Coordinator { }

final class AppCoordinator {
    
    fileprivate let navigationController: UINavigationController
    fileprivate var childCoordinators = [Coordinator]()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
    }
    
    func start() {
        let listItemsCoordinator = ListItemsCoordinator(navigationController: navigationController)
        listItemsCoordinator.start()
        childCoordinators.append(listItemsCoordinator)    
    }
    
}

