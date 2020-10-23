import UIKit

class Coordinator { }

final class AppCoordinator {

    fileprivate let navigationController: UINavigationController
    fileprivate var childCoordinators = [Coordinator]()

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {
        let listItemsCoordinator = ListItemsCoordinator(navigationController: navigationController)
        listItemsCoordinator.start()
        childCoordinators.append(listItemsCoordinator)    
    }

}

