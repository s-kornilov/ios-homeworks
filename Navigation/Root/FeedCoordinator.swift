import UIKit

class FeedCoordinator: Coordinator {
    var childs: [AppCoordinator] = []
    
    var parentCoordinator: MainCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: FeedViewController(coordinator: self))
        return rootViewController
    }
    
    
}
