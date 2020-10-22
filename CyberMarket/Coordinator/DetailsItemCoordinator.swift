
import UIKit

protocol ProfileFlowCoordinatorDelegate:class { }

final class DetailsItemCoordinator: Coordinator {

    fileprivate let navigationController: UINavigationController
    fileprivate let detailsItemViewController: DetailsItemViewController

    fileprivate var isDetailsItemViewController: Bool {
        guard let isDetailsItemVC = navigationController.topViewController?.isKind(of: DetailsItemViewController.self) else { return false }
        return isDetailsItemVC
    }

    weak var delegate: ProfileFlowCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let viewModel = DetailsItemViewModel()
        self.detailsItemViewController = DetailsItemViewController(viewModel: viewModel)
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {


        self.navigationController.setViewControllers([self.detailsItemViewController], animated: false)



    }

    fileprivate func popViewController() {
        navigationController.popViewController(animated: true)
    }

}

