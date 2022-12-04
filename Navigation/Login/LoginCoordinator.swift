import UIKit

class LoginCoordinator: Coordinator {
    var childs: [AppCoordinator] = []
    
    var parentCoordinator: MainCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: LoginViewController(coordinator: self))
        return rootViewController
    }
    

}

